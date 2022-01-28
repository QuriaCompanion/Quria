import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/foundation.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

Map<int, DestinyInventoryItemDefinition> _manifestData = {};

class DisplayService {
  ProfileService profile = ProfileService();
  ManifestService manifest = ManifestService();
  AccountService account = AccountService();

  static init() async {}

  getExotics() async {
    print("lets start");
    final items = profile.getAllItems();
    if (_manifestData.isEmpty) {
      print("manifest is empty");
      _manifestData =
          await manifest.getManifest<DestinyInventoryItemDefinition>();

      print("manifest is loaded");
    }
    final exoticItems = compute(exoticLoop, items);

    return exoticItems;
  }

  getProfileData() async {
    if (_manifestData.isEmpty) {
      _manifestData =
          await manifest.getManifest<DestinyInventoryItemDefinition>();
    }
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

exoticLoop(items) {
  final exoticItems = [];
  for (var element in items) {
    if (_manifestData[element.itemHash]!.summaryItemHash == 715326750 &&
        !exoticItems.contains(_manifestData[element.itemHash]) &&
        _manifestData[element.itemHash]!.classType!.index == 2) {
      exoticItems.add(_manifestData[element.itemHash]);
    }
  }
  return exoticItems;
}
