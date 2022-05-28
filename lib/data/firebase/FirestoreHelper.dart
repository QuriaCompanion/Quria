// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreHelper {
  final builders = FirebaseFirestore.instance.collection("Builder");

// Build
  create({
    required String userId,
    required String helmet,
    required String gauntlet,
    required String chest,
    required String boots,
  }) {
    var uuid = const Uuid();

    String uid = uuid.v1();
    Map<String, String> map = {
      "USER_ID": userId,
      "HELMET": helmet,
      "GAUNTLET": gauntlet,
      "CHEST": chest,
      "BOOTS": boots,
    };
    store(uid, map);
  }

  store(String uid, Map<String, String> map) {
    builders.doc(uid).set(map);
  }

  update(String uid, Map<String, String> map) {
    builders.doc(uid).update(map);
  }

  delete(String uid) {
    builders.doc(uid).delete();
  }
}
