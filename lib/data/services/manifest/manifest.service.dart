import 'dart:developer';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:archive/archive.dart';
import 'package:bungie_api/models/destiny_manifest.dart';
import 'package:bungie_api/responses/destiny_manifest_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/storage/db_web.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/data/services/storage/db_mobile.service.dart';

typedef DownloadProgress = void Function(int downloaded, int total);

class ManifestService {
  final BungieApiService api = BungieApiService();
  DestinyManifest? _manifestInfo;

  final Map<String, dynamic> _cached = {};
  static final ManifestService _singleton = ManifestService._internal();

  factory ManifestService() {
    return _singleton;
  }
  ManifestService._internal();

  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }

  // Future<DestinyManifest> loadManifestInfo() async {
  //   if (_manifestInfo != null) {
  //     return _manifestInfo!;
  //   }
  //   print('Loading manifest info');
  //   DestinyManifestResponse response = await api.getManifest();
  //   _manifestInfo = response.response;
  //   return _manifestInfo!;
  // }

  Future<bool> download({DownloadProgress? onProgress}) async {
    // DestinyManifest info = await loadManifestInfo();
    // String language = "fr";
    // String path = info.jsonWorldContentPaths![language]!;
    // String? url = BungieApiService.url(path);
    http.Response res = await http.get(Uri.parse(
        "https://www.bungie.net/common/destiny2_content/json/fr/DestinyInventoryItemDefinition-518fc4dd-cf15-4276-954d-4a16992d2eaa.json"));
    final manifest = res.body;
    inspect(manifest);
    // check if is web
    if (kIsWeb) {
      DbWeb().openDb(manifest);
    } else {
      DbMobile().openDb(manifest);
    }

    // bool success = await test();
    // if (!success) return false;

    // await saveManifestVersion(path);
    // return success;
    return true;
  }

  // Future<bool> test() async {
  //   var def = await getDefinition<DestinyInventoryItemDefinition>(3628991658);
  //   return def?.displayProperties?.name != null;
  // }

  static List<int> _extractFromZip(dynamic zipFile) {
    List<int> unzippedData;
    List<int> bytes = zipFile.readAsBytesSync();
    ZipDecoder decoder = ZipDecoder();
    Archive archive = decoder.decodeBytes(bytes);
    for (ArchiveFile file in archive) {
      if (file.isFile) {
        unzippedData = file.content;
        return unzippedData;
      }
    }
    return [];
  }

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

  Future<void> saveManifestVersion(String version) async {
    StorageService _prefs = StorageService.language();
    _prefs.setString(StorageKeys.manifestVersion, version);
  }

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
}
