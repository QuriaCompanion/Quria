import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_equipment_slot_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class ItemCardHelper {
  final DestinyEquipmentSlotDefinition itemCategory;
  final DestinyInventoryItemDefinition itemDef;
  final String? elementIcon;
  final int? powerLevel;
  final List<DestinyItemSocketState> perks;
  final List<DestinyItemSocketState> intristics;
  final List<DestinyItemSocketState> armorSockets;

  ItemCardHelper({
    required this.itemCategory,
    required this.itemDef,
    required this.elementIcon,
    required this.powerLevel,
    required this.perks,
    required this.intristics,
    required this.armorSockets,
  });
}
