import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
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
  BuilderHelper({
    required this.statOrder,
    required this.armors,
    required this.sockets,
    required this.manifest,
    required this.subclassMods,
    required this.armorMods,
    this.exotic,
  });
}

class BuilderPreparation {
  String characterId;
  List<DestinyInventoryItemDefinition> subclassMods;
  List<int> statOrder;
  int exoticHash;
  List<ModSlots> armorMods;
  String? subclassInstanceId;
  BuilderPreparation({
    required this.characterId,
    required this.subclassMods,
    required this.statOrder,
    required this.exoticHash,
    required this.armorMods,
    this.subclassInstanceId,
  });
}

class BuilderOptionalMods {
  final List<DestinyInventoryItemDefinition> modSelected;
  final Map<int, int> statValues;

  BuilderOptionalMods({
    required this.modSelected,
    required this.statValues,
  });
}
