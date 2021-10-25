import 'dart:convert';
import 'dart:developer';

import 'package:archive/archive.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:localstorage/localstorage.dart';
import 'package:universal_io/io.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bungie_api/models/destiny_manifest.dart';
import 'package:bungie_api/responses/destiny_manifest_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:flutter/services.dart' show rootBundle;

typedef DownloadProgress = void Function(int downloaded, int total);

class ManifestService {
  var _db;
  final BungieApiService api = BungieApiService();
  DestinyManifest? _manifestInfo;
  static final ManifestService _singleton = ManifestService._internal();

  factory ManifestService() {
    return _singleton;
  }
  ManifestService._internal();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<DestinyManifest> loadManifestInfo() async {
    if (_manifestInfo != null) {
      return _manifestInfo!;
    }
    DestinyManifestResponse response = await api.getManifest();
    _manifestInfo = response.response;
    return _manifestInfo!;
  }

  Future<bool> download({DownloadProgress? onProgress}) async {
    DestinyManifest info = await loadManifestInfo();
    String language = "fr";
    String path = info.jsonWorldContentPaths![language]!;
    String url = BungieApiService.url(path)!;
    String localPath = await _localPath;
    HttpClient httpClient = HttpClient();
    HttpClientRequest req = await httpClient.getUrl(Uri.parse(url));
    HttpClientResponse res = await req.close();
    File zipFile = File("$localPath/manifest_temp.zip");
    IOSink sink = zipFile.openWrite();
    int totalSize = res.contentLength;
    int loaded = 0;
    Stream<List<int>> stream = res.asBroadcastStream();
    await for (var data in stream) {
      loaded += data.length;
      sink.add(data);
      if (onProgress != null) {
        onProgress(loaded, totalSize);
      }
    }
    await sink.flush();
    await sink.close();

    List<int> unzippedData = await compute(_extractFromZip, zipFile);
    StorageService storage = StorageService.language();
    await storage.saveDatabase(StorageKeys.manifestFile, unzippedData);

    await zipFile.delete();

    await _openDb();

    bool success = await test();
    if (!success) return false;

    await saveManifestVersion(path);
    _cached.clear();
    return success;
  }

  LazyDatabase _openDb() {
    return LazyDatabase(() async {
      var storage = StorageService();
      var path = await storage.getPath(StorageKeys.manifestFile, dbPath: true);
      final file = File(path);
      return NativeDatabase(file);
    });
  }

  static List<int> _extractFromZip(dynamic zipFile) {
    List<int> unzippedData;
    List<int> bytes = zipFile.readAsBytesSync();
    ZipDecoder decoder = ZipDecoder();
    Archive archive = decoder.decodeBytes(bytes);
    for (ArchiveFile file in archive) {
      if (file.isFile) {
        unzippedData = file.content;
      }
    }
    return unzippedData;
  }

  Future<void> saveManifestVersion(String version) async {
    StorageService _prefs = StorageService.language();
    _prefs.setString(StorageKeys.manifestVersion, version);
  }
}
