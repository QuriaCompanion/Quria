import 'package:bungie_api/destiny2.dart';

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
