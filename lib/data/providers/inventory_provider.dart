import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_inventory_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:bungie_api/models/destiny_talent_node.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/providers/helpers.dart/inspect_helper.dart';
import 'package:quria/data/models/providers/inventory.model.dart';
import 'package:quria/data/models/providers/inventory_filters.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:collection/collection.dart';

class FilterNotifier extends StateNotifier<InventoryFiltersModel> {
  FilterNotifier() : super(InventoryFiltersModel());
  void reset() {
    state = InventoryFiltersModel();
  }

  void changeFilter<T>(T item, bool value) {
    switch (T) {
      case TierType:
        state.rarity[item as TierType] = value;
        if (value) {
          state.rarityFilters.add(item);
          state.rarityFilters.toSet();
        } else {
          state.rarityFilters.remove(item);
        }
        break;
      case DamageType:
        state.element[item as DamageType] = value;
        if (value) {
          state.elementFilters.add(item);
          state.elementFilters.toSet();
        } else {
          state.elementFilters.remove(item);
        }
        break;
      case DestinyItemSubType:
        state.type[item as DestinyItemSubType] = value;
        if (value) {
          state.typeFilters.add(item);
          state.typeFilters.toSet();
        } else {
          state.typeFilters.remove(item);
        }
        break;
      default:
        break;
    }
  }
}

final filtersProvider = StateNotifierProvider<FilterNotifier, InventoryFiltersModel>((ref) => FilterNotifier());

class InventoryNotifier extends StateNotifier<InventoryModel> {
  InventoryNotifier() : super(InventoryModel());

  void reset() {
    state.characterEquipment.clear();
    state.characterInventory.clear();
    state.profileInventory.clear();
  }

  void setProfileInventory(List<DestinyItemComponent> profileInventory) {
    state.profileInventory.replaceRange(0, state.profileInventory.length, profileInventory);
  }

  void setCharacterInventories(Map<String, DestinyInventoryComponent> characterInventory) {
    state.characterInventory.clear();
    state.characterInventory.addAll(characterInventory);
  }

  void setCharacterEquipment(Map<String, DestinyInventoryComponent> characterEquipement) {
    state.characterEquipment.clear();
    state.characterEquipment.addAll(characterEquipement);
  }

  void pullFromPostmaster(DestinyItemComponent item, String characterId) {
    state.characterInventory[characterId]!.items!.remove(item);
    state.characterInventory[characterId]!.items!.add(item
      ..bucketHash =
          ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.inventory?.bucketTypeHash);
  }

  void moveItem(WidgetRef ref,
      {required String instanceId,
      String? newLocation,
      bool equip = false,
      String? previousLocation,
      bool notify = true}) {
    DestinyItemComponent? itemComponent = ref.watch(itemByInstanceIdProvider(instanceId));
    if (itemComponent == null) return;
    final previousItem = state.characterEquipment[newLocation]?.items?.firstWhere((element) =>
        ManifestService
            .manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.equippingBlock?.equipmentSlotTypeHash ==
        ManifestService.manifestParsed.destinyInventoryItemDefinition[itemComponent.itemHash]?.equippingBlock
            ?.equipmentSlotTypeHash);
    final previousIndex = state.characterEquipment[newLocation]?.items?.indexWhere((element) =>
        ManifestService
            .manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.equippingBlock?.equipmentSlotTypeHash ==
        ManifestService.manifestParsed.destinyInventoryItemDefinition[itemComponent.itemHash]?.equippingBlock
            ?.equipmentSlotTypeHash);

    if (previousLocation == null) {
      state.profileInventory.remove(itemComponent);
    } else if (equip) {
      state.characterInventory[previousLocation]!.items!.remove(itemComponent);
      state.characterEquipment[previousLocation]!.items!.remove(previousItem);
    } else {
      state.characterInventory[previousLocation]!.items!.remove(itemComponent);
    }
    if (newLocation == null) {
      state.profileInventory.add(itemComponent);
    } else if (equip) {
      state.characterInventory[newLocation]!.items!.add(previousItem!);
      state.characterEquipment[newLocation]!.items!.insert(previousIndex!, itemComponent);
    } else {
      state.characterInventory[newLocation]!.items!.add(itemComponent);
    }
  }
}

