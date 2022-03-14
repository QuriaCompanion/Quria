// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

class Build {
  String id = "";
  String? helmet;
  String? gauntlet;
  String? armor;
  String? boots;

  Build(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    helmet = map["HELMET"];
    gauntlet = map["GAUNTLET"];
    armor = map["ARMOR"];
    boots = map["BOOTS"];
  }

  String? get referenceId => null;
}
