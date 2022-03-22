import 'package:cloud_firestore/cloud_firestore.dart';

class StoreBuild {
  String id = "";
  String? userId;
  late StoreBuilItem helmet;
  late StoreBuilItem gauntlet;
  late StoreBuilItem chest;
  late StoreBuilItem boots;
  late String name;

  StoreBuild(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    userId = map["USER_ID"];
    helmet = StoreBuilItem(map['HELMET']);
    gauntlet = StoreBuilItem(map['GAUNTLET']);
    chest = StoreBuilItem(map['CHEST']);
    boots = StoreBuilItem(map['BOOTS']);
    name = map['NAME'];
  }
}

class StoreBuilItem {
  late int hash;
  late String instanceId;

  StoreBuilItem(Map<String, dynamic> item) {
    hash = item['HASH'];
    instanceId = item['INSTANCE_ID'];
  }
}
