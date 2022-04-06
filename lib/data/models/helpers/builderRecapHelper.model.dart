import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/BuildResponse.model.dart';

class BuilderRecapHelper {
  Build build;
  List<ModSlots> mods;
  String characterId;
  BuilderRecapHelper(
      {required this.build, required this.mods, required this.characterId});
}