final inventoryProvider = StateNotifierProvider<InventoryNotifier, InventoryModel>((ref) => InventoryNotifier());

final fullInventoryProvider = StateProvider<List<DestinyItemComponent>>((ref) {
  final inventory = ref.watch(inventoryProvider);
  final List<DestinyItemComponent> items = [];
  items.addAll(inventory.profileInventory);
  inventory.characterEquipment.forEach((_, value) {
    items.addAll(value.items ?? []);
  });
  inventory.characterInventory.forEach((_, value) {
    items.addAll(value.items ?? []);
  });
  return items;
});
final vaultInventoryProvider = StateProvider<List<DestinyItemComponent>>((ref) {
  return ref.watch(inventoryProvider.select((value) => value.profileInventory));
});

final characterInventoryProvider = StateProviderFamily<List<DestinyItemComponent>, String?>((ref, String? characterId) {
  return ref.watch(inventoryProvider.select((state) => state.characterInventory[characterId]?.items ?? []));
});

final characterEquipmentProvider = StateProviderFamily<List<DestinyItemComponent>, String?>((ref, String? characterId) {
  return ref.watch(inventoryProvider.select((state) => state.characterEquipment[characterId]?.items ?? []));
});

final vaultDisplayedInventoryProvider =
    StateProviderFamily<List<DestinyItemComponent>, String?>((ref, String? characterId) {
  final List<DestinyItemComponent> inventory = [];
  inventory.addAll(ref.watch(vaultInventoryProvider));
  final characters = ref.watch(charactersProvider);
  if (characters.length > 2) {
    for (final character in characters.getRange(1, characters.length - 1)) {
      inventory.addAll(ref.watch(characterInventoryProvider(character.characterId)));
      inventory.addAll(ref.watch(characterEquipmentProvider(character.characterId)));
    }
  }

  inventory.sort((a, b) {
    final aPowerLevel = ref.watch(itemPowerLevelProvider(a.itemInstanceId));
    final bPowerLevel = ref.watch(itemPowerLevelProvider(b.itemInstanceId));
    if (aPowerLevel == null || bPowerLevel == null) return 1;

    return aPowerLevel.compareTo(bPowerLevel);
  });

  return inventory;
});
final vaultMobileFilteredInventory = StateProvider<List<DestinyItemComponent>>((ref) {
  final characterId = ref.watch(charactersProvider.select((value) => value.first.characterId));
  final filters = ref.watch(filtersProvider);
  return ref.watch(vaultDisplayedInventoryProvider(characterId)).where((value) {
    final item = ManifestService.manifestParsed.destinyInventoryItemDefinition[value.itemHash];
    final rarities = filters.rarityFilters;
    final types = filters.typeFilters;
    final elements = filters.elementFilters;
    if (rarities.isNotEmpty && !rarities.contains(item?.inventory?.tierType)) {
      return false;
    }
    if (types.isNotEmpty && !types.contains(item?.itemSubType)) {
      return false;
    }
    if (elements.isNotEmpty && !elements.contains(item?.damageTypes?[0])) {
      return false;
    }
    return true;
  }).toList();
});

final profileInventoryProvider = StateProviderFamily<List<DestinyItemComponent>, String?>((ref, String? characterId) {
  return ref.watch(inventoryProvider.select((state) => state.profileInventory));
});

final itemByInstanceIdProvider = StateProviderFamily<DestinyItemComponent?, String?>((ref, String? instanceId) {
  final items = ref.watch(fullInventoryProvider);
  return items.firstWhereOrNull((element) => element.itemInstanceId == instanceId);
});

final characterEquipmentByBucketProvider =
    StateProviderFamily<DestinyItemComponent?, ByCharacterAndBucket>((ref, ByCharacterAndBucket helper) {
  return ref
      .watch(characterEquipmentProvider(helper.characterId))
      .firstWhereOrNull((element) => element.bucketHash == helper.bucketHash);
});

