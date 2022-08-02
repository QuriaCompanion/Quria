import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_inventory_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:bungie_api/models/destiny_talent_node.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:collection/collection.dart';

class InventoryProvider with ChangeNotifier {
  List<DestinyItemComponent> _profileInventory = [];
  Map<String, DestinyInventoryComponent> _characterInventory = {};
  Map<String, DestinyInventoryComponent> _characterEquipment = {};

  List<DestinyItemComponent> get profileInventory => _profileInventory;
  Map<String, DestinyInventoryComponent> get characterInventory => _characterInventory;
  Map<String, DestinyInventoryComponent> get characterEquipement => _characterEquipment;

  List<DestinyItemComponent> getCharacterInventory(String characterId) {
    return _characterInventory[characterId]?.items ?? [];
  }

  List<DestinyItemComponent> getCharacterEquipment(String characterId) {
    return _characterEquipment[characterId]?.items ?? [];
  }

  List<DestinyItemComponent> getCharacterInventoryByBucket(String characterId, int slotTypeHash) {
    return _characterInventory[characterId]
            ?.items
            ?.where(
              (item) =>
                  ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.equippingBlock
                          ?.equipmentSlotTypeHash ==
                      slotTypeHash &&
                  item.bucketHash != 215593132,
            )
            .toList() ??
        [];
  }

  List<DestinyItemComponent> getItemsForBuildCreation(BuildContext context, {required int slotTypeHash}) {
    DestinyClass classType = Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.classType!;
    final List<DestinyItemComponent> inventory = [];
    inventory.addAll(
      _profileInventory.where(
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
      ),
    );
    _characterEquipment.forEach((id, equipment) {
      if (equipment.items != null) {
        inventory.addAll(
          equipment.items!.where(
            (item) =>
                ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.equippingBlock
                        ?.equipmentSlotTypeHash ==
                    slotTypeHash &&
                (!InventoryBucket.armorBucketHashes.contains(ManifestService.manifestParsed
                        .destinyInventoryItemDefinition[item.itemHash]?.equippingBlock?.equipmentSlotTypeHash) ||
                    ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.classType ==
                        classType) &&
                (!(InventoryBucket.subclass ==
                        ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.equippingBlock
                            ?.equipmentSlotTypeHash) ||
                    ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.classType ==
                        classType) &&
                item.bucketHash != 215593132,
          ),
        );
      }
    });
    _characterInventory.forEach((id, equipment) {
      if (equipment.items != null) {
        inventory.addAll(
          equipment.items!.where(
            (item) =>
                ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.equippingBlock
                        ?.equipmentSlotTypeHash ==
                    slotTypeHash &&
                (!InventoryBucket.armorBucketHashes.contains(ManifestService.manifestParsed
                        .destinyInventoryItemDefinition[item.itemHash]?.equippingBlock?.equipmentSlotTypeHash) ||
                    ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.classType ==
                        classType) &&
                (!(InventoryBucket.subclass ==
                        ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.equippingBlock
                            ?.equipmentSlotTypeHash) ||
                    ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.classType ==
                        classType) &&
                item.bucketHash != 215593132,
          ),
        );
      }
    });
    inventory.sort((a, b) {
      if (Provider.of<ItemProvider>(context, listen: false).getItemPowerLevel(a.itemInstanceId) == null ||
          Provider.of<ItemProvider>(context, listen: false).getItemPowerLevel(a.itemInstanceId) == null) {
        return 1;
      }
      return Provider.of<ItemProvider>(context, listen: false)
          .getItemPowerLevel(b.itemInstanceId)!
          .compareTo(Provider.of<ItemProvider>(context, listen: false).getItemPowerLevel(a.itemInstanceId)!);
    });
    return inventory;
  }

