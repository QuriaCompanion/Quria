// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:uuid/uuid.dart';

import '../data/models/Build.dart';

class FirestoreHelper {
  final builders = FirebaseFirestore.instance.collection("Builder");

  get instance => null;

// Build
  create({
    // required String? userId,
    required String? helmet,
    required String? gauntlet,
    required String? armor,
    required String? boots,
  }) async {
    var uuid = const Uuid();
    var userId = await AccountService().getCurrentMembershipId();

    String uid = uuid.v1();
    Map<String, dynamic> map = {
      "USER_ID": userId,
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

  Future<Future<QuerySnapshot<Map<String, dynamic>>>> list() async {
    var userId = await AccountService().getCurrentMembershipId();
    return builders.where(builders, isEqualTo: userId).get();
  }
}
