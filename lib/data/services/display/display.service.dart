import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_class_definition.dart';
import 'package:bungie_api/models/destiny_damage_type_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_plug_set_definition.dart';
import 'package:bungie_api/models/destiny_presentation_node_definition.dart';
import 'package:bungie_api/models/destiny_sandbox_perk_definition.dart';
import 'package:bungie_api/models/destiny_stat_definition.dart';
import 'package:bungie_api/models/destiny_talent_grid_definition.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';

import '../../models/helpers/profileHelper.model.dart';

ProfileService profile = ProfileService();
AccountService account = AccountService();

class DisplayService {
  static init() async {}

  Future<List<DestinyInventoryItemDefinition>> getExotics() async {
    final items = profile.getAllItems();
    // await ManifestService.getManifest<DestinyClassDefinition>(
    //     "DestinyClassDefinition");
    List<DestinyInventoryItemDefinition> exoticItems =
        await compute(exoticLoop, items);

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
        Box box = await StorageService.openBox("manifest");
        await ManifestService.getManifest<DestinyInventoryItemDefinition>(
            "DestinyInventoryItemDefinition", box);
        await ManifestService.getManifest<DestinyDamageTypeDefinition>(
            "DestinyDamageTypeDefinition", box);
        await ManifestService.getManifest<DestinyStatDefinition>(
            "DestinyStatDefinition", box);
        await ManifestService.getManifest<DestinyClassDefinition>(
            "DestinyClassDefinition", box);
        await ManifestService.getManifest<DestinySandboxPerkDefinition>(
            "DestinySandboxPerkDefinition", box);
        await ManifestService.getManifest<DestinyTalentGridDefinition>(
            "DestinyTalentGridDefinition", box);
        await ManifestService.getManifest<DestinyPresentationNodeDefinition>(
            "DestinyPresentationNodeDefinition", box);
        await StorageService.closeBox(box);
      }

      final characters = profile.getCharacters();
      return ProfileHelper((await account.getMembership())!, characters,
          profile.getCharacterEquipment(characters[index].characterId!));
    } catch (e) {
      rethrow;
    }
  }

  List<DestinyInventoryItemDefinition> exoticLoop(
      List<DestinyItemComponent> items) {
    List<DestinyInventoryItemDefinition> exoticItems = [];
    for (DestinyItemComponent element in items) {
      if (ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition![element.itemHash]!
                  .summaryItemHash ==
              715326750 &&
          !exoticItems.contains(ManifestService.manifestParsed
              .destinyInventoryItemDefinition![element.itemHash]) &&
          ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition![element.itemHash]!
                  .classType!
                  .index ==
              2) {
        exoticItems.add(ManifestService
            .manifestParsed.destinyInventoryItemDefinition![element.itemHash]!);
      }
    }
    return exoticItems;
  }

  Future<Iterable<DestinyInventoryItemDefinition>?> collectionLoop() async {
    // await ManifestService.getManifest<DestinyInventoryItemDefinition>(
    //     "DestinyInventoryItemDefinition");
    // await ManifestService.getManifest<DestinyPlugSetDefinition>(
    //     "DestinyPlugSetDefinition");

    return compute(_getWeapons, "hey");
  }
}

Iterable<DestinyInventoryItemDefinition>? _getWeapons(String happy) {
  List<DestinyInventoryItemDefinition>? weapons = ManifestService
      .manifestParsed.destinyInventoryItemDefinition?.values
      .where(((element) => element.itemType == DestinyItemType.Weapon))
      .toList();
  weapons?.sort((a, b) =>
      a.inventory!.tierType!.index.compareTo(b.inventory!.tierType!.index));
  return weapons!.reversed;
}
