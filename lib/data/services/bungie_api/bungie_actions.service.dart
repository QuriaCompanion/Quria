import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class BungieActionsService {
  final api = BungieApiService();
  final profile = ProfileService();
  static final BungieActionsService _singleton =
      BungieActionsService._internal();
  factory BungieActionsService() {
    return _singleton;
  }
  BungieActionsService._internal();

  Future<void> transferItem(String itemId, String? characterId,
      {int? itemHash, int? stackSize}) async {
    try {
      final owner = profile.getItemOwner(itemId);
      if (owner == characterId || characterId == null) {
        await api
            .transferItem(itemId, owner,
                itemHash: itemHash,
                stackSize: stackSize,
                transferToVault: characterId == null)
            .then((value) => profile.moveItem(itemId, characterId, false));
      } else {
        await api
            .transferItem(itemId, owner,
                itemHash: itemHash, stackSize: stackSize, transferToVault: true)
            .then((value) => profile.moveItem(itemId, null, false));
        await api
            .transferItem(itemId, characterId,
                itemHash: itemHash,
                stackSize: stackSize,
                transferToVault: false)
            .then((value) => profile.moveItem(itemId, characterId, false));
      }
    } catch (e) {
      try {
        if (characterId == null) rethrow;
        int slotTypeHash = ManifestService
            .manifestParsed
            .destinyInventoryItemDefinition[itemHash]!
            .equippingBlock!
            .equipmentSlotTypeHash!;
        List<DestinyItemComponent> slotItems =
            (profile.getItemsForCharacter(characterId, slotTypeHash))
                .toSet()
                .toList();
        if (slotItems.length <= 9) {
          await api
              .transferItem(slotItems.first.itemInstanceId!, characterId,
                  itemHash: slotItems.first.itemHash,
                  stackSize: 1,
                  transferToVault: true)
              .then((value) => profile.moveItem(itemId, null, false));
          await api
              .transferItem(itemId, characterId,
                  itemHash: itemHash,
                  stackSize: stackSize,
                  transferToVault: false)
              .then((value) => profile.moveItem(itemId, characterId, false));
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> equipItem({
    required String itemId,
    required String characterId,
    required int itemHash,
  }) async {
    try {
      await api.equipItem(itemId, characterId).then(
          (value) => profile.moveItem(itemId, characterId, true),
          onError: (_) => null);
    } catch (e) {
      try {
        await transferItem(
          itemId,
          characterId,
          itemHash: itemHash,
          stackSize: 1,
        ).then((value) => profile.moveItem(itemId, characterId, false),
            onError: (_) => null);
        await api.equipItem(itemId, characterId).then(
            (value) => profile.moveItem(itemId, characterId, true),
            onError: (_) => null);
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> equipBuild({
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
    characterInventory.addAll(profile.getCharacterEquipment(characterId));
    characterInventory.addAll(profile.getCharacterInventory(characterId));
    // transfer all items to character
    for (int i = 0; i < build.equipement.length; i++) {
      itemsIds.add(build.equipement[i].itemInstanceId);
      socketsHashes.add(
          (profile.getItemSockets(build.equipement[i].itemInstanceId))
              .map((e) => e.plugHash)
              .toList());
      if (!characterInventory
          .map((e) => e.itemInstanceId)
          .contains(build.equipement[i].itemInstanceId)) {
        await transferItem(
          build.equipement[i].itemInstanceId,
          characterId,
          itemHash: build.equipement[i].hash,
          stackSize: 1,
        );
      }
    }
    if (subclassId != null) {
      itemsIds.add(subclassId);
      if (subclassMods.isNotEmpty) {
        subclassSocketsHashes.addAll((profile.getItemSockets(subclassId))
            .map((e) => e.plugHash)
            .toList());
      }
    }
    // equip all items
    await api.equipItems(itemsIds, characterId).then((value) {
      for (final id in itemsIds) {
        profile.moveItem(id, characterId, false);
      }
    }, onError: (_) => null);

    // remove all mods
    // TODO: what if armor has 5 slots?
    for (int i = 0; i < 5; i++) {
      for (int index = 0; index < 4; index++) {
        try {
          int hash = ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition[build.equipement[i].hash]!
              .sockets!
              .socketEntries![index]
              .singleInitialItemHash!;
          if (socketsHashes[i][index] != hash &&
              socketsHashes[i][index] != mods[i].items[index]!.hash) {
            await api.insertSocketPlugFree(
                build.equipement[i].itemInstanceId, hash, index, characterId);
          }
        } catch (e) {
          continue;
        }
      }
    }
    for (int subclassIndex = 0;
        subclassIndex < subclassMods.length;
        subclassIndex++) {
      try {
        if (subclassMods[subclassIndex].hash !=
            subclassSocketsHashes[subclassIndex]) {
          await api.insertSocketPlugFree(subclassId!,
              subclassMods[subclassIndex].hash!, subclassIndex, characterId);
        }
      } catch (e) {
        continue;
      }
    }

    // add new mods
    for (int i = 0; i < 5; i++) {
      try {
        if (socketsHashes[i][0] != build.equipement[i].mods!.hash!) {
          api.insertSocketPlugFree(build.equipement[i].itemInstanceId[i],
              build.equipement[i].mods!.hash!, 0, characterId);
        }
      } catch (e) {
        continue;
      }
      for (int index = 1; index < 5; index++) {
        try {
          if (socketsHashes[i][index] != mods[i].items[index]!.hash!) {
            api.insertSocketPlugFree(build.equipement[i].itemInstanceId[i],
                mods[i].items[index]!.hash!, index, characterId);
          }
        } catch (e) {
          continue;
        }
      }
    }
  }
}
