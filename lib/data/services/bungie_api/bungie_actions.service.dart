// ignore_for_file: use_build_context_synchronously

import 'package:bungie_api/enums/tier_type.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:quria/data/models/providers/helpers.dart/inspect_helper.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
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

  Future<void> transferItem(
    WidgetRef ref,
    String itemId,
    String? characterId, {
    int? itemHash,
    int? stackSize,
  }) async {
    try {
      final owner = ref.watch(itemOwnerProvider(itemId));
      final item = ref.watch(itemByInstanceIdProvider(itemId));
      if (owner == characterId || owner == null || characterId == null) {
        await api
            .transferItem(itemId, characterId ?? owner,
                itemHash: itemHash, stackSize: stackSize, transferToVault: characterId == null)
            .then(
              (value) => ref.read(inventoryProvider.notifier).moveItem(
                    itemComponent: item,
                    newLocation: characterId,
                    previousLocation: owner,
                  ),
            );
      } else {
        await api
            .transferItem(itemId, owner, itemHash: itemHash, stackSize: stackSize, transferToVault: true)
            .then((value) async {
          ref.read(inventoryProvider.notifier).moveItem(itemComponent: item, previousLocation: owner);
          await api
              .transferItem(item!.itemInstanceId!, characterId,
                  itemHash: itemHash, stackSize: stackSize, transferToVault: false)
              .then((value) => ref.read(inventoryProvider.notifier).moveItem(
                    itemComponent: item,
                    newLocation: characterId,
                  ));
        });
      }
    } catch (e) {
      try {
        if (characterId == null) rethrow;
        final item = ref.watch(itemByInstanceIdProvider(itemId));

        int slotTypeHash = ManifestService
            .manifestParsed.destinyInventoryItemDefinition[itemHash]!.equippingBlock!.equipmentSlotTypeHash!;
        List<DestinyItemComponent> slotItems = (ref.read(
          characterInventoryByBucketProvider(
            ByCharacterAndBucket(bucketHash: slotTypeHash, characterId: characterId),
          ),
        )).toSet().toList();
        if (slotItems.length <= 9) {
          await api
              .transferItem(slotItems.first.itemInstanceId!, characterId,
                  itemHash: slotItems.first.itemHash, stackSize: 1, transferToVault: true)
              .then((value) async {
            ref.read(inventoryProvider.notifier).moveItem(
                  itemComponent: slotItems.first,
                  previousLocation: characterId,
                );
            await api
                .transferItem(itemId, characterId, itemHash: itemHash, stackSize: stackSize, transferToVault: false)
                .then((value) => ref.read(inventoryProvider.notifier).moveItem(
                      itemComponent: item,
                      newLocation: characterId,
                    ));
          });
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> equipItem(
    WidgetRef ref, {
    required String itemId,
    required String characterId,
    required int itemHash,
  }) async {
    final owner = ref.watch(itemOwnerProvider(itemId));
    final item = ref.watch(itemByInstanceIdProvider(itemId));

    try {
      if (owner == characterId) {
        await api.equipItem(itemId, characterId).then(
              (value) => ref.read(inventoryProvider.notifier).moveItem(
                    itemComponent: item,
                    newLocation: characterId,
                    previousLocation: owner,
                  ),
            );
      } else {
        await transferItem(ref, itemId, characterId, itemHash: itemHash, stackSize: 1);
        await api.equipItem(itemId, characterId).then((value) => ref.read(inventoryProvider.notifier).moveItem(
              itemComponent: item,
              newLocation: characterId,
            ));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> equipStoredBuild(
    WidgetRef ref, {
    required List<Item> items,
  }) async {
    List<String> itemsIds = [];
    List<List<int?>> socketsHashes = [];
    List<DestinyItemComponent> characterInventory = [];
    String characterId = ref.watch(charactersProvider).first.characterId!;

    characterInventory.addAll(ref.read(characterInventoryProvider(characterId)));
    characterInventory.addAll(ref.read(characterEquipmentProvider(characterId)));

    // transfer all items to character
    for (int i = 0; i < items.length; i++) {
      itemsIds.add(items[i].instanceId);
      if (!characterInventory.map((e) => e.itemInstanceId).contains(items[i].instanceId)) {
        await transferItem(
          ref,
          items[i].instanceId,
          characterId,
          itemHash: items[i].itemHash,
          stackSize: 1,
        );
      }
    }
    // equip all items
    await api.equipItems(itemsIds, characterId).then((value) {
      for (final id in itemsIds) {
        ref.read(inventoryProvider.notifier).moveItem(
            itemComponent: ref.read(itemByInstanceIdProvider(id)),
            newLocation: characterId,
            previousLocation: ref.read(itemOwnerProvider(id)));
      }
    }, onError: (_) => null);
    final exoticInstanceId = items
        .firstWhereOrNull((element) =>
            ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.inventory?.tierType ==
            TierType.Exotic)
        ?.instanceId;
    if (exoticInstanceId != null) {
      await api.equipItem(exoticInstanceId, characterId).then((value) {
        for (final id in itemsIds) {
          ref.read(inventoryProvider.notifier).moveItem(
              itemComponent: ref.read(itemByInstanceIdProvider(id)),
              newLocation: characterId,
              previousLocation: ref.read(itemOwnerProvider(id)));
        }
      }, onError: (_) => null);
    }

    // get armors from build
    final List<Item> armors =
        items.where((element) => InventoryBucket.armorBucketHashes.contains(element.bucketHash)).toList();
    // remove all mods
    // TODO: what if armor has 5 slots?
    for (int i = 0; i < armors.length; i++) {
      for (int index = 0; index < 4; index++) {
        socketsHashes.add(ref.read(itemSocketsProvider(items[i].instanceId)).map((e) => e.plugHash).toList());
        try {
          int hash = ManifestService.manifestParsed.destinyInventoryItemDefinition[items[i].itemHash]!.sockets!
              .socketEntries![index].singleInitialItemHash!;
          if (socketsHashes[i][index] != hash || socketsHashes[i][index] != armors[i].mods[index]) {
            await api.insertSocketPlugFree(armors[i].instanceId, hash, index, characterId);
          }
        } catch (e) {
          continue;
        }
      }
      for (int index = 0; index < 4; index++) {
        try {
          if (socketsHashes[i][index] != armors[i].mods[index]) {
            await api.insertSocketPlugFree(armors[i].instanceId, armors[i].mods[index], index, characterId);
          }
        } catch (e) {
          continue;
        }
      }
    }
    final subclass = items.firstWhereOrNull((element) => InventoryBucket.subclass == element.bucketHash);
    if (subclass != null) {
      for (int i = 0; i < subclass.mods.length; i++) {
        try {
          await api.insertSocketPlugFree(subclass.instanceId, subclass.mods[i], i, characterId);
        } catch (e) {
          continue;
        }
      }
    }
  }
}
