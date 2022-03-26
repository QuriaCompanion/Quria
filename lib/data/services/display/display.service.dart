import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_class_definition.dart';
import 'package:bungie_api/models/destiny_collectible_definition.dart';
import 'package:bungie_api/models/destiny_damage_type_definition.dart';
import 'package:bungie_api/models/destiny_energy_type_definition.dart';
import 'package:bungie_api/models/destiny_equipment_slot_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_plug_set_definition.dart';
import 'package:bungie_api/models/destiny_presentation_node_definition.dart';
import 'package:bungie_api/models/destiny_sandbox_perk_definition.dart';
import 'package:bungie_api/models/destiny_stat_definition.dart';
import 'package:bungie_api/models/destiny_talent_grid_definition.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:quria/data/models/AllDestinyManifestComponents.model.dart';
import 'package:quria/data/models/helpers/exoticHelper.model.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';

class DisplayService {
  ProfileService profile = ProfileService();
  AccountService account = AccountService();
  static init() async {}

  Future<List<DestinyInventoryItemDefinition>> getExotics(
      DestinyClass classType) async {
    final items = profile.getAllArmorForClass(classType);
    if (ManifestService.manifestParsed.destinyClassDefinition == null ||
        ManifestService.manifestParsed.destinyInventoryItemDefinition == null) {
      LazyBox box = await StorageService.openBox("manifest");
      await ManifestService.getManifest<DestinyInventoryItemDefinition>(
          "DestinyInventoryItemDefinition", box);
      await ManifestService.getManifest<DestinyClassDefinition>(
          "DestinyClassDefinition", box);
    }
    List<DestinyInventoryItemDefinition> exoticItems = await compute(
        exoticLoop,
        ExoticHelper(
            manifest:
                ManifestService.manifestParsed.destinyInventoryItemDefinition!,
            items: items,
            classType: classType));

    return exoticItems;
  }

  Future<ProfileHelper> getProfileData(int index) async {
    try {
      if (ManifestService.manifestParsed.destinyInventoryItemDefinition ==
              null ||
          ManifestService.manifestParsed.destinyDamageTypeDefinition == null ||
          ManifestService.manifestParsed.destinyStatDefinition == null ||
          ManifestService.manifestParsed.destinyTalentGridDefinition == null ||
          ManifestService.manifestParsed.destinySandboxPerkDefinition == null ||
          ManifestService.manifestParsed.destinyPresentationNodeDefinition ==
              null ||
          ManifestService.manifestParsed.destinyClassDefinition == null) {
        LazyBox box = await StorageService.openBox("manifest");
        await ManifestService.getManifest<DestinyInventoryItemDefinition>(
            "DestinyInventoryItemDefinition", box);
        await ManifestService.getManifest<DestinyDamageTypeDefinition>(
            "DestinyDamageTypeDefinition", box);
        await ManifestService.getManifest<DestinyStatDefinition>(
            "DestinyStatDefinition", box);
        await ManifestService.getManifest<DestinyCollectibleDefinition>(
            "DestinyCollectibleDefinition", box);
        await ManifestService.getManifest<DestinyClassDefinition>(
            "DestinyClassDefinition", box);
        await ManifestService.getManifest<DestinySandboxPerkDefinition>(
            "DestinySandboxPerkDefinition", box);
        await ManifestService.getManifest<DestinyEquipmentSlotDefinition>(
            "DestinyEquipmentSlotDefinition", box);
        await ManifestService.getManifest<DestinyTalentGridDefinition>(
            "DestinyTalentGridDefinition", box);
        await ManifestService.getManifest<DestinyPresentationNodeDefinition>(
            "DestinyPresentationNodeDefinition", box);
        await ManifestService.getManifest<DestinyPlugSetDefinition>(
            "DestinyPlugSetDefinition", box);
        await ManifestService.getManifest<DestinyEnergyTypeDefinition>(
            "DestinyEnergyTypeDefinition", box);
        await ManifestService.getManifest<DestinyPlugSetDefinition>(
            "DestinyPlugSetDefinition", box);
      }

      final characters = profile.getCharacters();
      return ProfileHelper((await account.getMembership())!, characters,
          profile.getCharacterEquipment(characters[index].characterId!));
    } catch (e) {
      rethrow;
    }
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
    return exoticItems;
  }

  Future<Iterable<DestinyInventoryItemDefinition>?> collectionLoop() async {
    if (ManifestService.manifestParsed.destinyInventoryItemDefinition == null ||
        ManifestService.manifestParsed.destinyPlugSetDefinition == null) {
      LazyBox box = await StorageService.openBox("manifest");
      await ManifestService.getManifest<DestinyInventoryItemDefinition>(
          "DestinyInventoryItemDefinition", box);
      await ManifestService.getManifest<DestinyPlugSetDefinition>(
          "DestinyPlugSetDefinition", box);
    }

    return compute(_getWeapons, ManifestService.manifestParsed);
  }

  Iterable<DestinyInventoryItemDefinition>? _getWeapons(
      AllDestinyManifestComponents manifest) {
    List<DestinyInventoryItemDefinition>? weapons = manifest
        .destinyInventoryItemDefinition?.values
        .where(((element) => element.itemType == DestinyItemType.Weapon))
        .toList();
    weapons?.sort((a, b) =>
        a.inventory!.tierType!.index.compareTo(b.inventory!.tierType!.index));
    return weapons!.reversed;
  }
}
