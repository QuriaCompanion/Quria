import 'package:flutter/cupertino.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class ArmorModModalProvider with ChangeNotifier {
  DestinyInventoryItemDefinition? _armorMod;
  DestinyInventoryItemDefinition? get armorMod => _armorMod;

  setSelectedMod(DestinyInventoryItemDefinition armorMod) {
    _armorMod = armorMod;
    notifyListeners();
  }
}
