import 'dart:convert';
import 'package:bungie_api/models/destiny_manifest.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bungie_api/responses/destiny_manifest_response.dart';
import 'package:isar/isar.dart';
import 'package:quria/data/models/AllDestinyManifestComponents.model.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_class_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_collectible_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_damage_type_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_energy_type_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_equipment_slot_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_bucket_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_plug_set_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_presentation_node_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_sandbox_perk_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_stat_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_talent_grid_definition.dart';
import 'package:quria/data/models/helpers/manifestHelper.model.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/definition_table_names.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/storage/storage.service.dart';

typedef DownloadProgress = void Function(int downloaded, int total);

class ManifestService {
  final BungieApiService api = BungieApiService();
  static DestinyManifest? _manifestInfo;
  static String language = "en";
  static final AllDestinyManifestComponents manifestParsed = AllDestinyManifestComponents();
  static final manifestList = DefinitionTableNames();
  final StorageService storage = StorageService();
  static final ManifestService _singleton = ManifestService._internal();

  factory ManifestService() {
    return _singleton;
  }
  ManifestService._internal();

  static Future<DestinyManifest> loadManifestInfo() async {
    if (_manifestInfo != null) {
      return _manifestInfo!;
    }
    DestinyManifestResponse response = await BungieApiService.getManifestInfo();
    _manifestInfo = response.response;
    return _manifestInfo!;
  }

  static Future<void> loadAllManifest() async {
    if (await isManifestOutdated()) {
      final manifests = await compute(
          _typeManifests,
          ManifestHelper(
            manifest: await loadManifestInfo(),
            language: language,
          ));

      await StorageService.isar.writeTxn((isar) async {
        await isar.destinyInventoryItemDefinitions.putAll(manifests[0] as List<DestinyInventoryItemDefinition>);
        await isar.destinyClassDefinitions.putAll(manifests[1] as List<DestinyClassDefinition>);
        await isar.destinyDamageTypeDefinitions.putAll(manifests[2] as List<DestinyDamageTypeDefinition>);
        await isar.destinyStatDefinitions.putAll(manifests[3] as List<DestinyStatDefinition>);
        await isar.destinyTalentGridDefinitions.putAll(manifests[4] as List<DestinyTalentGridDefinition>);
        await isar.destinySandboxPerkDefinitions.putAll(manifests[5] as List<DestinySandboxPerkDefinition>);
        await isar.destinyEquipmentSlotDefinitions.putAll(manifests[6] as List<DestinyEquipmentSlotDefinition>);
        await isar.destinyPresentationNodeDefinitions.putAll(manifests[7] as List<DestinyPresentationNodeDefinition>);
        await isar.destinyEnergyTypeDefinitions.putAll(manifests[8] as List<DestinyEnergyTypeDefinition>);
        await isar.destinyPlugSetDefinitions.putAll(manifests[9] as List<DestinyPlugSetDefinition>);
        await isar.destinyCollectibleDefinitions.putAll(manifests[10] as List<DestinyCollectibleDefinition>);
        await isar.destinyInventoryBucketDefinitions.putAll(manifests[11] as List<DestinyInventoryBucketDefinition>);
      });

      await mainManifestInfo();
      saveManifestVersion();
    } else {
      await mainManifestInfo();
    }
  }

