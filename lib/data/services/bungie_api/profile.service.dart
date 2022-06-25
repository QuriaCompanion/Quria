// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:bungie_api/models/destiny_plug_sets_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_profile_response.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_talent_grid_definition.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/collectible_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/providers/plugs_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:bungie_api/enums/destiny_component_type.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';

enum LastLoadedFrom { server, cache }

class ProfileComponentGroups {
  static const List<DestinyComponentType> basicProfile = [
    DestinyComponentType.Characters,
    DestinyComponentType.CharacterActivities,
    DestinyComponentType.CharacterProgressions,
    DestinyComponentType.CharacterEquipment,
    DestinyComponentType.CharacterInventories,
    DestinyComponentType.ProfileInventories,
    DestinyComponentType.ProfileCurrencies,
    DestinyComponentType.ProfileProgression,
    DestinyComponentType.ItemInstances,
    DestinyComponentType.ItemStats,
    DestinyComponentType.ItemObjectives,
    DestinyComponentType.ItemTalentGrids,
    DestinyComponentType.ItemSockets,
    DestinyComponentType.ItemPlugStates,
    DestinyComponentType.ItemPlugObjectives,
    DestinyComponentType.ItemReusablePlugs,
  ];

  static const List<DestinyComponentType> inventories = [
    DestinyComponentType.CharacterEquipment,
    DestinyComponentType.CharacterInventories,
    DestinyComponentType.ProfileInventories,
  ];

  static const List<DestinyComponentType> collections = [
    DestinyComponentType.Collectibles,
    DestinyComponentType.PresentationNodes,
  ];

  static const List<DestinyComponentType> triumphs = [
    DestinyComponentType.Records,
    DestinyComponentType.Metrics,
    DestinyComponentType.PresentationNodes,
  ];

  static const List<DestinyComponentType> everything = [
    DestinyComponentType.Characters,
    DestinyComponentType.CharacterActivities,
    DestinyComponentType.CharacterProgressions,
    DestinyComponentType.CharacterEquipment,
    DestinyComponentType.CharacterInventories,
    DestinyComponentType.ProfileInventories,
    DestinyComponentType.ProfileCurrencies,
    DestinyComponentType.ProfileProgression,
    DestinyComponentType.ItemInstances,
    DestinyComponentType.ItemStats,
    DestinyComponentType.ItemObjectives,
    DestinyComponentType.ItemTalentGrids,
    DestinyComponentType.ItemSockets,
    DestinyComponentType.ItemPlugStates,
    DestinyComponentType.ItemPlugObjectives,
    DestinyComponentType.ItemReusablePlugs,
    DestinyComponentType.Collectibles,
    DestinyComponentType.Records,
    DestinyComponentType.Metrics,
    DestinyComponentType.PresentationNodes,
    DestinyComponentType.Profiles,
  ];
}

class ProfileService {
  static final ProfileService _singleton = ProfileService._internal();
  factory ProfileService() {
    return _singleton;
  }
  ProfileService._internal();

  static const List<int> profileBuckets = [
    InventoryBucket.modifications,
    InventoryBucket.shaders,
    InventoryBucket.consumables
  ];
  final _api = BungieApiService();

  List<DestinyComponentType> updateComponents =
      ProfileComponentGroups.everything;
  DateTime? _lastUpdated;
  Future<void> fetchProfileData(
    BuildContext context, {
    List<DestinyComponentType>? components,
  }) async {
    try {
      if (_lastUpdated != null &&
          DateTime.now().difference(_lastUpdated!).inSeconds < 30) {
        return;
      }
      await _updateProfileData(context, updateComponents);

      return;
    } catch (e) {
      throw ErrorDescription("Failed to load profile data");
    }
  }

  static reset() {
    // TODO: implement reset
  }

