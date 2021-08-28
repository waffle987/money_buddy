import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_buddy_mobile/authentication/controllers/auth_controller.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';
import 'package:money_buddy_mobile/model/user_model.dart';
import 'package:money_buddy_mobile/ui/change_profile_picture_screen.dart';
import 'package:money_buddy_mobile/widgets/circle_button.dart';
import 'package:money_buddy_mobile/widgets/text_form_field.dart';

class UserEditProfilePage extends StatelessWidget {
  final TextEditingController _bioTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    final AuthController _authController = AuthController.to;

    /// Build update profile information button
    Widget buildDoneButton() {
      return Padding(
        padding: EdgeInsets.only(right: _mediaQuery.size.width * 0.02),
        child: CircleButton(
          function: () {
            if (_usernameTextController.text.isNotEmpty ||
                _bioTextController.text.isNotEmpty) {
              UserModel newUserModel = UserModel(
                id: _authController.firestoreUser.value!.id,
                email: _authController.firestoreUser.value!.email,
                userRole: _authController.firestoreUser.value!.userRole,
                photoUrl: _authController.firestoreUser.value!.photoUrl,
                username: _usernameTextController.text.isEmpty
                    ? _authController.firestoreUser.value!.username
                    : _usernameTextController.text,
              );

              _authController.updateUserFirestore(user: newUserModel);

              Get.back();

              Get.snackbar(
                'Success'.tr,
                'Your profile has been updated!',
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 5),
                backgroundColor: Colors.green,
                colorText: Get.theme.snackBarTheme.actionTextColor,
              );
            } else {
              Get.snackbar(
                'No changes'.tr,
                'Change a field and try again!',
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 5),
                backgroundColor: Colors.red,
                colorText: Get.theme.snackBarTheme.actionTextColor,
              );
            }
          },
          buttonColour: Colors.green,
          icon: FontAwesomeIcons.check,
          iconColour: Colors.white,
        ),
      );
    }

    Widget buildProfilePhoto({
      required String photoUrl,
      required UserModel currentMerchantUserModel,
    }) {
      return Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: CircleAvatar(
              backgroundColor: kPrimaryColour,
              radius: 60.0,
              child: photoUrl != ''
                  ? null
                  : Icon(
                      FontAwesomeIcons.solidUser,
                      size: 50.0,
                      color: Colors.white,
                    ),
              backgroundImage:
                  photoUrl == '' ? null : CachedNetworkImageProvider(photoUrl),
            ),
          ),
          Positioned(
            right: 10.0,
            bottom: 12.0,
            child: GestureDetector(
                onTap: () => Get.to(() => ChangeProfilePicturePage()),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.6),
                  radius: 15.0,
                  child: Icon(
                    FontAwesomeIcons.camera,
                    size: 15.0,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeData.scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text(
          'Edit profile',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          buildDoneButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * 0.07),
          child: Column(
            children: <Widget>[
              verticalSpaceMedium,
              Obx(
                () => buildProfilePhoto(
                  photoUrl: _authController.firestoreUser.value!.photoUrl,
                  currentMerchantUserModel:
                      _authController.firestoreUser.value!,
                ),
              ),
              verticalSpaceMedium,
              CustomTextFormField(
                header: 'Username',
                hintText: _authController.firestoreUser.value!.username,
                textEditingController: _usernameTextController,
                textInputType: TextInputType.text,
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
}
