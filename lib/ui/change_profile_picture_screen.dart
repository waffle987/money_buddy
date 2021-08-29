import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_buddy_mobile/authentication/controllers/auth_controller.dart';
import 'package:money_buddy_mobile/controllers/change_profile_picture_controller.dart';
import 'package:money_buddy_mobile/model/user_model.dart';
import 'package:money_buddy_mobile/services/firebase_cloud_storage_service.dart';
import 'package:money_buddy_mobile/widgets/busy_button.dart';

class ChangeProfilePicturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final ThemeData _themeData = Theme.of(context);

    /// Get controllers
    final AuthController _authController = AuthController.to;
    final EditProfileController _merchantEditProfileController =
        Get.put(EditProfileController());

    /// Services
    final CloudStorageService _cloudStorageService = CloudStorageService();

    /// Build splash page for image selection
    Container buildSplashScreen() {
      return Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Icon(FontAwesomeIcons.camera, size: 40.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
                child: Text(
                  'Select an option',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
                child: Material(
                  color: _themeData.primaryColor,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(25.0),
                  child: MaterialButton(
                    onPressed: () =>
                        _merchantEditProfileController.selectImageCamera(),
                    minWidth: 200.0,
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Camera',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
                child: Material(
                  color: _themeData.primaryColor,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(25.0),
                  child: MaterialButton(
                    onPressed: () =>
                        _merchantEditProfileController.selectImageGallery(),
                    minWidth: 200.0,
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Library',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    /// Build profile picture image preview screen
    Scaffold buildUploadProfilePicturePreviewScreen() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: _themeData.scaffoldBackgroundColor,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Profile picture',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w900),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                right: _mediaQuery.size.width * 0.02,
                top: _mediaQuery.size.width * 0.02,
                bottom: _mediaQuery.size.width * 0.02,
              ),
              child: Container(
                width: _mediaQuery.size.width * 0.2,
                child: BusyButton(
                  title: 'Upload',
                  color: _themeData.primaryColor,
                  onTap: () async {
                    if (_merchantEditProfileController.selectedImage != null) {
                      CloudStorageResult _result =
                          await _cloudStorageService.uploadImage(
                        imageToUpload:
                            _merchantEditProfileController.selectedImage!,
                        fileName: _authController.firestoreUser.value!.id,
                      );

                      UserModel newUserModel = UserModel(
                        id: _authController.firestoreUser.value!.id,
                        email: _authController.firestoreUser.value!.email,
                        userRole: _authController.firestoreUser.value!.userRole,
                        photoUrl: _result.imageUrl!,
                        username: _authController.firestoreUser.value!.username,
                        points: _authController.firestoreUser.value!.points,
                      );

                      _authController.updateUserFirestore(user: newUserModel);
                    }

                    Get.back();

                    Get.snackbar(
                      'Success'.tr,
                      'Your profile has been updated!',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 5),
                      backgroundColor: Colors.green,
                      colorText: Get.theme.snackBarTheme.actionTextColor,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 400.0,
                width: _mediaQuery.size.width * 0.8,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 487 / 451,
                    child: CircleAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                                _merchantEditProfileController.selectedImage!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (controller) => controller.selectedImage == null
            ? buildSplashScreen()
            : buildUploadProfilePicturePreviewScreen(),
      ),
    );
  }
}
