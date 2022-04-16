import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class ItemInfoHelper {
  final DestinyInventoryItemDefinition itemDef;
  final Map<String, DestinyStat>? stats;
  final int powerLevel;
  final String imageLink;
  final String? elementIcon;
  final Map<String, List<DestinyItemPlugBase>>? plugs;
  final List<DestinyItemSocketState> sockets;
  final String? afinityIcon;

  ItemInfoHelper({
    required this.itemDef,
    required this.stats,
    required this.powerLevel,
    required this.imageLink,
    required this.elementIcon,
    required this.plugs,
    required this.sockets,
    required this.afinityIcon,
  });
}
