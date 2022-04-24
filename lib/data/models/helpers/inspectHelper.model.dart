import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class InspectHelper {
  DestinyInventoryItemDefinition? firstColumn;
  DestinyInventoryItemDefinition? secondColumn;
  DestinyInventoryItemDefinition? thirdColumn;
  DestinyInventoryItemDefinition? fourthColumn;
  DestinyInventoryItemDefinition? fifthColumn;
  DestinyInventoryItemDefinition? masterwork;
  DestinyInventoryItemDefinition? mod;
}

enum InspectColumn {
  firstColumn,
  secondColumn,
  thirdColumn,
  fourthColumn,
  fifthColumn,
  masterwork,
  mod
}
