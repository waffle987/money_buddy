import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:money_buddy_mobile/authentication/controllers/auth_controller.dart';
import 'package:money_buddy_mobile/services/firebase_cloud_storage_service.dart';
import 'package:money_buddy_mobile/util/image_selector.dart';
import 'package:uuid/uuid.dart';

class UploadDocumentController extends GetxController {
  final CloudStorageService _cloudStorageService = CloudStorageService();

  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  /// GetX controllers
  final AuthController _authController = AuthController.to;

  Future selectImageGallery() async {
    var tempImage = await ImageSelector().selectImageGallery();
    if (tempImage != null) {
      _selectedImage = File(tempImage.path);
      update();
    }
  }

  void uploadDocumentEntry({
    required String name,
    required String description,
  }) async {
    final CollectionReference _merchantPostCollectionReference =
        FirebaseFirestore.instance.collection('user documents');
    final CollectionReference _userCollectionReference =
        FirebaseFirestore.instance.collection('users');

    CloudStorageResult storageResult;
    String _id = Uuid().v4();

    if (selectedImage != null) {
      storageResult = await _cloudStorageService.uploadImage(
        imageToUpload: _selectedImage!,
        fileName: _id,
      );

      _merchantPostCollectionReference
          .doc(_authController.firebaseUser.value!.uid)
          .collection('documents')
          .doc(_id)
          .set({
        "name": name,
        "description": description,
        "photoUrl": selectedImage != null ? storageResult.imageUrl : '',
        "documentId": _id,
        "fileName": selectedImage != null ? storageResult.imageFileName : '',
      });

      final newPoints =
          int.parse(_authController.firestoreUser.value!.points) + 50;

      _userCollectionReference
          .doc(_authController.firebaseUser.value!.uid)
          .update({
        'points': newPoints.toString(),
      });
    }
  }
}
