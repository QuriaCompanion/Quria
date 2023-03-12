import 'package:quria/data/models/StatWeighing.enum.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';

class BuilderHelper {
  List<int> statOrder;

  List<DestinyItemComponent> armors;
  Map<String, DestinyItemSocketsComponent> sockets;
  DestinyInventoryItemDefinition? exotic;
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
    required this.classItem,
    required this.statWeighing,
    required this.considerMasterwork,
    this.exotic,
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
