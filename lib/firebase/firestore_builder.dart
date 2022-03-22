// ignore_for_file: file_names

import 'package:bungie_api/destiny2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:uuid/uuid.dart';

class FirestoreBuilder {
  final builders = FirebaseFirestore.instance.collection("Builder");

  get instance => null;

// Build
  create({
    required String name,
    required List<DestinyItemComponent> armor,
  }) async {
    var uuid = const Uuid();
    var userId = await AccountService().getCurrentMembershipId();

    String uid = uuid.v1();
    Map<String, dynamic> map = {
      "USER_ID": userId,
      "NAME": name,
      "HELMET": {
        "HASH": armor[0].itemHash,
        "INSTANCE_ID": armor[0].itemInstanceId,
      },
      "GAUNTLET": {
        "HASH": armor[1].itemHash,
        "INSTANCE_ID": armor[1].itemInstanceId,
      },
      "CHEST": {
        "HASH": armor[2].itemHash,
        "INSTANCE_ID": armor[2].itemInstanceId,
      },
      "BOOTS": {
        "HASH": armor[3].itemHash,
        "INSTANCE_ID": armor[3].itemInstanceId,
      },
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
