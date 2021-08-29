import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:money_buddy_mobile/authentication/ui/sign_in_page.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';
import 'package:money_buddy_mobile/model/user_model.dart';
import 'package:money_buddy_mobile/ui/landing_page.dart';
import 'package:money_buddy_mobile/widgets/loading.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();

  /// Text editing controllers
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  /// Firebase instances
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  /// Collection references
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final RxBool merchant = false.obs;

  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();

  String _selectedRole = 'Select a Role';
  String get selectedRole => _selectedRole;

  @override
  void onReady() async {
    /// Run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  void setSelectedRole(dynamic role) {
    _selectedRole = role;
    update();
  }

  void handleAuthChanged(_firebaseUser) async {
    if (_firebaseUser?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
      await isMerchant();
    }

    if (_firebaseUser == null) {
      Get.offAll(() => SignInPage());
    } else {
      Get.offAll(() => LandingPage());
    }
  }

  /// Firebase user one-time fetch
  Future<User> get getUser async => _firebaseAuth.currentUser!;

  /// Firebase user a realtime stream
  Stream<User?> get user => _firebaseAuth.authStateChanges();

  /// Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    print('streamFirestoreUser()');

    return _firebaseFirestore
        .collection("users")
        .doc(firebaseUser.value!.uid)
        .snapshots()
        .map(
          (snapshot) => UserModel.fromData(
            snapshot.data()!,
          ),
        );
  }

  /// Get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    return _firebaseFirestore
        .collection("users")
        .doc(firebaseUser.value!.uid)
        .get()
        .then(
          (documentSnapshot) => UserModel.fromData(
            documentSnapshot.data()!,
          ),
        );
  }

  /// Updates the firestore user in users collection
  void updateUserFirestore({required UserModel user}) {
    _firebaseFirestore
        .collection("users")
        .doc(firebaseUser.value!.uid)
        .update(user.data(user: user));
    update();
  }

  /// Updates the firestore user in users collection
  void _updateUserFirestore(UserModel user, User _firebaseUser) {
    _firebaseFirestore
        .collection("users")
        .doc(_firebaseUser.uid)
        .update(user.toJson());
    update();
  }

  /// Create the firestore user in users collection
  void _createUserFirestore(UserModel user, User _firebaseUser) {
    _firebaseFirestore
        .collection("users")
        .doc(_firebaseUser.uid)
        .set(user.toJson());
    update();
  }

  /// Method to handle user sign in using email and password
  void signInWithEmailAndPassword(BuildContext context) async {
    showLoadingIndicator();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim());
      emailTextController.clear();
      passwordTextController.clear();
      hideLoadingIndicator();
    } catch (error) {
      hideLoadingIndicator();
      Get.snackbar(
        'Incorrect Email or Password'.tr,
        'The email or password you entered is incorrect. Please try again.'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 7),
        backgroundColor: Colors.red,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    }
  }

  /// Check if username exists
  Future<bool> checkUsername({required String username}) {
    return _usersCollectionReference
        .where('username', isEqualTo: username)
        .get()
        .then((value) {
      if (value.docs.length > 0) {
        return true;
      } else {
        return false;
      }
    });
  }

  /// User registration using email and password
  void registerWithEmailAndPassword(BuildContext context) async {
    showLoadingIndicator();
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text)
          .then((result) async {
        print('uID: ' + result.user!.uid.toString());
        print('email: ' + result.user!.email.toString());

        /// Create the new user object
        UserModel _newUser = UserModel(
          id: result.user!.uid,
          email: result.user!.email!,
          username: result.user!.email!,
          userRole: 'User',
          photoUrl: '',
          points: '0',
        );

        /// Create the user in firestore
        _createUserFirestore(_newUser, result.user!);
        emailTextController.clear();
        passwordTextController.clear();
        hideLoadingIndicator();
      });
    } on FirebaseAuthException catch (error) {
      hideLoadingIndicator();
      Get.snackbar(
        'auth.signUpErrorTitle'.tr,
        error.message!,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 10),
        backgroundColor: kSecondaryColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    }
  }

  /// Handles updating the user when updating profile
  Future<void> changeUserEmail(BuildContext context, UserModel user,
      String oldEmail, String password) async {
    String _authUpdateUserNoticeTitle = 'auth.updateUserSuccessNoticeTitle'.tr;
    String _authUpdateUserNotice = 'auth.updateUserSuccessNotice'.tr;
    try {
      showLoadingIndicator();
      try {
        await _firebaseAuth
            .signInWithEmailAndPassword(email: oldEmail, password: password)
            .then((_firebaseUser) {
          _firebaseUser.user!
              .updateEmail(user.email)
              .then((value) => _updateUserFirestore(user, _firebaseUser.user!));
        });
      } catch (err) {
        print('Caught error: $err');
        if (err ==
            "Error: [firebase_auth/email-already-in-use] The email address is already in use by another account.") {
          _authUpdateUserNoticeTitle = 'auth.updateUserEmailInUse'.tr;
          _authUpdateUserNotice = 'auth.updateUserEmailInUse'.tr;
        } else {
          _authUpdateUserNoticeTitle = 'auth.wrongPasswordNotice'.tr;
          _authUpdateUserNotice = 'auth.wrongPasswordNotice'.tr;
        }
      }
      hideLoadingIndicator();
      Get.snackbar(
        _authUpdateUserNoticeTitle,
        _authUpdateUserNotice,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5),
        backgroundColor: kSecondaryColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    } on PlatformException catch (error) {
      hideLoadingIndicator();
      print(error.code);
      String authError;
      switch (error.code) {
        case 'ERROR_WRONG_PASSWORD':
          authError = 'auth.wrongPasswordNotice'.tr;
          break;
        default:
          authError = 'auth.unknownError'.tr;
          break;
      }
      Get.snackbar(
        'auth.wrongPasswordNoticeTitle'.tr,
        authError,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 10),
        backgroundColor: kSecondaryColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    }
  }

  /// Password reset email
  Future<void> sendPasswordResetEmail(BuildContext context) async {
    showLoadingIndicator();
    try {
      await _firebaseAuth.sendPasswordResetEmail(
          email: emailTextController.text);
      hideLoadingIndicator();
      Get.snackbar(
        'auth.resetPasswordNoticeTitle'.tr,
        'auth.resetPasswordNotice'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5),
        backgroundColor: kSecondaryColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    } on FirebaseAuthException catch (error) {
      hideLoadingIndicator();
      Get.snackbar(
        'auth.resetPasswordFailed'.tr,
        error.message!,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 10),
        backgroundColor: kSecondaryColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    }
  }

  /// Check if user is a merchant
  Future<void> isMerchant() async {
    await getFirestoreUser().then((user) async {
      if (user.userRole == 'Merchant') {
        merchant.value = true;
      } else {
        merchant.value = false;
      }
      update();
    });
  }

  /// Sign out
  Future<void> signOut() {
    emailTextController.clear();
    passwordTextController.clear();
    return _firebaseAuth.signOut();
  }
}
