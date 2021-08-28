import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentModel {
  final String name;
  final String description;
  final String photoUrl;

  DocumentModel({
    required this.name,
    required this.description,
    required this.photoUrl,
  });

  factory DocumentModel.fromDocument({required DocumentSnapshot doc}) {
    return DocumentModel(
      name: doc['name'],
      description: doc['description'],
      photoUrl: doc['photoUrl'],
    );
  }
}
