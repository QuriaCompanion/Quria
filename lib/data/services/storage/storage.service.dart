import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isar/isar.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
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
import 'package:quria/data/services/bungie_api/enums/definition_table_names.dart';

/// StorageService is to be called using static methods.
///
/// It uses the Hive Flutter package to store data in the indexedDB.
///
/// It uses the LocalStorage package to store data in the local storage.
class StorageService {
  static late final LocalStorage _storage;
  static late Isar isar;
  static init() async {
    _storage = LocalStorage('Quria');

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
      directory: kIsWeb ? null : (await getApplicationSupportDirectory()).path,
    );
  }

  static isolateInit() async {
    if (!kIsWeb) {
      final directory = await getApplicationDocumentsDirectory();
      Hive.init(directory.path + '/Quria');
    }
  }

  /// Given a storage [key] and a [value], stores the [value] in localStorage.
  static Future<void> setLocalStorage(String key, dynamic value) async {
    await _storage.setItem(key, value);
    return;
  }

  /// Given a storage [key] , return the value from localStorage.
  static Future<dynamic> getLocalStorage(String key) async {
    return await _storage.getItem(key);
  }

  /// Given a storage [key] , removes localStorage entry
  static Future<void> removeLocalStorage(String key) async {
    await _storage.deleteItem(key);
    return;
  }

  /// clears all values from the LocalStorage
  static Future<void> purgeLocalStorage() async {
    await _storage.clear();
    return;
  }

  Future<Map<int, T>> getDefinitions<T>(List<int> hashes) async {
    List<T> definitions = await DefinitionTableNames.getDefinitions[T]!(hashes);
    return {for (int i = 0; i < hashes.length; i++) hashes[i]: definitions[i]};
  }
}
