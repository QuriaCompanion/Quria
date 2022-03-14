// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreHelper {
  final builders = FirebaseFirestore.instance.collection("Builder");

// Build
  create({
    required String? helmet,
    required String? gauntlet,
    required String? armor,
    required String? boots,
  }) {
    var uuid = const Uuid();

    String uid = uuid.v1();
    Map<String, dynamic> map = {
      "HELMET": helmet,
      "GAUNTLET": gauntlet,
      "ARMOR": armor,
      "BOOTS": boots,
    };
    store(uid, map);
  }

  store(String uid, Map<String, dynamic> map) {
    builders.doc(uid).set(map);
  }

  update(String uid, Map<String, dynamic> map) {
    builders.doc(uid).update(map);
  }

  delete(String uid) {
    builders.doc(uid).delete();
  }
}
