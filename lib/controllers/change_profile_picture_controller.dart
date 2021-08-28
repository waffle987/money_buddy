import 'dart:io';

import 'package:get/get.dart';
import 'package:money_buddy_mobile/util/image_selector.dart';

class EditProfileController extends GetxController {
  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  Future selectImageGallery() async {
    var tempImage = await ImageSelector().selectImageGallery();
    if (tempImage != null) {
      _selectedImage = File(tempImage.path);
      update();
    }
  }

  Future selectImageCamera() async {
    var tempImage = await ImageSelector().selectImageCamera();
    if (tempImage != null) {
      _selectedImage = File(tempImage.path);
      update();
    }
  }
}
