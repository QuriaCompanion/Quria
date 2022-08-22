import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LanguageNotifier extends StateNotifier<Locale?> {
  LanguageNotifier() : super(null);

  void setLanguage(Locale? lang) => state = lang;
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale?>((ref) {
  return LanguageNotifier();
});
