import 'dart:developer';

import 'package:sembast/sembast_io.dart';
import 'package:sembast/sembast.dart';

class DbMobile {
  var store = StoreRef.main();
  var _db;
  void openDb(manifest) async {
    print("so far so good");
    try {
      print("lets gong");
      DatabaseFactory dbFactory = databaseFactoryIo;
      _db = await dbFactory
          .openDatabase("/data/user/0/com.example.quria/app_flutter/bruh.db");

      await store.record('manifest').put(_db, manifest);
    } catch (e) {
      print("sad");
      print(e);
    }
    final manifestStored = await store.record("manifest").get(_db);
    inspect(manifestStored.DestinyGenderDefinition);
  }
}
