import 'dart:collection';
import 'dart:developer';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:sembast/sembast.dart';
// import 'package:sembast/sembast_io.dart';
// import 'package:sembast_web/sembast_web.dart';

class StorageService {
  static late final LocalStorage _storage;
  static init() async {
    _storage = LocalStorage('Quria');
    await Hive.initFlutter();
  }

  // sets a value in the LocalStorage
  Future<void> setLocalStorage(String key, dynamic value) async {
    await _storage.setItem(key, value);
    return;
  }

  // gets a value from the LocalStorage
  Future<dynamic> getLocalStorage(String key) async {
    return await _storage.getItem(key);
  }

  // removes a value from the LocalStorage
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
  Future<void> setDatabase(String key, String value) async {
    final box = await Hive.openBox(key);
    await box.add(value);
    print('done');
    return;
  }

  // get a value in the database
  Future<Map<dynamic, dynamic>> getDatabase(String key) async {
    final box = await Hive.openBox(key);
    return box.getAt(0);
  }

  // // removes a value in the database
  // Future<void> removeDatabase(String key) async {
  //   await _store.record(key).delete(_db);
  // }
}
