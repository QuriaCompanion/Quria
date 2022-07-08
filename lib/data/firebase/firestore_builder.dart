import 'package:bungie_api/models/destiny_item_component.dart';
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
    var userId = await AccountService.getCurrentMembershipId();

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

  Stream<QuerySnapshot<Map<String, dynamic>>> list(userId) {
    return builders.where('USER_ID', isEqualTo: userId).snapshots();
  }
}
