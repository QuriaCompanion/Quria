import 'package:bungie_api/models/destiny_class_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/foundation.dart';
import 'package:quria/data/models/AllDestinyManifestComponents.model.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class DisplayService {
  ProfileService profile = ProfileService();
  ManifestService manifest = ManifestService();
  AccountService account = AccountService();

  static init() async {}

  Future<List<DestinyInventoryItemDefinition>> getExotics() async {
    final items = profile.getAllItems();
    await ManifestService.getManifest<DestinyClassDefinition>();
    List<DestinyInventoryItemDefinition> exoticItems =
        await compute(exoticLoop, items);

    return exoticItems;
  }

  getProfileData() async {
    await ManifestService.getManifest<DestinyInventoryItemDefinition>();
    final characters = profile.getCharacters();
    final Map<String, dynamic> data = {
      'profile': await account.getMembership(),
      'character': characters[0],
      'characterEquipement':
          profile.getCharacterEquipment(characters[0].characterId!)
    };
    return data;
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
