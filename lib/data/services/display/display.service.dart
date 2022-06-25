// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/plug_ui_styles.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_instance_component.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_entry_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_equipment_slot_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/exoticHelper.model.dart';
import 'package:quria/data/models/helpers/itemCardHelper.model.dart';
import 'package:quria/data/models/helpers/itemInfoHelper.model.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/models/helpers/vaultHelper.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/grenade_cooldowns.dart';
import 'package:quria/data/services/bungie_api/enums/melee_cooldowns.enum.dart';
import 'package:quria/data/services/bungie_api/enums/super_coodowns.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';

class DisplayService {
  static bool isManifestUp = false;
  static bool isProfileUp = false;

  static Future<List<DestinyInventoryItemDefinition>> getExotics(
      BuildContext context, DestinyClass classType) async {
    List<DestinyItemComponent> items =
        Provider.of<InventoryProvider>(context, listen: false)
            .getArmorForClass(classType);

    List<DestinyInventoryItemDefinition> exoticItems = await compute(
        exoticLoop,
        ExoticHelper(
            manifest:
                ManifestService.manifestParsed.destinyInventoryItemDefinition,
            items: items,
            classType: classType));
    final List<int> ids = [];
    for (final item in exoticItems) {
      for (DestinyItemSocketEntryDefinition sockets
          in item.sockets!.socketEntries!) {
        if (sockets.singleInitialItemHash != null) {
          ids.add(sockets.singleInitialItemHash!);
        }
      }
      await StorageService.getDefinitions<DestinyInventoryItemDefinition>(ids);
    }

    return exoticItems;
  }

  static VaultHelper getVault(BuildContext context) {
    final characters = Provider.of<CharactersProvider>(context).characters;
    final inventory = Provider.of<InventoryProvider>(context).profileInventory;
    return VaultHelper(characters: characters, vaultItems: inventory);
  }

  static Future<void> manifestLoader() async {
    if (isManifestUp) return;
    await ManifestService.loadAllManifest();
    isManifestUp = true;
    return;
  }

  static Future<void> profileLoader(BuildContext context) async {
    isProfileUp
        ? ProfileService().fetchProfileData(context)
        : await ProfileService().fetchProfileData(context);
    isProfileUp = true;
    return;
  }

  static Future<void> loadManifestAndProfile(BuildContext context) async {
    await manifestLoader();
    await profileLoader(context);
    return;
  }

  static int remainingModPoints(
      int base, Map<int, DestinyItemSocketState> mods) {
    int remaining = base;
    for (final modState in mods.values) {
      DestinyInventoryItemDefinition? mod = ManifestService
          .manifestParsed.destinyInventoryItemDefinition[modState.plugHash];
      // check if the mod has bonus stats
      if (mod != null &&
          mod.investmentStats != null &&
          mod.investmentStats!.isNotEmpty) {
        // loops through the bonus stats
        for (var stat in mod.investmentStats!) {
          // if it has a cost to the armor it reduces the armor mod space
          if (stat.statTypeHash == 3779394102 ||
              stat.statTypeHash == 3344745325 ||
              stat.statTypeHash == 107977982 ||
              stat.statTypeHash == 3950461274 ||
              stat.statTypeHash == 998798867 ||
              stat.statTypeHash == 2399985800 ||
              stat.statTypeHash == 3176563510 ||
              stat.statTypeHash == 3578062600) {
            remaining -= stat.value!;
          }
        }
      }
    }
    return remaining;
  }

  static ProfileHelper getProfileData(BuildContext context) {
    try {
      DestinyCharacterComponent selectedCharacter =
          Provider.of<CharactersProvider>(context).currentCharacter!;
      List<DestinyItemComponent> equipement =
          Provider.of<InventoryProvider>(context)
              .getCharacterEquipment(selectedCharacter.characterId!);
      List<DestinyItemComponent> inventory =
          Provider.of<InventoryProvider>(context)
              .getCharacterInventory(selectedCharacter.characterId!)
              .where((element) => element.bucketHash != 215593132)
              .toList();
      DestinyItemComponent selectedCharacterSubclass =
          Provider.of<InventoryProvider>(context)
              .getCurrentSubClassForCharacter(selectedCharacter.characterId!);
      int? superHash = Provider.of<InventoryProvider>(context)
          .getCurrentSuperHashForCharacter(
              context, selectedCharacter.characterId!);
      String characterSuper = ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition[superHash]
              ?.displayProperties
              ?.icon ??
          ManifestService
              .manifestParsed
              .destinySandboxPerkDefinition[
                  DestinyData.superNodeToSandbox[superHash]]
              ?.displayProperties
              ?.icon ??
          "";
      bool isNewSubclass = ManifestService
              .manifestParsed.destinyInventoryItemDefinition[superHash] !=
          null;
      return ProfileHelper(
          selectedCharacter: selectedCharacter,
          selectedCharacterEquipment: equipement,
          selectedCharacterInventory: inventory,
          selectedCharacterSubclass: selectedCharacterSubclass,
          characterSuper: characterSuper,
          isNewSubclass: isNewSubclass);
    } catch (e) {
      rethrow;
    }
  }

