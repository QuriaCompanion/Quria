import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';

// TODO: add proper commentaries
class StorageService {
  static late final LocalStorage _storage;
  static init() async {
    _storage = LocalStorage('Quria');
    await Hive.initFlutter();
  }

  /// Given a storage [key] and a [value], stores the [value] in localStorage.
  Future<void> setLocalStorage(String key, dynamic value) async {
    await _storage.setItem(key, value);
    return;
  }

  /// Given a storage [key] , return the value from localStorage.
  Future<dynamic> getLocalStorage(String key) async {
    return await _storage.getItem(key);
  }

  /// Given a storage [key] , removes localStorage.
  Future<void> removeLocalStorage(String key) async {
    await _storage.deleteItem(key);
    return;
  }

  // clears all values from the LocalStorage
  Future<void> purgeLocalStorage() async {
    await _storage.clear();
    return;
  }

  // sets a value in the database
  Future<void> setDatabase(Box box, Map manifest) async {
    await box.putAll(manifest);
    print('Saved');
    return;
  }

  Future<Box> openBox(String database) async {
    final box = await Hive.openBox(database);
    return box;
  }

  closeBox(Box box) async {
    await box.close();
  }

  // get a value in the database
  Future<T> getDatabaseItem<T>(Box box, String hash) async {
    return await box.get(hash);
  }

  ///   Gets a list of all the items in the database
  Future<Map<String, dynamic>> getDatabase<T>(Box box) async {
    return Map<String, dynamic>.from(box.toMap());
  }
}
