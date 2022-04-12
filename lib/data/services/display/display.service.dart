import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_plug_set_definition.dart';
import 'package:flutter/foundation.dart';
import 'package:quria/data/models/AllDestinyManifestComponents.model.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_class_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/exoticHelper.model.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class DisplayService {
  ProfileService profile = ProfileService();
  AccountService account = AccountService();

  Future<List<DestinyInventoryItemDefinition>> getExotics(
      DestinyClass classType) async {
    final items = profile.getAllArmorForClass(classType);
    if (ManifestService.manifestParsed.destinyClassDefinition == null ||
        ManifestService.manifestParsed.destinyInventoryItemDefinition == null) {
      await ManifestService.getManifest<DestinyInventoryItemDefinition>();
      await ManifestService.getManifest<DestinyClassDefinition>();
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

  Future<bool> getProfileData(int index) async {
    try {
      await profile.loadProfile();
      if (ManifestService.manifestParsed.destinyInventoryItemDefinition ==
          null) {
        await ManifestService.getManifestVersion();
        await ManifestService.loadAllManifest();
      }
      return true;
    } catch (e) {
      rethrow;
    } finally {}
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

  Future<Iterable<DestinyInventoryItemDefinition>?> collectionLoop() async {
    if (ManifestService.manifestParsed.destinyInventoryItemDefinition == null ||
        ManifestService.manifestParsed.destinyPlugSetDefinition == null) {
      await ManifestService.getManifest<DestinyInventoryItemDefinition>();
      await ManifestService.getManifest<DestinyPlugSetDefinition>();
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
