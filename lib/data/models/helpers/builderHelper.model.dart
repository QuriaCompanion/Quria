import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';

class BuilderHelper {
  List<int> statOrder;

  List<DestinyItemComponent> armors;
  Map<String, DestinyItemSocketsComponent> sockets;
  DestinyInventoryItemDefinition? exotic;
  List<DestinyInventoryItemDefinition> mods;
  Map<int, DestinyInventoryItemDefinition> manifest;
  BuilderHelper({
    required this.statOrder,
    required this.armors,
    required this.sockets,
    required this.manifest,
    required this.mods,
    this.exotic,
  });
}

class BuilderPreparation {
  final String characterId;
  final List<DestinyInventoryItemDefinition> mods;
  final List<int> statOrder;
  final int exoticHash;
  final String? subclassInstanceId;
  BuilderPreparation({
    required this.characterId,
    required this.mods,
    required this.statOrder,
    required this.exoticHash,
    this.subclassInstanceId,
  });
}
