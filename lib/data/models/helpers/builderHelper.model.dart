import 'package:quria/data/models/StatWeighing.enum.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';
import 'package:quria/data/models/ArmorMods.model.dart';

class BuilderHelper {
  List<int> statOrder;

  List<DestinyItemComponent> armors;
  Map<String, DestinyItemSocketsComponent> sockets;
  DestinyInventoryItemDefinition? exotic;
  List<ModSlots> armorMods;
  List<DestinyInventoryItemDefinition> subclassMods;
  Map<int, DestinyInventoryItemDefinition> manifest;
  DestinyItemComponent classItem;
  StatWeighing statWeighing;
  bool considerMasterwork;
  BuilderHelper({
    required this.statOrder,
    required this.armors,
    required this.sockets,
    required this.manifest,
    required this.subclassMods,
    required this.armorMods,
    required this.classItem,
    required this.statWeighing,
    required this.considerMasterwork,
    this.exotic,
  });
}

class BuilderPreparation {
  String characterId;
  List<DestinyInventoryItemDefinition> subclassMods;
  List<int> statOrder;
  int? exoticHash;
  List<ModSlots> armorMods;
  String? subclassInstanceId;
  String classItemInstanceId;
  StatWeighing statWeighing;
  bool considerMasterwork;
  bool includeSunset;
  BuilderPreparation({
    required this.characterId,
    required this.subclassMods,
    required this.statOrder,
    required this.armorMods,
    required this.classItemInstanceId,
    required this.statWeighing,
    required this.considerMasterwork,
    required this.includeSunset,
    this.exoticHash,
    this.subclassInstanceId,
  });
}

class BuilderOptionalMods {
  final List<DestinyInventoryItemDefinition?> modSelected;
  final Map<int, int> statValues;

  BuilderOptionalMods({
    required this.modSelected,
    required this.statValues,
  });
}