  static ItemInfoHelper getItemInfo(BuildContext context,
      {required String itemInstanceId, required int itemHash}) {
    try {
      DestinyInventoryItemDefinition itemDef = ManifestService
          .manifestParsed.destinyInventoryItemDefinition[itemHash]!;
      Map<String, DestinyStat>? stats = Provider.of<ItemProvider>(context)
          .getPrecalculatedStats(itemInstanceId);
      DestinyItemInstanceComponent instanceInfo =
          Provider.of<ItemProvider>(context).getInstanceInfo(itemInstanceId)!;
      int? powerLevel = instanceInfo.primaryStat?.value;
      String imageLink = DestinyData.bungieLink + itemDef.screenshot!;
      String? elementIcon = ManifestService
              .manifestParsed
              .destinyDamageTypeDefinition[itemDef.defaultDamageTypeHash]
              ?.displayProperties
              ?.icon ??
          ManifestService
              .manifestParsed
              .destinyEnergyTypeDefinition[instanceInfo.energy?.energyTypeHash]
              ?.displayProperties
              ?.icon;
      Map<String, List<DestinyItemPlugBase>>? plugs =
          Provider.of<ItemProvider>(context)
              .getItemReusablePlugs(itemInstanceId);
      List<DestinyItemSocketState> sockets =
          Provider.of<ItemProvider>(context).getItemSockets(itemInstanceId);
      String? afinityIcon = ManifestService
          .manifestParsed
          .destinyEnergyTypeDefinition[instanceInfo.energy?.energyTypeHash]
          ?.displayProperties
          ?.icon;
      return ItemInfoHelper(
          itemDef: itemDef,
          stats: stats,
          powerLevel: powerLevel,
          imageLink: imageLink,
          elementIcon: elementIcon,
          plugs: plugs,
          sockets: sockets,
          afinityIcon: afinityIcon);
    } catch (e) {
      rethrow;
    }
  }

  static ItemCardHelper getCardData(BuildContext context,
      {required String itemInstanceId, required int? itemHash}) {
    final instanceInfo = Provider.of<ItemProvider>(context, listen: false)
        .getInstanceInfo(itemInstanceId);
    final DestinyInventoryItemDefinition itemDef = ManifestService
        .manifestParsed.destinyInventoryItemDefinition[itemHash]!;
    final DestinyEquipmentSlotDefinition itemCategory =
        ManifestService.manifestParsed.destinyEquipmentSlotDefinition[
            itemDef.equippingBlock!.equipmentSlotTypeHash]!;
    final String? elementIcon = ManifestService
            .manifestParsed
            .destinyDamageTypeDefinition[itemDef.defaultDamageTypeHash]
            ?.displayProperties
            ?.icon ??
        ManifestService
            .manifestParsed
            .destinyEnergyTypeDefinition[instanceInfo?.energy?.energyTypeHash]
            ?.displayProperties
            ?.icon;

    final int? powerLevel = instanceInfo?.primaryStat?.value;

    List<DestinyItemSocketState> sockets =
        Provider.of<ItemProvider>(context, listen: false)
            .getItemSockets(itemInstanceId);
    final List<DestinyItemSocketState> perks = sockets
        .where((element) => Conditions.perkSockets(element.plugHash))
        .toList();

    final List<DestinyItemSocketState> armorSockets =
        sockets.where((element) => Conditions.amorSockets(element)).toList();
    final List<DestinyItemSocketState> intristics = sockets
        .where((element) =>
            element.plugHash != null &&
                ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition[element.plugHash]
                        ?.displayProperties
                        ?.icon !=
                    null &&
                DestinyData.modCategoryHash.contains(
                  ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition[element.plugHash]!
                      .plug!
                      .plugCategoryHash,
                ) ||
            (itemDef.itemType == DestinyItemType.Weapon &&
                (ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition[element.plugHash]
                            ?.plug
                            ?.plugStyle ==
                        PlugUiStyles.Masterwork ||
                    ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition[element.plugHash]
                            ?.plug
                            ?.plugCategoryIdentifier
                            ?.contains('masterworks.stat') ==
                        true)))
        .toList();

    return ItemCardHelper(
        itemCategory: itemCategory,
        itemDef: itemDef,
        elementIcon: elementIcon,
        powerLevel: powerLevel,
        perks: perks,
        intristics: intristics,
        armorSockets: armorSockets);
  }

