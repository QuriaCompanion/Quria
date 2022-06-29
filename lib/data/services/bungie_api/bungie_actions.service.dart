import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class BungieActionsService {
  final api = BungieApiService();
  final profile = ProfileService();
  static final BungieActionsService _singleton = BungieActionsService._internal();
  factory BungieActionsService() {
    return _singleton;
  }
  BungieActionsService._internal();

  Future<void> transferItem(BuildContext context, String itemId, String? characterId,
      {int? itemHash, int? stackSize}) async {
    try {
      final owner = Provider.of<InventoryProvider>(context, listen: false).getItemOwner(itemId);
      if (owner == characterId || owner == null || characterId == null) {
        await api
            .transferItem(itemId, characterId ?? owner,
                itemHash: itemHash, stackSize: stackSize, transferToVault: characterId == null)
            .then(
                (value) => Provider.of<InventoryProvider>(context, listen: false).moveItem(itemId, characterId, false));
      } else {
        await api
            .transferItem(itemId, owner, itemHash: itemHash, stackSize: stackSize, transferToVault: true)
            .then((value) => Provider.of<InventoryProvider>(context, listen: false).moveItem(itemId, null, false));
        await api
            .transferItem(itemId, characterId, itemHash: itemHash, stackSize: stackSize, transferToVault: false)
            .then(
                (value) => Provider.of<InventoryProvider>(context, listen: false).moveItem(itemId, characterId, false));
      }
    } catch (e) {
      try {
        if (characterId == null) rethrow;
        int slotTypeHash = ManifestService
            .manifestParsed.destinyInventoryItemDefinition[itemHash]!.equippingBlock!.equipmentSlotTypeHash!;
        List<DestinyItemComponent> slotItems =
            (Provider.of<InventoryProvider>(context, listen: false).getItemsForCharacter(characterId, slotTypeHash))
                .toSet()
                .toList();
        if (slotItems.length <= 9) {
          await api
              .transferItem(slotItems.first.itemInstanceId!, characterId,
                  itemHash: slotItems.first.itemHash, stackSize: 1, transferToVault: true)
              .then((value) => Provider.of<InventoryProvider>(context, listen: false).moveItem(itemId, null, false));
          await api
              .transferItem(itemId, characterId, itemHash: itemHash, stackSize: stackSize, transferToVault: false)
              .then((value) =>
                  Provider.of<InventoryProvider>(context, listen: false).moveItem(itemId, characterId, false));
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> equipItem(
    BuildContext context, {
    required String itemId,
    required String characterId,
    required int itemHash,
  }) async {
    try {
      final owner = Provider.of<InventoryProvider>(context, listen: false).getItemOwner(itemId);
      if (owner == characterId) {
        await api.equipItem(itemId, characterId).then(
            (value) => Provider.of<InventoryProvider>(context, listen: false).moveItem(itemId, characterId, true));
      } else {
        await transferItem(context, itemId, characterId, itemHash: itemHash, stackSize: 1);
        await api.equipItem(itemId, characterId).then(
            (value) => Provider.of<InventoryProvider>(context, listen: false).moveItem(itemId, characterId, true));
      }
    } catch (e) {
      try {
        await transferItem(
          context,
          itemId,
          characterId,
          itemHash: itemHash,
          stackSize: 1,
        ).then((value) => Provider.of<InventoryProvider>(context, listen: false).moveItem(itemId, characterId, false));
        await api.equipItem(itemId, characterId).then(
            (value) => Provider.of<InventoryProvider>(context, listen: false).moveItem(itemId, characterId, true));
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> equipBuild(
    BuildContext context, {
    required Build build,
    required String characterId,
    required List<ModSlots> mods,
    required List<DestinyInventoryItemDefinition> subclassMods,
    String? subclassId,
  }) async {
    List<String> itemsIds = [];
    List<List<int?>> socketsHashes = [];
    List<int?> subclassSocketsHashes = [];
    List<DestinyItemComponent> characterInventory = [];
    characterInventory
        .addAll(Provider.of<InventoryProvider>(context, listen: false).getCharacterEquipment(characterId));
    characterInventory
        .addAll(Provider.of<InventoryProvider>(context, listen: false).getCharacterInventory(characterId));

    if (subclassId != null) {
      itemsIds.add(subclassId);
      if (subclassMods.isNotEmpty) {
        subclassSocketsHashes.addAll((Provider.of<ItemProvider>(context, listen: false).getItemSockets(subclassId))
            .map((e) => e.plugHash)
            .toList());
      }
    }
    // transfer all items to character
    for (int i = 0; i < build.equipement.length; i++) {
      itemsIds.add(build.equipement[i].itemInstanceId);
      socketsHashes.add(
          (Provider.of<ItemProvider>(context, listen: false).getItemSockets(build.equipement[i].itemInstanceId))
              .map((e) => e.plugHash)
              .toList());
      if (!characterInventory.map((e) => e.itemInstanceId).contains(build.equipement[i].itemInstanceId)) {
        await transferItem(
          context,
          build.equipement[i].itemInstanceId,
          characterId,
          itemHash: build.equipement[i].hash,
          stackSize: 1,
        );
      }
    }
    // equip all items
    await api.equipItems(itemsIds, characterId).then((value) {
      for (final id in itemsIds) {
        Provider.of<InventoryProvider>(context, listen: false).moveItem(id, characterId, false);
      }
    }, onError: (_) => null);

    // remove all mods
    // TODO: what if armor has 5 slots?
    for (int i = 0; i < 5; i++) {
      for (int index = 0; index < 4; index++) {
        try {
          int hash = ManifestService.manifestParsed.destinyInventoryItemDefinition[build.equipement[i].hash]!.sockets!
              .socketEntries![index].singleInitialItemHash!;
          if (socketsHashes[i][index] != hash && socketsHashes[i][index] != mods[i].items[index]?.hash) {
            await api.insertSocketPlugFree(build.equipement[i].itemInstanceId, hash, index, characterId);
          }
        } catch (e) {
          continue;
        }
      }
    }
    for (int subclassIndex = 0; subclassIndex < subclassMods.length; subclassIndex++) {
      try {
        if (subclassMods[subclassIndex].hash != subclassSocketsHashes[subclassIndex]) {
          await api.insertSocketPlugFree(subclassId!, subclassMods[subclassIndex].hash!, subclassIndex, characterId);
        }
      } catch (e) {
        continue;
      }
    }

    // add new mods
    for (int i = 0; i < 5; i++) {
      try {
        if (socketsHashes[i][0] != build.equipement[i].mods!.hash!) {
          api.insertSocketPlugFree(
              build.equipement[i].itemInstanceId[i], build.equipement[i].mods!.hash!, 0, characterId);
        }
      } catch (e) {
        continue;
      }
      for (int index = 1; index < 5; index++) {
        try {
          if (socketsHashes[i][index] != mods[i].items[index]?.hash) {
            api.insertSocketPlugFree(
                build.equipement[i].itemInstanceId[i], mods[i].items[index]!.hash!, index, characterId);
          }
        } catch (e) {
          continue;
        }
      }
    }
  }
}
