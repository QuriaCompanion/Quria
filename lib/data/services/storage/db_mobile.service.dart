import 'dart:convert';
import 'dart:developer';

import 'package:sembast/sembast_io.dart';
import 'package:sembast/sembast.dart';

class DbMobile {
  var store = StoreRef.main();
  var _db;
  void openDb(manifest) async {
    // check if the database is open
    print("so far so good");
    try {
      DatabaseFactory dbFactory = databaseFactoryIo;
      _db = await dbFactory
          .openDatabase("/data/user/0/com.example.quria/app_flutter/bruh.db");
      manifest.forEach((key, value) async {
        print("hey");
        print(key);
        var item = value;
        var itemStore = store.record(key);
        await itemStore.put(_db, item);
      });
    } catch (e) {
      print("sad");
      print(e);
    }
    final manifestStored = await store.record("manifest").get(_db) as Map;
    inspect(manifestStored);
  }
}
