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
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_equipment_slot_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/exoticHelper.model.dart';
import 'package:quria/data/models/helpers/vaultHelper.model.dart';
import 'package:quria/data/models/helpers/itemCardHelper.model.dart';
import 'package:quria/data/models/helpers/itemInfoHelper.model.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/grenade_cooldowns.dart';
import 'package:quria/data/services/bungie_api/enums/melee_cooldowns.enum.dart';
import 'package:quria/data/services/bungie_api/enums/super_coodowns.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';

class DisplayService {
  ProfileService profile = ProfileService();
  AccountService account = AccountService();
  static bool isManifestUp = false;
  static bool isProfileUp = false;
  static int characterIndex = 0;

  Future<List<DestinyInventoryItemDefinition>> getExotics(
      DestinyClass classType) async {
    List<DestinyItemComponent> items = profile.getAllArmorForClass(classType);

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

  Future<VaultHelper> getVault() async {
    await manifestLoader();
    final characters = profile.getCharacters();
    final inventory = profile.getProfileInventory();
    return VaultHelper(characters: characters, vaultItems: inventory);
  }

  static Future<bool> manifestLoader() async {
    if (isManifestUp) return true;
    await ManifestService.loadAllManifest();
    return true;
  }

  static Future<bool> profileLoader() async {
    if (isProfileUp) return true;
    await ProfileService().loadProfile();
    return true;
  }

  static Future<bool> loadManifestAndProfile() async {
    await manifestLoader();
    await profileLoader();
    return true;
  }

  int remainingModPoints(int base, Map<int, DestinyItemSocketState> mods) {
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

  ProfileHelper getProfileData() {
    try {
      List<DestinyCharacterComponent> characters = profile.getCharacters();
      DestinyCharacterComponent selectedCharacter = characters[characterIndex];
      List<DestinyItemComponent> equipement =
          profile.getCharacterEquipment(selectedCharacter.characterId!);
      List<DestinyItemComponent> inventory = profile
          .getCharacterInventory(selectedCharacter.characterId!)
          .where((element) => element.bucketHash != 215593132)
          .toList();
      DestinyItemComponent selectedCharacterSubclass = profile
          .getCurrentSubClassForCharacter(selectedCharacter.characterId!);
      int? superHash = profile
          .getCurrentSuperHashForCharacter(selectedCharacter.characterId!);
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
          characters: characters,
          selectedCharacter: selectedCharacter,
          selectedCharacterEquipment: equipement,
          selectedCharacterInventory: inventory,
          selectedCharacterSubclass: selectedCharacterSubclass,
          characterSuper: characterSuper,
          selectedCharacterIndex: characterIndex,
          isNewSubclass: isNewSubclass);
    } catch (e) {
      rethrow;
    } finally {}
  }

  ItemInfoHelper getItemInfo(String itemInstanceId, int itemHash) {
    DestinyInventoryItemDefinition itemDef = ManifestService
        .manifestParsed.destinyInventoryItemDefinition[itemHash]!;
    Map<String, DestinyStat>? stats =
        profile.getPrecalculatedStats(itemInstanceId);
    DestinyItemInstanceComponent instanceInfo =
        profile.getInstanceInfo(itemInstanceId);
    int powerLevel = instanceInfo.primaryStat!.value!;
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
        profile.getItemReusablePlugs(itemInstanceId);
    List<DestinyItemSocketState> sockets =
        profile.getItemSockets(itemInstanceId);
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
  }

  ItemCardHelper getCardData(String itemInstanceId, int? itemHash) {
    final instanceInfo = ProfileService().getInstanceInfo(itemInstanceId);
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
            .destinyEnergyTypeDefinition[instanceInfo.energy?.energyTypeHash]
            ?.displayProperties
            ?.icon;

    final int powerLevel = instanceInfo.primaryStat!.value!;

    List<DestinyItemSocketState> sockets =
        profile.getItemSockets(itemInstanceId);
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
        elementIcon: elementIcon ?? "",
        powerLevel: powerLevel,
        perks: perks,
        intristics: intristics,
        armorSockets: armorSockets);
  }

  DestinyInventoryItemDefinition getPerk(DestinyInventoryItemDefinition item) {
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

  Future<DestinyInventoryItemDefinition?> getCollectionItem(
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

  Map<String, String> getStatsListing(
      String characterId, Map<String, int> stats) {
    String formatTime(int time) {
      var minutes = (time ~/ 60);
      var seconds = time % 60;
      if (minutes == 0) return "$seconds sec";
      return "$minutes min $seconds sec";
    }

    int disciplineTier = (stats[StatsStringHash.discipline]! / 10).floor();
    int superTier = (stats[StatsStringHash.intellect]! / 10).floor();
    int strengthTier = (stats[StatsStringHash.strength]! / 10).floor();

    int? grenadeHash = profile.getCurrentGrenadeHashForCharacter(characterId);
    int? grenadeTimer =
        GrenadeCooldown.grenadeMap[grenadeHash]?[disciplineTier];

    int? superHash = profile.getCurrentSuperHashForCharacter(characterId);
    int? superTimer = SuperCooldown.superMap[superHash]?[superTier];

    int? meleeHash = profile.getCurrentMeleeHashForCharacter(characterId);
    int? meleeTimer = MeleeCooldown.meleeMap[meleeHash]?[strengthTier];

    return {
      StatsStringHash.discipline: formatTime(grenadeTimer!),
      StatsStringHash.intellect: formatTime(superTimer!),
      StatsStringHash.strength: formatTime(meleeTimer!),
    };
  }

  List<DestinyInventoryItemDefinition> exoticLoop(ExoticHelper exoticHelper) {
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

  Future<Iterable<DestinyInventoryItemDefinition>> getCollectionByType(
      DestinyItemType type) async {
    return await StorageService.isar.destinyInventoryItemDefinitions
        .filter()
        .itemTypeEqualTo(type)
        .sortByDefaultDamageType()
        .findAll();
  }

  SocketsHelper getSubclassMods(String subclassInstanceId) {
    final sockets = profile.getItemSockets(subclassInstanceId);
    final displayedSockets = sockets
        .map((e) => ManifestService
            .manifestParsed.destinyInventoryItemDefinition[e.plugHash]!)
        .toList();
    final def = ManifestService.manifestParsed.destinyInventoryItemDefinition[
        ProfileService().getItemByInstanceId(subclassInstanceId)?.itemHash];
    return SocketsHelper(
      sockets: sockets,
      displayedSockets: displayedSockets,
      def: def,
    );
  }
}
