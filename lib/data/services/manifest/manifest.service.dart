import 'dart:convert';
import 'dart:developer';

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
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_plug_set_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_presentation_node_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_sandbox_perk_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_stat_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_talent_grid_definition.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/definition_table_names.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/storage/storage.service.dart';

typedef DownloadProgress = void Function(int downloaded, int total);

class ManifestService {
  final BungieApiService api = BungieApiService();
  static DestinyManifest? _manifestInfo;
  static final AllDestinyManifestComponents manifestParsed =
      AllDestinyManifestComponents();
  static final manifestList = DefinitionTableNames();
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

  static loadAllManifest() async {
    if (await isManifestOutdated()) {
      await Future.wait([
        getManifest<DestinyInventoryItemDefinition>(),
        getManifest<DestinyClassDefinition>(),
        getManifest<DestinyDamageTypeDefinition>(),
        getManifest<DestinyStatDefinition>(),
        getManifest<DestinyCollectibleDefinition>(),
        getManifest<DestinyClassDefinition>(),
        getManifest<DestinySandboxPerkDefinition>(),
        getManifest<DestinyEquipmentSlotDefinition>(),
        getManifest<DestinyTalentGridDefinition>(),
        getManifest<DestinyPresentationNodeDefinition>(),
        getManifest<DestinyPlugSetDefinition>(),
        getManifest<DestinyEnergyTypeDefinition>(),
      ]);
      StorageService.isar.writeTxn((isar) async {
        await isar.destinyInventoryItemDefinitions.putAll(
            manifestParsed.destinyInventoryItemDefinition!.values.toList());
        await isar.destinyClassDefinitions
            .putAll(manifestParsed.destinyClassDefinition!.values.toList());
        await isar.destinyDamageTypeDefinitions.putAll(
            manifestParsed.destinyDamageTypeDefinition!.values.toList());
        await isar.destinyStatDefinitions
            .putAll(manifestParsed.destinyStatDefinition!.values.toList());
        await isar.destinyTalentGridDefinitions.putAll(
            manifestParsed.destinyTalentGridDefinition!.values.toList());
        await isar.destinySandboxPerkDefinitions.putAll(
            manifestParsed.destinySandboxPerkDefinition!.values.toList());
        await isar.destinyEquipmentSlotDefinitions.putAll(
            manifestParsed.destinyEquipmentSlotDefinition!.values.toList());
        await isar.destinyPresentationNodeDefinitions.putAll(
            manifestParsed.destinyPresentationNodeDefinition!.values.toList());
        await isar.destinyEnergyTypeDefinitions.putAll(
            manifestParsed.destinyEnergyTypeDefinition!.values.toList());
        await isar.destinyPlugSetDefinitions
            .putAll(manifestParsed.destinyPlugSetDefinition!.values.toList());
        await isar.destinyCollectibleDefinitions.putAll(
            manifestParsed.destinyCollectibleDefinition!.values.toList());
      }).then((value) {
        manifestSaved();
      });
    } else {
      await StorageService.isar.destinyClassDefinitions.where().findAll().then(
          (value) =>
              AllDestinyManifestComponents.setValue<DestinyClassDefinition>({
                for (DestinyClassDefinition item in value) item.hash!: item
              }));
      inspect(manifestParsed.destinyClassDefinition);
      await StorageService.isar.destinyDamageTypeDefinitions
          .where()
          .findAll()
          .then((value) => AllDestinyManifestComponents.setValue<
                  DestinyDamageTypeDefinition>({
                for (DestinyDamageTypeDefinition item in value) item.hash!: item
              }));
      await StorageService.isar.destinyStatDefinitions.where().findAll().then(
          (value) =>
              AllDestinyManifestComponents.setValue<DestinyStatDefinition>({
                for (DestinyStatDefinition item in value) item.hash!: item
              }));
      await StorageService.isar.destinyTalentGridDefinitions
          .where()
          .findAll()
          .then((value) => AllDestinyManifestComponents.setValue<
                  DestinyTalentGridDefinition>({
                for (DestinyTalentGridDefinition item in value) item.hash!: item
              }));
      await StorageService.isar.destinySandboxPerkDefinitions
          .where()
          .findAll()
          .then((value) => AllDestinyManifestComponents.setValue<
                  DestinySandboxPerkDefinition>({
                for (DestinySandboxPerkDefinition item in value)
                  item.hash!: item
              }));
      await StorageService.isar.destinyEquipmentSlotDefinitions
          .where()
          .findAll()
          .then((value) => AllDestinyManifestComponents.setValue<
                  DestinyEquipmentSlotDefinition>({
                for (DestinyEquipmentSlotDefinition item in value)
                  item.hash!: item
              }));
      await StorageService.isar.destinyPresentationNodeDefinitions
          .where()
          .findAll()
          .then((value) => AllDestinyManifestComponents.setValue<
                  DestinyPresentationNodeDefinition>({
                for (DestinyPresentationNodeDefinition item in value)
                  item.hash!: item
              }));
      await StorageService.isar.destinyEnergyTypeDefinitions
          .where()
          .findAll()
          .then((value) => AllDestinyManifestComponents.setValue<
                  DestinyEnergyTypeDefinition>({
                for (DestinyEnergyTypeDefinition item in value) item.hash!: item
              }));
      await StorageService.isar.destinyPlugSetDefinitions
          .where()
          .findAll()
          .then((value) =>
              AllDestinyManifestComponents.setValue<DestinyPlugSetDefinition>({
                for (DestinyPlugSetDefinition item in value) item.hash!: item
              }));
      await StorageService.isar.destinyCollectibleDefinitions
          .where()
          .findAll()
          .then((value) => AllDestinyManifestComponents.setValue<
                  DestinyCollectibleDefinition>({
                for (DestinyCollectibleDefinition item in value)
                  item.hash!: item
              }));
      await StorageService.isar.destinyInventoryItemDefinitions
          .where()
          .findAll()
          .then((value) => AllDestinyManifestComponents.setValue<
                  DestinyInventoryItemDefinition>({
                for (DestinyInventoryItemDefinition item in value)
                  item.hash!: item
              }));
    }
  }

  /// Given  a type [T] download the data from the manifest and stores it in [manifestParsed]
  ///
  /// This is a generic method that can be used to download any type of data from the manifest
  ///
  /// promise of void
  static Future<void> getManifest<T>() async {
    try {
      await AllDestinyManifestComponents.setValue<T>(
          await compute<String, Map<int, T>>(_typeData<T>,
              await getManifestRemote(DefinitionTableNames.fromClass[T]!)));
    } catch (e) {
      rethrow;
    }
  }

  static Future<String?> getManifestVersion() async {
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

  static Future<bool> isManifestOutdated() async {
    final version = await ManifestService.getManifestVersion();
    return await StorageService.getLocalStorage("manifestVersion") != version;
  }

  /// Given a [manifestName] sets corresponding manifestSaved value to true
  static Future<void> manifestSaved() async {
    final version = await ManifestService.getManifestVersion();
    return await StorageService.setLocalStorage("manifestVersion", version);
  }
}

/// Given a [manifest] and type [T]
///
/// returns the correctly typed data
///
/// the data returned is typed and ready to be used
Map<int, T> _typeData<T>(String manifest) {
  Map<int, T> items = {};
  final type = DefinitionTableNames.identities[T];
  Map<String, dynamic> decoded = jsonDecode(manifest) as Map<String, dynamic>;
  for (final entry in decoded.entries) {
    items[int.parse(entry.key)] = type!(entry.value);
  }
  return items;
}
