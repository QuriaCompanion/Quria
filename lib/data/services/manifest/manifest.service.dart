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
    Isar isar;
    isar = await Isar.open(
      relaxedDurability: true,
      schemas: [
        DestinyInventoryItemDefinitionSchema,
        DestinyClassDefinitionSchema,
        DestinyDamageTypeDefinitionSchema,
        DestinyStatDefinitionSchema,
        DestinyTalentGridDefinitionSchema,
        DestinySandboxPerkDefinitionSchema,
        DestinyEnergyTypeDefinitionSchema,
        DestinyEquipmentSlotDefinitionSchema,
        DestinyPresentationNodeDefinitionSchema,
        DestinyCollectibleDefinitionSchema,
        DestinyPlugSetDefinitionSchema,
      ],
    );
    if (await isManifestOutdated(await ManifestService.getManifestVersion())) {
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
      print("downloaded");
      await isar.writeTxn((isar) async {
        await isar.destinyInventoryItemDefinitions
            .putAll(manifestList.destinyInventoryItemDefinition!);
        await isar.destinyClassDefinitions
            .putAll(manifestList.destinyClassDefinition!);
        await isar.destinyDamageTypeDefinitions
            .putAll(manifestList.destinyDamageTypeDefinition!);
        await isar.destinyStatDefinitions
            .putAll(manifestList.destinyStatDefinition!);
        await isar.destinyTalentGridDefinitions
            .putAll(manifestList.destinyTalentGridDefinition!);
        await isar.destinySandboxPerkDefinitions
            .putAll(manifestList.destinySandboxPerkDefinition!);
        await isar.destinyEquipmentSlotDefinitions
            .putAll(manifestList.destinyEquipmentSlotDefinition!);
        await isar.destinyPresentationNodeDefinitions
            .putAll(manifestList.destinyPresentationNodeDefinition!);
        await isar.destinyEnergyTypeDefinitions
            .putAll(manifestList.destinyEnergyTypeDefinition!);
        await isar.destinyPlugSetDefinitions
            .putAll(manifestList.destinyPlugSetDefinition!);
        await isar.destinyCollectibleDefinitions
            .putAll(manifestList.destinyCollectibleDefinition!);
      }).then((value) {});
    }
  }

  /// Given  a type [T] download the data from the manifest and stores it in [manifestParsed]
  ///
  /// This is a generic method that can be used to download any type of data from the manifest
  ///
  /// promise of void
  static Future<void> getManifest<T>() async {
    try {
      DefinitionTableNames.setValue<T>(await compute<String, List<T>>(
          _typeData<T>,
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

  static Future<bool> isManifestOutdated(String? version) async {
    return await StorageService.getLocalStorage("manifestVersion") != version;
  }

  /// Given a [manifestName] sets corresponding manifestSaved value to true
  static Future<void> manifestSaved(String version) async {
    return await StorageService.setLocalStorage("manifestVersion", version);
  }
}

/// Given a [manifest] and type [T]
///
/// returns the correctly typed data
///
/// the data returned is typed and ready to be used
List<T> _typeData<T>(String manifest) {
  List<T> items = [];
  final type = DefinitionTableNames.identities[T];
  Map<String, dynamic> decoded = jsonDecode(manifest) as Map<String, dynamic>;
  for (final entry in decoded.values) {
    items.add(type!(entry));
  }
  return items;
}