  List<DestinyItemComponent> getVaultInventoryForCharacterByBucket(
      BuildContext context, String? characterId, int slotTypeHash) {
    final List<DestinyItemComponent> inventory = [];
    inventory.addAll(
      _profileInventory.where(
        (item) =>
            ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.equippingBlock
                    ?.equipmentSlotTypeHash ==
                slotTypeHash &&
            item.bucketHash != 215593132,
      ),
    );
    _characterEquipment.forEach((id, equipment) {
      if (id != characterId && equipment.items != null) {
        inventory.addAll(
          equipment.items!.where(
            (item) =>
                ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.equippingBlock
                        ?.equipmentSlotTypeHash ==
                    slotTypeHash &&
                item.bucketHash != 215593132,
          ),
        );
      }
    });
    _characterInventory.forEach((id, equipment) {
      if (id != characterId && equipment.items != null) {
        inventory.addAll(
          equipment.items!.where(
            (item) =>
                ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.equippingBlock
                        ?.equipmentSlotTypeHash ==
                    slotTypeHash &&
                item.bucketHash != 215593132,
          ),
        );
      }
    });
    inventory.sort((a, b) {
      if (Provider.of<ItemProvider>(context, listen: false).getItemPowerLevel(a.itemInstanceId) == null ||
          Provider.of<ItemProvider>(context, listen: false).getItemPowerLevel(b.itemInstanceId) == null) {
        return 1;
      }
      return Provider.of<ItemProvider>(context, listen: false)
          .getItemPowerLevel(b.itemInstanceId)!
          .compareTo(Provider.of<ItemProvider>(context, listen: false).getItemPowerLevel(a.itemInstanceId)!);
    });

    return inventory;
  }

  DestinyItemComponent getCharacterEquipmentByBucket(String characterId, int bucket) {
    return _characterEquipment[characterId]!.items!.firstWhere((item) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.inventory?.bucketTypeHash ==
        bucket);
  }

  List<DestinyItemComponent> getItemsByInstanceId(List<String?> ids) {
    ids = ids.where((id) => id != null).toList();
    List<DestinyItemComponent> items = [];
    items.addAll(_profileInventory.where((item) => ids.contains(item.itemInstanceId)));
    _characterEquipment.forEach((id, equipment) {
      if (equipment.items != null) {
        items.addAll(equipment.items!.where((item) => ids.contains(item.itemInstanceId)));
      }
    });
    _characterInventory.forEach((id, equipment) {
      if (equipment.items != null) {
        items.addAll(equipment.items!.where((item) => ids.contains(item.itemInstanceId)));
      }
    });
    return items;
  }

  DestinyItemComponent? getItemByInstanceId(String instanceId) {
    List<DestinyItemComponent> items = getItemsByInstanceId([instanceId]);
    if (items.isEmpty) return null;
    return items[0];
  }

  List<DestinyItemComponent> getSubclassesForCharacter(String characterId) {
    final List<DestinyItemComponent> inventory = [];
    inventory.addAll(getCharacterInventory(characterId));
    inventory.addAll(getCharacterEquipment(characterId));
    return inventory
        .where((element) =>
            ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.equippingBlock
                ?.equipmentSlotTypeHash ==
            3284755031)
        .toSet()
        .toList();
  }

  List<DestinyItemComponent> getItemsForCharacter(String characterId, int slotTypeHash) {
    List<DestinyItemComponent> character = _characterInventory[characterId]?.items ?? [];
    return character
        .where((element) =>
            ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.equippingBlock
                ?.equipmentSlotTypeHash ==
            slotTypeHash)
        .toSet()
        .toList();
  }

  DestinyItemComponent getCurrentSubClassForCharacter(String characterId) {
    List<DestinyItemComponent> character = _characterEquipment[characterId]?.items ?? [];
    return character.firstWhere((element) =>
        ManifestService
            .manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.equippingBlock?.equipmentSlotTypeHash ==
        3284755031);
  }

