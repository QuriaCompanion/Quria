import 'dart:convert';
import 'dart:developer';

import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/foundation.dart';
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

  Future<DestinyManifest> loadManifestInfo() async {
    if (_manifestInfo != null) {
      return _manifestInfo!;
    }
    print('Loading manifest info');
    DestinyManifestResponse response = await api.getManifest();
    _manifestInfo = response.response;
    return _manifestInfo!;
  }

  Future<Map<int, DestinyInventoryItemDefinition>> getManifest() async {
    final bool = await isManifestSaved();
    print(bool);
    if (bool == true) {
      return await compute(
          _parsedDestinyInventoryItemDefinition, await getManifestLocal());
    } else {
      return await compute(
          _parsedDestinyInventoryItemDefinition, await getManifestRemote());
    }
  }

  Future<String> getManifestLocal() async {
    return await storage.getDatabase('DestinyInventoryItemDefinition');
  }

  Future<String> getManifestRemote({DownloadProgress? onProgress}) async {
    DestinyManifest info = await loadManifestInfo();
    String language = "fr";
    for (final entry in info.jsonWorldComponentContentPaths!['fr']!.entries) {
      http.Response res =
          await http.get(Uri.parse('https://www.bungie.net' + entry.value));
      print('downloaded ${entry.key}');
      await storage.setDatabase(entry.key, res.body);
    }
    await storage.setLocalStorage('manifestSaved', true);
    return await getManifestLocal();
  }

  Map<int, DestinyInventoryItemDefinition>
      _parsedDestinyInventoryItemDefinition(String text) {
    Map<int, DestinyInventoryItemDefinition> items = {};
    Map decoded = json.decode(text);
    for (final entry in decoded.entries) {
      items[int.parse(entry.key)] =
          DestinyInventoryItemDefinition.fromJson(entry.value);
    }
    return items;
  }

  Future<bool?> isManifestSaved() async {
    return await storage.getLocalStorage('manifestSaved');
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
}