  Future<void> _updateProfileData(
      BuildContext context, List<DestinyComponentType> components) async {
    DestinyProfileResponse? response;
    response = await _api.getCurrentProfile(components);
    _lastUpdated = DateTime.now();
    final List<int> inventoryItemIds = [];
    final List<int> talentIds = [];
    inventoryItemIds
        .addAll([3473581026, 2771648715, 549825413, 4287863773, 3500810712]);
    if (response == null) {
      return;
    }
    for (List<DestinyItemPlug> sockets
        in response.profilePlugSets!.data!.plugs!.values) {
      for (DestinyItemPlug socket in sockets) {
        if (socket.plugItemHash != null) {
          inventoryItemIds.add(socket.plugItemHash!);
        }
      }
    }
    for (DestinyPlugSetsComponent characterPlugSet
        in response.characterPlugSets!.data!.values) {
      for (List<DestinyItemPlug> sockets in characterPlugSet.plugs!.values) {
        for (DestinyItemPlug socket in sockets) {
          if (socket.plugItemHash != null) {
            inventoryItemIds.add(socket.plugItemHash!);
          }
        }
      }
    }
    if (response.profileInventory?.data?.items != null) {
      for (final item in response.profileInventory!.data!.items!) {
        if (item.itemHash != null) {
          inventoryItemIds.add(item.itemHash!);
        }
      }
    }
    if (response.characterInventories?.data != null) {
      for (final character in response.characterInventories!.data!.values) {
        if (character.items != null) {
          for (final item in character.items!) {
            if (item.itemHash != null) {
              inventoryItemIds.add(item.itemHash!);
            }
          }
        }
      }
    }
    if (response.characterEquipment?.data != null) {
      for (final character in response.characterEquipment!.data!.values) {
        if (character.items != null) {
          for (final item in character.items!) {
            if (item.itemHash != null) {
              inventoryItemIds.add(item.itemHash!);
            }
          }
        }
      }
    }
    if (response.itemComponents?.sockets?.data != null) {
      for (final socketGroup
          in response.itemComponents!.sockets!.data!.values) {
        for (final socket in socketGroup.sockets!) {
          if (socket.plugHash != null) {
            inventoryItemIds.add(socket.plugHash!);
          }
        }
      }
    }
    if (response.itemComponents?.talentGrids != null) {
      for (final talent in response.itemComponents!.talentGrids!.data!.values) {
        if (talent.talentGridHash != null) {
          talentIds.add(talent.talentGridHash!);
        }
      }
    }
    inventoryItemIds.addAll([
      204137529,
      3961599962,
      3682186345,
      2850583378,
      555005975,
      2645858828,
      1227870362,
      3355995799,
      2623485440,
      4048838440,
      3699676109,
      3253038666
    ]);
    await StorageService.getDefinitions<DestinyInventoryItemDefinition>(
        inventoryItemIds);
    await StorageService.getDefinitions<DestinyTalentGridDefinition>(talentIds);
    if (components.contains(DestinyComponentType.ProfileInventories)) {
      Provider.of<InventoryProvider>(context, listen: false)
          .setProfileInventory(response.profileInventory?.data?.items ?? []);
    }
    if (components.contains(DestinyComponentType.ItemPlugStates)) {
      Provider.of<PlugsProvider>(context, listen: false)
          .setProfilePlugSets(response.profilePlugSets?.data?.plugs ?? {});
      Provider.of<PlugsProvider>(context, listen: false)
          .setCharacterPlugSets(response.characterPlugSets?.data ?? {});
    }

    if (components.contains(DestinyComponentType.Collectibles)) {
      Provider.of<CollectibleProvider>(context, listen: false)
          .setProfileCollectible(response.profileCollectibles?.data);
      Provider.of<CollectibleProvider>(context, listen: false)
          .setCharacterCollectible(response.characterCollectibles?.data ?? {});
    }
    if (components.contains(DestinyComponentType.Characters)) {
      Provider.of<CharactersProvider>(context, listen: false)
          .init(response.characters?.data ?? {});
    }

    if (components.contains(DestinyComponentType.CharacterInventories)) {
      Provider.of<InventoryProvider>(context, listen: false)
          .setCharacterInventories(response.characterInventories?.data ?? {});
    }
    if (components.contains(DestinyComponentType.CharacterEquipment)) {
      Provider.of<InventoryProvider>(context, listen: false)
          .setCharacterEquipment(response.characterEquipment?.data ?? {});
    }

    if (components.contains(DestinyComponentType.ItemInstances)) {
      Provider.of<ItemProvider>(context, listen: false)
          .init(response.itemComponents);
    }
  }

  String getDropLocation(int hash) {
    return ManifestService
            .manifestParsed.destinyCollectibleDefinition[hash]?.sourceString ??
        "Source inconnu";
  }

  List<List<DestinyInventoryItemDefinition>> getItemPerksAsItemDef(
      Map<String, List<DestinyItemPlugBase>>? plugs,
      List<DestinyItemSocketState>? sockets) {
    List<List<DestinyInventoryItemDefinition>> perks = [];
    for (DestinyItemSocketState socket in sockets!) {
      if (plugs != null) {
        for (List<DestinyItemPlugBase> plug in plugs.values) {
          if (plug.any((element) => element.plugItemHash == socket.plugHash) &&
              DestinyData.perkCategoryHash.contains(ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition[socket.plugHash]!
                  .plug!
                  .plugCategoryHash!)) {
            List<DestinyInventoryItemDefinition> plugDefitions = [];
            for (DestinyItemPlugBase plug in plug) {
              final plugDef = ManifestService.manifestParsed
                  .destinyInventoryItemDefinition[plug.plugItemHash];
              if (plugDef == null) continue;
              plugDefitions.add(plugDef);
            }
            perks.add(plugDefitions);
          }
        }
      }
      if (ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition[socket.plugHash]
                  ?.displayProperties
                  ?.icon !=
              null &&
          DestinyData.perkCategoryHash.contains(
            ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition[socket.plugHash]!
                .plug!
                .plugCategoryHash!,
          ) &&
          !perks.any((element) => element.contains(
                ManifestService.manifestParsed
                    .destinyInventoryItemDefinition[socket.plugHash]!,
              ))) {
        perks.add([
          ManifestService
              .manifestParsed.destinyInventoryItemDefinition[socket.plugHash]!
        ]);
      }
    }
    return perks;
  }
}
