import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:money_buddy_mobile/authentication/controllers/auth_controller.dart';
import 'package:money_buddy_mobile/model/document_model.dart';

class DocumentFeedController extends GetxController {
  final Rxn<List<DocumentModel>> docs = Rxn<List<DocumentModel>>();

  final CollectionReference _docCollection =
      FirebaseFirestore.instance.collection('user documents');

  /// GetX controllers
  final AuthController _authController = AuthController.to;

  /// Stream controllers
  final StreamController<List<DocumentModel>> _docController =
      StreamController<List<DocumentModel>>.broadcast();

  @override
  void onInit() async {
    docs.bindStream(listenToLoyaltyCardsRealTime());

    super.onInit();
  }

  Stream<List<DocumentModel>> listenToLoyaltyCardsRealTime() {
    _docCollection
        .doc(_authController.firebaseUser.value!.uid)
        .collection('documents')
        .snapshots()
        .listen((docSnapshot) {
      if (docSnapshot.docs.isNotEmpty) {
        List<DocumentModel> _docs = docSnapshot.docs.length == 0
            ? []
            : docSnapshot.docs
                .map((doc) => DocumentModel.fromDocument(doc: doc))
                .toList();
        _docController.add(_docs);
      } else {
        _docController.add([]);
      }
    });

    return _docController.stream;
  }
}
