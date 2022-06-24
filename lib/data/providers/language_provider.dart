import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  Locale? _language;
  Locale? get language => _language;

  void setLanguage(Locale? language) {
    _language = language;
    notifyListeners();
  }
}