final itemsByInstancesIdsProvider =
    StateProviderFamily<List<DestinyItemComponent>, List<String>>((ref, List<String?> ids) {
  final items = ref.watch(fullInventoryProvider);
  ids = ids.where((id) => id != null).toList();
  List<DestinyItemComponent> results = [];
  results.addAll(items.where((item) => ids.contains(item.itemInstanceId)));
  return items.where((item) => ids.contains(item.itemInstanceId)).toList();
});

final characterInventoryByBucketProvider =
    StateProviderFamily<List<DestinyItemComponent>, ByCharacterAndBucket>((ref, ByCharacterAndBucket helper) {
  final inventory = ref.watch(characterInventoryProvider(helper.characterId));
  return inventory.where((element) => element.bucketHash == helper.bucketHash).toList();
});

final currentSubclassProvider = StateProviderFamily<DestinyItemComponent?, String?>((ref, String? characterId) {
  if (characterId == null) return null;
  return ref.watch(characterEquipmentByBucketProvider(
      ByCharacterAndBucket(characterId: characterId, bucketHash: InventoryBucket.subclass)));
});

final itemsBySlotTypeForCurrentClassProvider =
    StateProviderFamily<List<DestinyItemComponent>, int?>((ref, int? slotTypeHash) {
  DestinyClass classType = ref.watch(charactersProvider).first.classType!;
  final items = ref
      .watch(fullInventoryProvider)
      .where(
        (item) =>
            ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.equippingBlock
                    ?.equipmentSlotTypeHash ==
                slotTypeHash &&
            (!InventoryBucket.armorBucketHashes.contains(ManifestService.manifestParsed
                    .destinyInventoryItemDefinition[item.itemHash]?.equippingBlock?.equipmentSlotTypeHash) ||
                ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.classType == classType) &&
            (!(InventoryBucket.subclass ==
                    ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.equippingBlock
                        ?.equipmentSlotTypeHash) ||
                ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.classType == classType) &&
            item.bucketHash != 215593132,
      )
      .toList();

  items.sort((a, b) {
    final aPowerLevel = ref.watch(itemPowerLevelProvider(a.itemInstanceId));
    final bPowerLevel = ref.watch(itemPowerLevelProvider(b.itemInstanceId));
    if (aPowerLevel == null || bPowerLevel == null) return 1;

    return aPowerLevel.compareTo(bPowerLevel);
  });
  return items;
});

final currentGrenadeByCharacterProvider = StateProviderFamily<int?, String?>((ref, String? characterId) {
  DestinyItemComponent? subclass = ref.watch(currentSubclassProvider(characterId));
  if (subclass == null) return null;
  List<DestinyItemSocketState> sockets = ref.watch(itemSocketsProvider(subclass.itemInstanceId));
  DestinyItemSocketState? newGrenade = sockets.firstWhereOrNull((element) =>
      ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier
          ?.contains("grenade") ??
      false);
  if (newGrenade != null) {
    return ManifestService.manifestParsed.destinyInventoryItemDefinition[newGrenade.plugHash]?.hash;
  }
  DestinyItemTalentGridComponent? oldSubclass = ref.watch(itemTalentGridProvider(subclass.itemInstanceId));

  DestinyTalentNode? oldGrenade = oldSubclass?.nodes?.firstWhereOrNull((element) =>
      element.isActivated == true && element.nodeIndex == 7 || element.nodeIndex == 8 || element.nodeIndex == 9);
  if (oldGrenade != null) {
    return ManifestService.manifestParsed.destinyTalentGridDefinition[oldSubclass!.talentGridHash]!
        .nodes?[oldGrenade.nodeIndex!].steps?[0].nodeStepHash;
  }
  return null;
});
final currentMeleeByCharacterProvider = StateProviderFamily<int?, String?>((ref, String? characterId) {
  DestinyItemComponent? subclass = ref.watch(currentSubclassProvider(characterId));
  if (subclass == null) return null;
  List<DestinyItemSocketState> sockets = ref.watch(itemSocketsProvider(subclass.itemInstanceId));
  DestinyItemSocketState? newMelee = sockets.firstWhereOrNull((element) =>
      ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier
          ?.contains("melee") ??
      false);
  if (newMelee != null) {
    return ManifestService.manifestParsed.destinyInventoryItemDefinition[newMelee.plugHash]?.hash;
  }
  DestinyItemTalentGridComponent? oldSubclass = ref.watch(itemTalentGridProvider(subclass.itemInstanceId));

  DestinyTalentNode? oldMelee = oldSubclass?.nodes?.firstWhereOrNull((element) =>
      element.isActivated == true && element.nodeIndex == 11 || element.nodeIndex == 15 || element.nodeIndex == 21);
  if (oldMelee != null) {
    return ManifestService.manifestParsed.destinyTalentGridDefinition[oldSubclass!.talentGridHash]!
        .nodes?[oldMelee.nodeIndex!].steps?[0].nodeStepHash;
  }
  return null;
});

