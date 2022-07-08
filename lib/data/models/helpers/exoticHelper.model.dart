import 'package:bungie_api/enums/destiny_class.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';

class ExoticHelper {
  Map<int, DestinyInventoryItemDefinition> manifest;
  List<DestinyItemComponent> items;
  DestinyClass classType;
  ExoticHelper({
    required this.manifest,
    required this.classType,
    required this.items,
  });
}
