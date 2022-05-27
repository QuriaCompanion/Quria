import 'package:flutter/foundation.dart';

class BuilderExoticProvider with ChangeNotifier {
  int? _exoticHash;
  int? get exoticHash => _exoticHash;

  void setExoticHash(int? exoticHash) {
    _exoticHash = exoticHash;
    notifyListeners();
  }
}
