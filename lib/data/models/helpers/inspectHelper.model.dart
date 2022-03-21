import 'package:bungie_api/destiny2.dart';

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
