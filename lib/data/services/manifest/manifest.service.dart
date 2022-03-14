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
      if (await isManifestSaved(manifestName, await getManifestVersion())) {
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
        await manifestSaved(manifestName, await getManifestVersion());
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static getManifestVersion() async {
    if (_manifestInfo != null) {
      return _manifestInfo!.version;
    }
    DestinyManifestResponse response = await BungieApiService.getManifestInfo();
    _manifestInfo = response.response;
    return _manifestInfo!.version;
  }

  static Future<String> getManifestRemote<T>(String manifestName) async {
    DestinyManifest info = await loadManifestInfo();

    String language = "fr";
    http.Response res = await http.get(Uri.parse(DestinyData.bungieLink +
        info.jsonWorldComponentContentPaths![language]![manifestName]!));
    return res.body;
  }

  static Future<bool> isManifestSaved(
      String manifestName, String version) async {
    return await StorageService.getLocalStorage(
            'manifestSaved_$manifestName$version') ??
        false;
  }

  // static Future<bool> isManifestOutDated(String manifestVersion) async {
  //   return manifestVersion !=
  //       await StorageService.getLocalStorage('manifestVersion');
  // }

  // static setCurrentManifestVersion(String manifestVersion) async {
  //   await StorageService.setLocalStorage('manifestVersion', manifestVersion);
  // }

  /// Given a [manifestName] sets corresponding manifestSaved value to true
  static Future<void> manifestSaved(String manifestName, version) async {
    return await StorageService.setLocalStorage(
        'manifestSaved_$manifestName$version', true);
  }
}

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
