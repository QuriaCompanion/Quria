import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:bungie_api/models/destiny_manifest.dart';
import 'package:bungie_api/responses/destiny_manifest_response.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/definition_table_names.enum.dart';
import 'package:quria/data/services/storage/storage.service.dart';

typedef DownloadProgress = void Function(int downloaded, int total);

class ManifestService {
  final BungieApiService api = BungieApiService();
  DestinyManifest? _manifestInfo;
  final Map<String, dynamic> _manifest = {};
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

  Future<DestinyManifest> loadManifestInfo<T>() async {
    if (_manifestInfo != null) {
      return _manifestInfo!;
    }
    print('Loading manifest info');
    DestinyManifestResponse response = await api.getManifestInfo();
    _manifestInfo = response.response;
    return _manifestInfo!;
  }

  Future<Map<dynamic, T>> getManifest<T>() async {
    print('called get manifest');
    if (_manifest[T.toString()] != null) return _manifest[T.toString()];
    Map<dynamic, T> items = {};
    Box myBox = await StorageService.openBox<T>();

    try {
      if (await isManifestSaved(T.toString())) {
        print('manifest from cache');
        final decoded = getManifestLocal<T>(myBox);
        inspect(decoded);
        items = await compute<String, Map<int, T>>(_parseJsonDb, decoded);
      } else {
        print('manifest from remote');
        final items = await compute<String, Map<int, T>>(
            _parseJson, await getManifestRemote<T>());
        print('saved');
        // items = await compute<Map<String, dynamic>, Map<int, T>>(
        //     _parseJson, decoded);
        print('manifest changed to original type');
        _manifest[T.toString()] = items;
        print('manifest stored in _manifest');
        manifestSaved(T.toString());
      }
      print('manifest loaded');
      return items;
    } catch (e, s) {
      print(e);
      return items;
    }
  }

  getManifestLocal<T>(myBox) {
    return StorageService.getDatabaseItem<T>(myBox);
  }

  // Future<DestinyInventoryItemDefinition?> getDefinition<T>(int hash) async {
  //   return await storage.getDatabaseItem(T.toString(), hash);
  // }

  storeManifest<T>(Map<int, T> manifest) {}

  Future<String> getManifestRemote<T>({DownloadProgress? onProgress}) async {
    DestinyManifest info = await loadManifestInfo();
    String language = "fr";
    http.Response res = await http.get(Uri.parse('https://www.bungie.net' +
        info.jsonWorldComponentContentPaths![language]![T.toString()]!));

    print('manifest downloaded');
    return res.body;
  }

  Future<bool> isManifestSaved(String manifestName) async {
    return await StorageService.getLocalStorage(
            'manifestSaved_$manifestName') ??
        false;
  }

  Future<void> manifestSaved(String manifestName) async {
    return await StorageService.setLocalStorage(
        'manifestSaved_$manifestName', true);
  }
}

Future<Map<int, T>> _parseJson<T>(String text) async {
  // Storing the data in a box
  StorageService.isolateInit();
  Box box = await StorageService.openBox<T>();
  await StorageService.setDatabaseItem(box, T.toString(), text);
  StorageService.closeBox(box);

  Map<int, T> items = {};
  print('parsing json');
  final type = DefinitionTableNames.identities[T];
  inspect(type);
  Map<String, dynamic> decoded = jsonDecode(text) as Map<String, dynamic>;
  print('parsed json');
  for (final entry in decoded.entries) {
    items[int.parse(entry.key)] = type!(entry.value);
  }
  print('Objectified');
  return items;
}

Future<Map<int, T>> _parseJsonDb<T>(String text) async {
  Map<int, T> items = {};
  print('parsing json');
  final type = DefinitionTableNames.identities[T];
  inspect(type);
  Map<String, dynamic> decoded = jsonDecode(text) as Map<String, dynamic>;
  print('parsed json');
  for (final entry in decoded.entries) {
    items[int.parse(entry.key)] = type!(entry.value);
  }
  print('Objectified');
  return items;
}

Map<String, dynamic> _decode(String text) {
  return jsonDecode(text) as Map<String, dynamic>;
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
