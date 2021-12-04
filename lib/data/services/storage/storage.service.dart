import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class StorageService {
  static late final Database _db;
  static final _store = StoreRef.main();
  static late final LocalStorage _storage;

  static init() async {
    _storage = LocalStorage('Quria');
    if (kIsWeb) {
      DatabaseFactory dbFactory = databaseFactoryWeb;
      _db = await dbFactory.openDatabase("quria");
    } else {
      DatabaseFactory dbFactory = databaseFactoryIo;
      _db = await dbFactory
          .openDatabase("/data/user/0/com.example.quria/app_flutter/quria.db");
    }
  }

  // sets a value in the LocalStorage
  Future<void> setLocalStorage(String key, dynamic value) async {
    _storage.setItem(key, value);
    return;
  }

  // gets a value from the LocalStorage
  Future<dynamic> getLocalStorage(String key) async {
    return _storage.getItem(key);
  }

  // removes a value from the LocalStorage
  Future<void> removeLocalStorage(String key) async {
    _storage.deleteItem(key);
    return;
  }

  // clears all values from the LocalStorage
  Future<void> purgeLocalStorage() async {
    _storage.clear();
    return;
  }

  // sets a value in the database
  Future<void> setDatabase(String key, dynamic value) async {
    await _store.record(key).put(_db, value);
    return;
  }

  // get a value in the database
  Future<void> getDatabase(String key) async {
    final value = await _store.record(key).get(_db);
    return value;
  }

  // removes a value in the database
  Future<void> removeDatabase(String key) async {
    await _store.record(key).delete(_db);
  }
}
