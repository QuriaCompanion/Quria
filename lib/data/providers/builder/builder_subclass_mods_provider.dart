import 'package:flutter/foundation.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class BuilderSubclassModsProvider with ChangeNotifier {
  List<DestinyInventoryItemDefinition> _subclassMods = [];
  List<DestinyInventoryItemDefinition> get subclassMods => _subclassMods;

  void setSubclassMods(
    List<DestinyInventoryItemDefinition> subclassMods,
  ) {
    _subclassMods = subclassMods;
    notifyListeners();
  }

  void reset() {
    _subclassMods = [];
    notifyListeners();
  }
}
