import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/foundation.dart';

class BuilderCustomInfoProvider with ChangeNotifier {
  DestinyItemComponent? _classItem;
  bool _considerMasterwork = true;
  bool _includeSunset = true;
  DestinyItemComponent? get classItem => _classItem;
  bool get considerMasterwork => _considerMasterwork;
  bool get includeSunset => _includeSunset;

  void setClassItem(
    DestinyItemComponent? classItem,
  ) {
    _classItem = classItem;
    notifyListeners();
  }

  void setConsiderMasterwork(bool considerMasterwork) {
    _considerMasterwork = considerMasterwork;
    notifyListeners();
  }

  void setRemoveSunset(bool removeSunset) {
    _includeSunset = removeSunset;
    notifyListeners();
  }

  void reset() {
    _classItem = null;
    _considerMasterwork = true;
    _includeSunset = true;
    notifyListeners();
  }
}
