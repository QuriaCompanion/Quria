import 'dart:convert';
import 'dart:developer';

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
      await store.record('manifest').put(_db, manifest);
    } catch (e) {
      print(e);
    }
    final manifestStored = await store.record("manifest").get(_db);
    inspect(manifestStored);
  }
}
