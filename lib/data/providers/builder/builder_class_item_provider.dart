import 'package:flutter/foundation.dart';

class BuilderClassItemProvider with ChangeNotifier {
  String? _classItemInstanceId;
  get classItemInstanceId => _classItemInstanceId;

  void setClassItem(
    String classItemInstanceId,
  ) {
    _classItemInstanceId = classItemInstanceId;
    notifyListeners();
  }
}