  int? getCurrentGrenadeHashForCharacter(BuildContext context, String characterId) {
    DestinyItemComponent subclass = getCurrentSubClassForCharacter(characterId);
    List<DestinyItemSocketState> sockets =
        Provider.of<ItemProvider>(context, listen: false).getItemSockets(subclass.itemInstanceId!);
    DestinyItemSocketState? newGrenade = sockets.firstWhereOrNull((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier
            ?.contains("grenade") ??
        false);
    if (newGrenade != null) {
      return ManifestService.manifestParsed.destinyInventoryItemDefinition[newGrenade.plugHash]?.hash;
    }
    DestinyItemTalentGridComponent? oldSubclass =
        Provider.of<ItemProvider>(context, listen: false).getTalentGrid(subclass.itemInstanceId!);

    DestinyTalentNode? oldGrenade = oldSubclass?.nodes?.firstWhereOrNull((element) =>
        element.isActivated == true && element.nodeIndex == 7 || element.nodeIndex == 8 || element.nodeIndex == 9);
    if (oldGrenade != null) {
      return ManifestService.manifestParsed.destinyTalentGridDefinition[oldSubclass!.talentGridHash]!
          .nodes?[oldGrenade.nodeIndex!].steps?[0].nodeStepHash;
    }
    return null;
  }

  int? getCurrentMeleeHashForCharacter(BuildContext context, String characterId) {
    DestinyItemComponent? subclass = getCurrentSubClassForCharacter(characterId);
    List<DestinyItemSocketState>? sockets =
        Provider.of<ItemProvider>(context, listen: false).getItemSockets(subclass.itemInstanceId!);
    DestinyItemSocketState? newMelee = sockets.firstWhereOrNull((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier
            ?.contains("melee") ??
        false);
    if (newMelee != null) {
      return ManifestService.manifestParsed.destinyInventoryItemDefinition[newMelee.plugHash]?.hash;
    }
    DestinyItemTalentGridComponent? oldSubclass =
        Provider.of<ItemProvider>(context, listen: false).getTalentGrid(subclass.itemInstanceId!);

    DestinyTalentNode? oldMelee = oldSubclass?.nodes?.firstWhereOrNull((element) =>
        element.isActivated == true && element.nodeIndex == 11 || element.nodeIndex == 15 || element.nodeIndex == 21);
    if (oldMelee != null) {
      return ManifestService.manifestParsed.destinyTalentGridDefinition[oldSubclass!.talentGridHash]!
          .nodes?[oldMelee.nodeIndex!].steps?[0].nodeStepHash;
    }
    return null;
  }

  int? getSuperHashForSubclass(BuildContext context, DestinyItemComponent subclass) {
    List<DestinyItemSocketState>? sockets =
        Provider.of<ItemProvider>(context, listen: false).getItemSockets(subclass.itemInstanceId!);
    DestinyItemSocketState? newSuper = sockets.firstWhereOrNull((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier
            ?.contains("super") ??
        false);

    if (newSuper != null) {
      return ManifestService.manifestParsed.destinyInventoryItemDefinition[newSuper.plugHash]?.hash;
    }
    DestinyItemTalentGridComponent? oldSubclass =
        Provider.of<ItemProvider>(context, listen: false).getTalentGrid(subclass.itemInstanceId!);

    DestinyTalentNode? oldSuper = oldSubclass?.nodes?.firstWhereOrNull(
        (element) => element.isActivated == true && element.nodeIndex == 10 || element.nodeIndex == 20);
    if (oldSuper != null) {
      return ManifestService.manifestParsed.destinyTalentGridDefinition[oldSubclass!.talentGridHash]!
          .nodes?[oldSuper.nodeIndex!].steps?[0].nodeStepHash;
    }
    return null;
  }

  int? getCurrentSuperHashForCharacter(BuildContext context, String characterId) {
    DestinyItemComponent? subclass = getCurrentSubClassForCharacter(characterId);
    return getSuperHashForSubclass(context, subclass);
  }

  String? getItemOwner(String itemInstanceId) {
    String? owner;
    _characterEquipment.forEach((charId, inventory) {
      bool has = inventory.items!.any((item) => item.itemInstanceId == itemInstanceId);
      if (has) {
        owner = charId;
      }
    });
    if (owner != null) return owner;
    _characterInventory.forEach((charId, inventory) {
      bool has = inventory.items!.any((item) => item.itemInstanceId == itemInstanceId);
      if (has) {
        owner = charId;
      }
    });
    return owner;
  }

  bool isItemEquipped(String itemInstanceId) {
    String? owner = getItemOwner(itemInstanceId);
    if (owner == null) return false;
    return _characterEquipment[owner]!.items!.any((item) => item.itemInstanceId == itemInstanceId);
  }

  List<DestinyItemComponent> getAllItems() {
    List<DestinyItemComponent> allItems = [];
    for (Iterable<DestinyItemComponent> characterEquipment
        in _characterEquipment.values.map((character) => character.items ?? [])) {
      allItems.addAll(characterEquipment);
    }
    for (Iterable<DestinyItemComponent> characterInventory
        in _characterInventory.values.map((character) => character.items ?? [])) {
      allItems.addAll(characterInventory);
    }
    allItems.addAll(_profileInventory.map((item) => item));
    return allItems;
  }

  List<DestinyItemComponent> getAllSpecimens(DestinyItemComponent item) {
    return getAllItems().where((element) => element.itemHash == item.itemHash).toList()..remove(item);
  }

  List<DestinyItemComponent> getArmorForClass(DestinyClass classType,
      {DestinyItemSubType? itemSubType, bool includeSunset = true}) {
    List<DestinyItemComponent> allItems = getAllItems();
    final List<DestinyItemComponent> neededItem = allItems.where((item) {
      return ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.classType == classType &&
          ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.itemType ==
              DestinyItemType.Armor &&
          (itemSubType == null ||
              ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.itemSubType ==
                  itemSubType) &&
          (includeSunset ||
              !sunsetItems.any((element) =>
                  element ==
                  ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.quality?.versions?[0]
                      .powerCapHash));
    }).toList();

    return neededItem;
  }

  List<DestinyItemComponent> getPostmasterItemsForCharacter(String characterId) {
    if (_characterInventory[characterId] == null) return [];

    return _characterInventory[characterId]!
        .items!
        .where((element) => element.bucketHash == InventoryBucket.lostItems)
        .toList();
  }

  void reset() {
    _characterEquipment.clear();
    _characterInventory.clear();
    _profileInventory.clear();
  }

  void setProfileInventory(List<DestinyItemComponent> profileInventory) {
    _profileInventory = profileInventory;
    notifyListeners();
  }

  void setCharacterInventories(Map<String, DestinyInventoryComponent> characterInventory) {
    _characterInventory = characterInventory;
    notifyListeners();
  }

  void setCharacterEquipment(Map<String, DestinyInventoryComponent> characterEquipement) {
    _characterEquipment = characterEquipement;
    notifyListeners();
  }

  void pullFromPostmaster(DestinyItemComponent item, String characterId) {
    _characterInventory[characterId]!.items!.remove(item);
    _characterInventory[characterId]!.items!.add(item
      ..bucketHash =
          ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.inventory?.bucketTypeHash);
    notifyListeners();
  }

  void moveItem(String instanceId, String? newLocation, bool equip) {
    DestinyItemComponent? itemComponent = getItemByInstanceId(instanceId);
    if (itemComponent == null) return;
    final previousItem = _characterEquipment[newLocation]?.items?.firstWhere((element) =>
        ManifestService
            .manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.equippingBlock?.equipmentSlotTypeHash ==
        ManifestService.manifestParsed.destinyInventoryItemDefinition[itemComponent.itemHash]?.equippingBlock
            ?.equipmentSlotTypeHash);
    final previousIndex = _characterEquipment[newLocation]?.items?.indexWhere((element) =>
        ManifestService
            .manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.equippingBlock?.equipmentSlotTypeHash ==
        ManifestService.manifestParsed.destinyInventoryItemDefinition[itemComponent.itemHash]?.equippingBlock
            ?.equipmentSlotTypeHash);

    String? previousLocation = getItemOwner(instanceId);
    if (previousLocation == null) {
      _profileInventory.remove(itemComponent);
    } else if (equip) {
      _characterInventory[previousLocation]!.items!.remove(itemComponent);
      _characterEquipment[previousLocation]!.items!.remove(previousItem);
    } else {
      _characterInventory[previousLocation]!.items!.remove(itemComponent);
    }
    if (newLocation == null) {
      _profileInventory.add(itemComponent);
    } else if (equip) {
      _characterInventory[newLocation]!.items!.add(previousItem!);
      _characterEquipment[newLocation]!.items!.insert(previousIndex!, itemComponent);
    } else {
      _characterInventory[newLocation]!.items!.add(itemComponent);
    }
    notifyListeners();
  }
}