final currentSuperByCharacterProvider = StateProviderFamily<int?, String?>((ref, String? characterId) {
  DestinyItemComponent? subclass = ref.watch(currentSubclassProvider(characterId));
  if (subclass == null) return null;
  List<DestinyItemSocketState> sockets = ref.watch(itemSocketsProvider(subclass.itemInstanceId));
  DestinyItemSocketState? newSuper = sockets.firstWhereOrNull((element) =>
      ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier
          ?.contains("super") ??
      false);
  if (newSuper != null) {
    return ManifestService.manifestParsed.destinyInventoryItemDefinition[newSuper.plugHash]?.hash;
  }
  DestinyItemTalentGridComponent? oldSubclass = ref.watch(itemTalentGridProvider(subclass.itemInstanceId));

  DestinyTalentNode? oldSuper = oldSubclass?.nodes?.firstWhereOrNull(
      (element) => element.isActivated == true && element.nodeIndex == 10 || element.nodeIndex == 20);
  if (oldSuper != null) {
    return ManifestService.manifestParsed.destinyTalentGridDefinition[oldSubclass!.talentGridHash]!
        .nodes?[oldSuper.nodeIndex!].steps?[0].nodeStepHash;
  }
  return null;
});
final itemOwnerProvider = StateProviderFamily<String?, String?>((ref, String? itemInstanceId) {
  for (final character in ref.watch(inventoryProvider.select((value) => value.characterEquipment.entries))) {
    bool has = character.value.items!.any((item) => item.itemInstanceId == itemInstanceId);
    if (has) {
      return character.key;
    }
  }
  for (final character in ref.watch(inventoryProvider.select((value) => value.characterInventory.entries))) {
    bool has = character.value.items!.any((item) => item.itemInstanceId == itemInstanceId);
    if (has) {
      return character.key;
    }
  }

  return null;
});

final isItemEquippedProvider = StateProviderFamily<bool?, String?>((ref, String? itemInstanceId) {
  for (final character in ref.watch(inventoryProvider.select((value) => value.characterEquipment.entries))) {
    bool has = character.value.items!.any((item) => item.itemInstanceId == itemInstanceId);
    if (has) {
      return true;
    }
  }
  return false;
});

final getAllSpecimensProvider =
    StateProviderFamily<List<DestinyItemComponent>, DestinyItemComponent?>((ref, DestinyItemComponent? item) {
  if (item == null) return [];
  return ref.watch(fullInventoryProvider).where((element) => element.itemHash == item.itemHash).toList()..remove(item);
});

final getArmorForClassProvider =
    StateProviderFamily<List<DestinyItemComponent>, ArmorForGivenClass>((ref, ArmorForGivenClass helper) {
  if (helper.classType == null) return [];
  return ref.watch(fullInventoryProvider).where((item) {
    return ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.classType ==
            helper.classType &&
        ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.itemType ==
            DestinyItemType.Armor &&
        (helper.itemSubType == null ||
            ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.itemSubType ==
                helper.itemSubType) &&
        (helper.includeSunset ||
            !sunsetItems.any((element) =>
                element ==
                ManifestService
                    .manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.quality?.versions?[0].powerCapHash));
  }).toList();
});

final cosmeticSocketsProvider =
    StateProviderFamily<List<DestinyItemSocketState>, DestinyItemComponent?>((ref, DestinyItemComponent? item) {
  if (item == null) return [];
  return ref
      .watch(itemSocketsProvider(item.itemInstanceId))
      .where((element) => Conditions.cosmeticSockets(element.plugHash))
      .toList();
});
