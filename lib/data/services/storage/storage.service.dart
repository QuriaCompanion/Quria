import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';

// TODO: add proper commentaries
class StorageService {
  static late final LocalStorage _storage;

  static init() async {
    _storage = LocalStorage('Quria');
    Hive.initFlutter();
  }

  static isolateInit() async {
    if (!kIsWeb) {
      final directory = await getApplicationDocumentsDirectory();
      Hive.init(directory.path + 'Quria');
    }
  }

  /// Given a storage [key] and a [value], stores the [value] in localStorage.
  static Future<void> setLocalStorage(String key, dynamic value) async {
    await _storage.setItem(key, value);
    return;
  }

  /// Given a storage [key] , return the value from localStorage.
  static Future<dynamic> getLocalStorage(String key) async {
    return await _storage.getItem(key);
  }

  /// Given a storage [key] , removes localStorage.
  static Future<void> removeLocalStorage(String key) async {
    await _storage.deleteItem(key);
    return;
  }

  // clears all values from the LocalStorage
  static Future<void> purgeLocalStorage() async {
    await _storage.clear();
    return;
  }

  // sets a value in the database
  static Future<void> setDatabase<T>(Box box, manifest) async {
    await box.putAll(manifest);
    return;
  }

  static Future<void> setDatabaseItem<T>(Box box, String key, manifest) async {
    await box.put(key, manifest);
    return;
  }

  static Future<Box> openBox<T>() async {
    return Hive.openBox(T.toString());
  }

  static closeBox(Box box) async {
    await box.close();
  }

  // get a value in the database
  static getDatabaseItem<T>(Box box) {
    return box.get(T.toString());
  }

  // ///   Gets a list of all the items in the database
  static Map<dynamic, dynamic> getDatabase<T>(Box box) {
    return box.toMap();
  }
}
