import 'dart:convert';
import 'dart:developer';

import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_manifest.dart';
import 'package:bungie_api/responses/destiny_manifest_response.dart';
import 'package:sembast_web/sembast_web.dart';
import 'package:sembast/sembast.dart';

class DbWeb {
  var store = StoreRef.main();
  var _db;

  constructor() {}

  void openDb(manifest) async {
    print("so far so good");
    try {
      print("lets gong");
      // File path to a file in the current directory
      // check if we are on mobile
      DatabaseFactory dbFactory;
      dbFactory = databaseFactoryWeb;
      _db = await dbFactory.openDatabase("bruh");
      manifest = jsonDecode(manifest);
      manifest.forEach((key, value) async {
        print("hey");
        print(key);
        var item = value;
        var itemStore = store.record(key);
        await itemStore.put(_db, item);
      });
      print('bruh');
      print('aie');
    } catch (e) {
      print(e);
    }
    print('hey');
    // final manifestStored = await store.record("manifest").get(_db) as Map;
    print('ho');
    // inspect(manifestStored);
  }
}
