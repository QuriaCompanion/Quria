import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class SocketsHelper {
  List<DestinyItemSocketState> sockets;
  List<DestinyInventoryItemDefinition> displayedSockets;

  SocketsHelper({
    required this.sockets,
    required this.displayedSockets,
  });
}
