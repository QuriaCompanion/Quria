import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/BuildResponse.model.dart';

class BuilderRecapHelper {
  Build build;
  List<ModSlots> mods;
  String characterId;
  List<DestinyInventoryItemDefinition> subclassMods;
  String? subclassId;
  BuilderRecapHelper(
      {required this.build,
      required this.subclassMods,
      required this.mods,
      required this.characterId,
      this.subclassId});
}
