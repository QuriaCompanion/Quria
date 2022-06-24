import 'package:flutter/foundation.dart';

class BuilderCustomInfoProvider with ChangeNotifier {
  String? _classItemInstanceId;
  bool _considerMasterwork = true;
  bool _removeSunset = true;
  get classItemInstanceId => _classItemInstanceId;
  get considerMasterwork => _considerMasterwork;
  get removeSunset => _removeSunset;

  void setClassItem(
    String classItemInstanceId,
  ) {
    _classItemInstanceId = classItemInstanceId;
    notifyListeners();
  }

  void setConsiderMasterwork(bool considerMasterwork) {
    _considerMasterwork = considerMasterwork;
    notifyListeners();
  }

  void setRemoveSunset(bool removeSunset) {
    _removeSunset = removeSunset;
    notifyListeners();
  }
}
