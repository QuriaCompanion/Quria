import 'package:bungie_api/models/destiny_item_socket_entry_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class ModSlots {
  String title;
  List<DestinyItemSocketEntryDefinition> elementSocketEntries;
  List<DestinyInventoryItemDefinition?> items;
  ModSlots({
    required this.title,
    required this.elementSocketEntries,
    required this.items,
  });
}