  /// gets main informations from the store
  /// and puts them in the manifestParsed
  static Future<void> mainManifestInfo() async {
    await Future.wait([
      StorageService.isar.destinyClassDefinitions.where().findAll().then(
            (value) => AllDestinyManifestComponents.setValue<DestinyClassDefinition>(
                {for (DestinyClassDefinition item in value) item.hash!: item}),
          ),
      StorageService.isar.destinyDamageTypeDefinitions.where().findAll().then(
            (value) => AllDestinyManifestComponents.setValue<DestinyDamageTypeDefinition>(
                {for (DestinyDamageTypeDefinition item in value) item.hash!: item}),
          ),
      StorageService.isar.destinyStatDefinitions.where().findAll().then(
            (value) => AllDestinyManifestComponents.setValue<DestinyStatDefinition>(
                {for (DestinyStatDefinition item in value) item.hash!: item}),
          ),
      StorageService.isar.destinyTalentGridDefinitions.where().findAll().then(
            (value) => AllDestinyManifestComponents.setValue<DestinyTalentGridDefinition>(
                {for (DestinyTalentGridDefinition item in value) item.hash!: item}),
          ),
      StorageService.isar.destinySandboxPerkDefinitions.where().findAll().then(
            (value) => AllDestinyManifestComponents.setValue<DestinySandboxPerkDefinition>(
                {for (DestinySandboxPerkDefinition item in value) item.hash!: item}),
          ),
      StorageService.isar.destinyEquipmentSlotDefinitions.where().findAll().then(
            (value) => AllDestinyManifestComponents.setValue<DestinyEquipmentSlotDefinition>(
                {for (DestinyEquipmentSlotDefinition item in value) item.hash!: item}),
          ),
      StorageService.isar.destinyEnergyTypeDefinitions.where().findAll().then(
            (value) => AllDestinyManifestComponents.setValue<DestinyEnergyTypeDefinition>(
                {for (DestinyEnergyTypeDefinition item in value) item.hash!: item}),
          ),
      StorageService.isar.destinyPlugSetDefinitions.where().findAll().then(
            (value) => AllDestinyManifestComponents.setValue<DestinyPlugSetDefinition>(
                {for (DestinyPlugSetDefinition item in value) item.hash!: item}),
          ),
      StorageService.isar.destinyCollectibleDefinitions.where().findAll().then(
            (value) => AllDestinyManifestComponents.setValue<DestinyCollectibleDefinition>(
                {for (DestinyCollectibleDefinition item in value) item.hash!: item}),
          ),
      StorageService.isar.destinyInventoryBucketDefinitions.where().findAll().then(
            (value) => AllDestinyManifestComponents.setValue<DestinyInventoryBucketDefinition>(
                {for (DestinyInventoryBucketDefinition item in value) item.hash!: item}),
          ),
    ]);
  }

  /// if the data is not available it will fetch it and retreive the version
  ///
  /// promise of bool
  static Future<String?> getManifestVersion() async {
    if (_manifestInfo != null) {
      return _manifestInfo!.version;
    }
    DestinyManifestResponse response = await BungieApiService.getManifestInfo();
    _manifestInfo = response.response;
    return _manifestInfo!.version;
  }

  static Future<bool> isManifestOutdated() async {
    final version = await ManifestService.getManifestVersion();
    return await StorageService.getLocalStorage("manifestVersion") != "$language$version";
  }

  static Future<void> saveManifestVersion() async {
    final version = await ManifestService.getManifestVersion();
    return await StorageService.setLocalStorage("manifestVersion", "$language$version");
  }
}

/// Given [manifestInfo] fetches all needed manifests
/// types it correctly then stores them in isarDB
///
/// promise of void
Future<List> _typeManifests(ManifestHelper manifestInfo) async {
  Future<String> getManifestRemote<T>() async {
    http.Response res = await http.get(Uri.parse(DestinyData.bungieLink +
        manifestInfo
            .manifest.jsonWorldComponentContentPaths![manifestInfo.language]![DefinitionTableNames.fromClass[T]!]!));
    return res.body;
  }

  Future<List<T>> typeData<T>() async {
    String manifest = await getManifestRemote<T>();
    List<T> items = [];
    final type = DefinitionTableNames.identities[T];
    Map<String, dynamic> decoded = jsonDecode(manifest) as Map<String, dynamic>;
    for (final entry in decoded.entries) {
      items.add(type!(entry.value));
    }
    return items;
  }

  return await Future.wait([
    typeData<DestinyInventoryItemDefinition>(),
    typeData<DestinyClassDefinition>(),
    typeData<DestinyDamageTypeDefinition>(),
    typeData<DestinyStatDefinition>(),
    typeData<DestinyTalentGridDefinition>(),
    typeData<DestinySandboxPerkDefinition>(),
    typeData<DestinyEquipmentSlotDefinition>(),
    typeData<DestinyPresentationNodeDefinition>(),
    typeData<DestinyEnergyTypeDefinition>(),
    typeData<DestinyPlugSetDefinition>(),
    typeData<DestinyCollectibleDefinition>(),
    typeData<DestinyInventoryBucketDefinition>(),
  ]);
}
