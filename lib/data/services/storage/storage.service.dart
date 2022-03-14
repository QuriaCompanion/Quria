import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';

/// StorageService is to be called using static methods.
///
/// It uses the Hive Flutter package to store data in the indexedDB.
///
/// It uses the LocalStorage package to store data in the local storage.
class StorageService {
  static late final LocalStorage _storage;

  static init() async {
    _storage = LocalStorage('Quria');
    Hive.initFlutter();
  }

  static isolateInit() async {
    if (!kIsWeb) {
      final directory = await getApplicationDocumentsDirectory();
      Hive.init(directory.path + '/Quria');
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

  /// Given a storage [key] , removes localStorage entry
  static Future<void> removeLocalStorage(String key) async {
    await _storage.deleteItem(key);
    return;
  }

  /// clears all values from the LocalStorage
  static Future<void> purgeLocalStorage() async {
    await _storage.clear();
    return;
  }

  /// Given a [box] and [Map] as [values], stores every [values] in the [box].
  static Future<void> setDatabase<T>(Box box, values) async {
    await box.putAll(values);
    return;
  }

  /// Given a [box], a [key] and a [value], stores the [value] in the [box].
  ///
  /// can be awaited if necessary.
  static Future<void> setDatabaseItem<T>(Box box, String key, value) async {
    await box.put(key, value);
    return;
  }

  /// Given a type [T] returns a Box named after the type.
  ///
  /// If the Box does not exist, it creates it.
  static Future<Box> openBox<T>(String boxName) async {
    return Hive.openBox(boxName);
  }

  /// Given a [box] it closes said box.
  ///
  /// helps avoid unnecessary memory leaks.
  static closeBox(Box box) async {
    await box.close();
  }

  /// Given a [box] and a [key] returns the manifest as a [String]
  ///
  /// The String still need to be parsed to be used.
  static dynamic getDatabaseItem(Box box, String key) {
    return box.get(key);
  }

  /// Given a [box] returns every item in the [box].
  static Map<dynamic, dynamic> getDatabase(Box box) {
    return box.toMap();
  }
}
