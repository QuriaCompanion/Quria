import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';

class BuilderHelper {
  List<String> statOrder;
  List<DestinyItemComponent> armors;
  Map<String, DestinyItemSocketsComponent> sockets;
  int? exoticHash;
  Map<int, DestinyInventoryItemDefinition> manifest;
  BuilderHelper({
    required this.statOrder,
    required this.armors,
    required this.sockets,
    this.exoticHash,
    required this.manifest,
  });
}
