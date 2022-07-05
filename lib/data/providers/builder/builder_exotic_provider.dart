import 'package:flutter/foundation.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class BuilderExoticProvider with ChangeNotifier {
  DestinyInventoryItemDefinition? _exotic;
  DestinyInventoryItemDefinition? get exotic => _exotic;

  void setExoticHash(DestinyInventoryItemDefinition? exotic) {
    _exotic = exotic;
    notifyListeners();
  }

  void reset() {
    _exotic = null;
    notifyListeners();
  }
}
