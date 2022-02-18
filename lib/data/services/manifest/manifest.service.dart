import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:bungie_api/models/destiny_manifest.dart';
import 'package:bungie_api/responses/destiny_manifest_response.dart';
import 'package:quria/data/models/AllDestinyManifestComponents.model.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/definition_table_names.enum.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/storage/storage.service.dart';

typedef DownloadProgress = void Function(int downloaded, int total);

class ManifestService {
  final BungieApiService api = BungieApiService();
  static DestinyManifest? _manifestInfo;
  static final AllDestinyManifestComponents manifestParsed =
      AllDestinyManifestComponents();
  final StorageService storage = StorageService();
  static final ManifestService _singleton = ManifestService._internal();

  factory ManifestService() {
    return _singleton;
  }
  ManifestService._internal();

  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }

  static Future<DestinyManifest> loadManifestInfo<T>() async {
    if (_manifestInfo != null) {
      return _manifestInfo!;
    }
    DestinyManifestResponse response = await BungieApiService.getManifestInfo();
    _manifestInfo = response.response;
    return _manifestInfo!;
  }

  /// Given  a type [T] stores give type manifest in [manifestParsed]
  ///
  /// The data can come from [manifestParsed]
  ///
  /// or from the [Hive] database
  ///
  /// or from the [BungieApiService]
  ///
  /// returns true once the manifest is loaded
  static Future<bool> getManifest<T>(String manifestName, Box box) async {
    try {
      if (await isManifestSaved(manifestName)) {
        String manifest = StorageService.getDatabaseItem(box, manifestName);
        Map<int, T> items =
            await compute<String, Map<int, T>>(_parseJson, manifest);
        AllDestinyManifestComponents.setValue<T>(items);
      } else {
        String manifest = await getManifestRemote(manifestName);
        await StorageService.setDatabaseItem(box, manifestName, manifest);
        Map<int, T> items =
            await compute<String, Map<int, T>>(_parseJson, manifest);
        AllDestinyManifestComponents.setValue<T>(items);
        manifestSaved(manifestName);
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }

  getManifestLocal<T>(myBox, String manifestName) {
    return StorageService.getDatabaseItem(myBox, manifestName);
  }

  // Future<DestinyInventoryItemDefinition?> getDefinition<T>(int hash) async {
  //   return await storage.getDatabaseItem(manifestName(), hash);
  // }

  storeManifest<T>(Map<int, T> manifest) {}

  static Future<String> getManifestRemote<T>(String manifestName) async {
    DestinyManifest info = await loadManifestInfo();

    String language = "fr";
    http.Response res = await http.get(Uri.parse(DestinyData.bungieLink +
        info.jsonWorldComponentContentPaths![language]![manifestName]!));
    return res.body;
  }

  static Future<bool> isManifestSaved(String manifestName) async {
    return await StorageService.getLocalStorage(
            'manifestSaved_$manifestName') ??
        false;
  }

  /// Given a [manifestName] sets corresponding manifestSaved value to true
  static Future<void> manifestSaved(String manifestName) async {
    return await StorageService.setLocalStorage(
        'manifestSaved_$manifestName', true);
  }
}

/// Given a [manifest] and type [T]
///
/// Stores the data in the [Hive] database
///
/// the data returned is typed and ready to be used
// Future<Map<int, T>> _parseJson<T>(Map<String, String> manifestHelper) async {
//   // Storing the data in a box
//   StorageService.isolateInit();
//   Box box = await StorageService.openBox<T>();
//   await StorageService.setDatabaseItem(
//       box, manifestHelper["manifestName"]!, manifestHelper["manifest"]);
//   StorageService.closeBox(box);

//   Map<int, T> items = {};
//   final type = DefinitionTableNames.identities[T];
//   Map<String, dynamic> decoded =
//       jsonDecode(manifestHelper["manifest"]!) as Map<String, dynamic>;
//   for (final entry in decoded.entries) {
//     items[int.parse(entry.key)] = type!(entry.value);
//   }
//   AllDestinyManifestComponents.setValue<T>(items);
//   return items;
// }

/// Given a [manifest] and type [T]
///
/// returns the correctly typed data
///
/// the data returned is typed and ready to be used
Future<Map<int, T>> _parseJson<T>(String manifest) async {
  Map<int, T> items = {};
  final type = DefinitionTableNames.identities[T];
  Map<String, dynamic> decoded = jsonDecode(manifest) as Map<String, dynamic>;
  for (final entry in decoded.entries) {
    items[int.parse(entry.key)] = type!(entry.value);
  }
  return items;
}

// Future<bool> test() async {
//   var def = await getDefinition<DestinyInventoryItemDefinition>(3628991658);
//   return def?.displayProperties?.name != null;
// }

// static List<int> _extractFromZip(dynamic zipFile) {
//   List<int> unzippedData;
//   List<int> bytes = zipFile.readAsBytesSync();
//   ZipDecoder decoder = ZipDecoder();
//   Archive archive = decoder.decodeBytes(bytes);
//   for (ArchiveFile file in archive) {
//     if (file.isFile) {
//       unzippedData = file.content;
//       return unzippedData;
//     }
//   }
//   return [];
// }

// Future<Map<int, T>?> getDefinitions<T>(Iterable<int> hashes,
//     [dynamic Function(Map<String, dynamic> json)? identity]) async {
//   Set<int> hashesSet = hashes.toSet();
//   hashesSet.retainWhere((h) => h != null);
//   if (hashesSet == null) return null;
//   var type = DefinitionTableNames.fromClass[T];
//   identity ??= DefinitionTableNames.identities[T] as Function(
//       Map<String, dynamic> json);
//   Map<int, T> defs = {};
//   hashesSet.removeWhere((hash) {
//     if (_cached.keys.contains("${type}_$hash")) {
//       defs[hash] = _cached["${type}_$hash"];
//       return true;
//     }
//     return false;
//   });

//   if (hashesSet.isEmpty) {
//     return defs;
//   }
//   List<int> searchHashes = hashesSet
//       .map((hash) => hash > 2147483648 ? hash - 4294967296 : hash)
//       .toList();
//   String idList = "(" + List.filled(hashesSet.length, '?').join(',') + ")";

//   Database db = await _openDb() as Database;

//   var txn = db.transaction(storeName, 'readonly');
//   var store = txn.objectStore(storeName);
//   List<Map<String, dynamic>> results =
//       await store.getAll({"id": idList}) as List<Map<String, dynamic>>;

//   // List<Map<String, dynamic>> results = await db.query(type!,
//   //     columns: ['id', 'json'],
//   //     where: "id in $idList",
//   //     whereArgs: searchHashes);
//   try {
//     for (var res in results) {
//       int id = res['id'];
//       int hash = id < 0 ? id + 4294967296 : id;
//       String resultString = res['json'];
//       var def = identity(jsonDecode(resultString));
//       _cached["${type}_$hash"] = def;
//       defs[hash] = def;
//     }
//   } catch (e) {}
//   return defs.cast<int, T>();
// }

// Future<T?> getDefinition<T>(int hash,
//     [dynamic Function(Map<String, dynamic> json)? identity]) async {
//   if (hash == null) return null;
//   String type = DefinitionTableNames.fromClass[T] as String;

//   try {
//     var cached = _cached["${type}_$hash"];
//     if (cached != null) {
//       return cached;
//     }
//   } catch (e) {}

//   identity ??= DefinitionTableNames.identities[T] as Function(
//       Map<String, dynamic> json);
//   if (identity == null) {
//     throw "missing identity for $T";
//   }
//   int searchHash = hash > 2147483648 ? hash - 4294967296 : hash;
//   Database db = await _openDb() as Database;
//   try {
//     List<Map<String, dynamic>> results = await db.query(type,
//         columns: ['json'], where: "id=?", whereArgs: [searchHash]);
//     if (results.length < 1) {
//       return null;
//     }
//     String resultString = results.first['json'];
//     var def = identity(jsonDecode(resultString));
//     _cached["${type}_$hash"] = def;
//     return def;
//   } catch (e) {
//     if (e is sqflite.DatabaseException && e.isDatabaseClosedError()) {
//       _db = null;
//       return getDefinition(hash, identity);
//     }
//   }
//   return null;
// }
// Future<Map<String, T>> getDefinitions<T>(Iterable<String?> hashes) async {
//   Box myBox = await storage.openBox<T>();
//   print('loading definitions');
//   Map<String, T> definitions = {};
//   for (String? hash in hashes) {
//     print(hash);
//     if (hash == null) {
//       continue;
//     }
//     definitions[hash] = await storage.getDatabaseItem<T>(myBox, hash);
//     print(definitions);
//   }
//   return definitions;
// }
