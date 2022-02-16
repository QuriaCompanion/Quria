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
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

import '../../models/helpers/profileHelper.model.dart';

ProfileService profile = ProfileService();
AccountService account = AccountService();

class DisplayService {
  static init() async {}

  Future<List<DestinyInventoryItemDefinition>> getExotics() async {
    final items = profile.getAllItems();
    await ManifestService.getManifest<DestinyClassDefinition>(
        "DestinyClassDefinition");
    List<DestinyInventoryItemDefinition> exoticItems =
        await compute(exoticLoop, items);

    return exoticItems;
  }

  Future<ProfileHelper> getProfileData(int index) async {
    try {
      await ManifestService.getManifest<DestinyInventoryItemDefinition>(
          "DestinyInventoryItemDefinition");
      await ManifestService.getManifest<DestinyDamageTypeDefinition>(
          "DestinyDamageTypeDefinition");
      await ManifestService.getManifest<DestinyStatDefinition>(
          "DestinyStatDefinition");
      await ManifestService.getManifest<DestinyClassDefinition>(
          "DestinyClassDefinition");
      await ManifestService.getManifest<DestinySandboxPerkDefinition>(
          "DestinySandboxPerkDefinition");
      await ManifestService.getManifest<DestinyTalentGridDefinition>(
          "DestinyTalentGridDefinition");
      await ManifestService.getManifest<DestinyPresentationNodeDefinition>(
          "DestinyPresentationNodeDefinition");

      return await compute(_parseProfileHelper, index);
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
    await ManifestService.getManifest<DestinyInventoryItemDefinition>(
        "DestinyInventoryItemDefinition");
    await ManifestService.getManifest<DestinyPlugSetDefinition>(
        "DestinyPlugSetDefinition");

    return compute(_getWeapons, "hey");
  }
}

Future<ProfileHelper> _parseProfileHelper(int index) async {
  final characters = profile.getCharacters();
  return ProfileHelper((await account.getMembership())!, characters,
      profile.getCharacterEquipment(characters[index].characterId!));
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
