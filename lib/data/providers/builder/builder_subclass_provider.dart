import 'package:flutter/foundation.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class BuilderSubclassProvider with ChangeNotifier {
  String? _subclassId;
  DestinyInventoryItemDefinition? _subclass;
  String? get subclassId => _subclassId;
  DestinyInventoryItemDefinition? get subclass => _subclass;

  void setSubclass(
    String? subclassId,
    DestinyInventoryItemDefinition? subclass,
  ) {
    _subclassId = subclassId;
    _subclass = subclass;
    notifyListeners();
  }

  void reset() {
    _subclassId = null;
    _subclass = null;
    notifyListeners();
  }
}