  static DestinyInventoryItemDefinition getPerk(
      DestinyInventoryItemDefinition item) {
    return ManifestService.manifestParsed.destinyInventoryItemDefinition[item
        .sockets!.socketEntries
        ?.firstWhere((element) =>
            ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition[
                            element.singleInitialItemHash]
                        ?.plug
                        ?.plugCategoryHash ==
                    1744546145 &&
                ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition[
                            element.singleInitialItemHash]
                        ?.inventory
                        ?.tierType ==
                    TierType.Exotic ||
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition[
                        element.singleInitialItemHash]
                    ?.hash ==
                3268255645)
        .singleInitialItemHash]!;
  }

  static Future<DestinyInventoryItemDefinition?> getCollectionItem(
      int itemHash) async {
    List<int> ids = [itemHash];
    final item =
        await StorageService.isar.destinyInventoryItemDefinitions.get(itemHash);
    for (final sockets in item!.sockets!.socketEntries!) {
      if (ManifestService
              .manifestParsed
              .destinyPlugSetDefinition[sockets.randomizedPlugSetHash]
              ?.reusablePlugItems ==
          null) continue;
      if (sockets.singleInitialItemHash != null) {
        ids.add(sockets.singleInitialItemHash!);
      }
      for (final plug in ManifestService
          .manifestParsed
          .destinyPlugSetDefinition[sockets.randomizedPlugSetHash]!
          .reusablePlugItems!) {
        if (plug.plugItemHash != null) ids.add(plug.plugItemHash!);
      }
    }
    await StorageService.getDefinitions<DestinyInventoryItemDefinition>(ids);
    return item;
  }

  static Map<String, String> getStatsListing(
      BuildContext context, String characterId, Map<String, int> stats) {
    String formatTime(int time) {
      var minutes = (time ~/ 60);
      var seconds = time % 60;
      if (minutes == 0) return "$seconds sec";
      return "$minutes min $seconds sec";
    }

    int disciplineTier = (stats[StatsStringHash.discipline]! / 10).floor();
    int superTier = (stats[StatsStringHash.intellect]! / 10).floor();
    int strengthTier = (stats[StatsStringHash.strength]! / 10).floor();
    if (disciplineTier > 10) disciplineTier = 10;
    if (superTier > 10) superTier = 10;
    if (strengthTier > 10) strengthTier = 10;

    int? grenadeHash = Provider.of<InventoryProvider>(context, listen: false)
        .getCurrentGrenadeHashForCharacter(context, characterId);

    int grenadeTimer =
        GrenadeCooldown.grenadeMap[grenadeHash]?[disciplineTier] ?? 0;

    int? superHash = Provider.of<InventoryProvider>(context, listen: false)
        .getCurrentSuperHashForCharacter(context, characterId);
    int superTimer = SuperCooldown.superMap[superHash]?[superTier] ?? 0;

    int? meleeHash = Provider.of<InventoryProvider>(context, listen: false)
        .getCurrentMeleeHashForCharacter(context, characterId);
    int meleeTimer = MeleeCooldown.meleeMap[meleeHash]?[strengthTier] ?? 0;

    return {
      StatsStringHash.discipline: formatTime(grenadeTimer),
      StatsStringHash.intellect: formatTime(superTimer),
      StatsStringHash.strength: formatTime(meleeTimer),
    };
  }

  static List<DestinyInventoryItemDefinition> exoticLoop(
      ExoticHelper exoticHelper) {
    List<DestinyInventoryItemDefinition> exoticItems = [];
    for (DestinyItemComponent element in exoticHelper.items) {
      if (exoticHelper.manifest[element.itemHash]?.inventory?.tierType ==
              TierType.Exotic &&
          !exoticItems.contains(exoticHelper.manifest[element.itemHash]) &&
          exoticHelper.manifest[element.itemHash]?.classType ==
              exoticHelper.classType) {
        exoticItems.add(exoticHelper.manifest[element.itemHash]!);
      }
    }
    exoticItems
        .sort((a, b) => a.itemSubType!.index.compareTo(b.itemSubType!.index));
    return exoticItems;
  }

  static Future<Iterable<DestinyInventoryItemDefinition>> getCollectionByType(
      DestinyItemType type) async {
    return await StorageService.isar.destinyInventoryItemDefinitions
        .filter()
        .itemTypeEqualTo(type)
        .sortByDefaultDamageType()
        .findAll();
  }

  static SocketsHelper getSubclassMods(
      BuildContext context, String subclassInstanceId) {
    final sockets = Provider.of<ItemProvider>(context, listen: false)
        .getItemSockets(subclassInstanceId);
    final displayedSockets = sockets
        .map((e) => ManifestService
            .manifestParsed.destinyInventoryItemDefinition[e.plugHash]!)
        .toList();
    final def = ManifestService.manifestParsed.destinyInventoryItemDefinition[
        Provider.of<InventoryProvider>(context, listen: false)
            .getItemByInstanceId(subclassInstanceId)
            ?.itemHash];
    return SocketsHelper(
      sockets: sockets,
      displayedSockets: displayedSockets,
      def: def,
    );
  }
}
