import 'dart:convert';

import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_investment_stat_definition.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/models/Preset.model.dart';
import 'package:quria/data/models/StatWeighing.enum.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/foundation.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/providers/builder/builder_custom_info_provider.dart';
import 'package:quria/data/providers/builder/builder_exotic_provider.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_stats_filter_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:http/http.dart' as http;
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/var/keys.dart';
import 'package:quria/presentation/var/routes.dart';
import 'package:universal_io/io.dart';

class BuilderService {
  final String _backendURl = 'https://quria-companion-back-end.herokuapp.com/';
  BuilderHelper buildPreparation(BuildContext context) {
    DestinyCharacterComponent character = Provider.of<CharactersProvider>(context, listen: false).currentCharacter!;
    bool includeSunset = Provider.of<BuilderCustomInfoProvider>(context, listen: false).includeSunset;

    List<DestinyItemComponent> armors = Provider.of<InventoryProvider>(context, listen: false)
        .getArmorForClass(character.classType as DestinyClass, includeSunset: includeSunset);

    List<DestinyInventoryItemDefinition> subclassMods =
        Provider.of<BuilderSubclassModsProvider>(context, listen: false).subclassMods;

    List<ModSlots> armorMods = Provider.of<BuilderModsProvider>(context, listen: false).mods;

    List<int> statOrder =
        Provider.of<BuilderStatsFilterProvider>(context, listen: false).filters.map((e) => e.value).toList();

    StatWeighing statWeighing = Provider.of<BuilderStatsFilterProvider>(context, listen: false).statWeighing;

    bool considerMasterwork = Provider.of<BuilderCustomInfoProvider>(context, listen: false).considerMasterwork;

    DestinyInventoryItemDefinition? exotic = Provider.of<BuilderExoticProvider>(context, listen: false).exotic;

    DestinyItemComponent classItem = Provider.of<BuilderCustomInfoProvider>(context, listen: false).classItem!;

    Map<String, DestinyItemSocketsComponent> sockets = Provider.of<ItemProvider>(context, listen: false).sockets;

    return BuilderHelper(
      statOrder: statOrder,
      armors: armors,
      sockets: sockets,
      manifest: ManifestService.manifestParsed.destinyInventoryItemDefinition,
      subclassMods: subclassMods,
      armorMods: armorMods,
      classItem: classItem,
      statWeighing: statWeighing,
      considerMasterwork: considerMasterwork,
      exotic: exotic,
    );
  }

  Future<void> createBuild(BuildContext context, String name, {Preset? preset}) async {
    final build = Provider.of<CreateBuildProvider>(context, listen: false).items;

    await http.post(Uri.parse("${_backendURl}build"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "name": name,
          "bungieName": AccountService.currentMembership?.membershipId,
          "items": build.map((e) => e.toJson()).toList(),
          "usedTimes": 0,
          "className": Provider.of<CharactersProvider>(context, listen: false).currentCharacter?.classType?.value,
          "preset": preset != null ? preset.toJson() : calculatePreset(context, data: build).toJson(),
        }));
    return;
  }

  void useForeignBuild(BuildContext context, BuildStored foreignBuild) async {
    List<DestinyCharacterComponent> characters = Provider.of<CharactersProvider>(context, listen: false).characters;
    int? characterIndex;
    for (int index = 0; index < characters.length; index++) {
      if (characters[index].classType == foreignBuild.className) {
        characterIndex = index;
        Provider.of<CharactersProvider>(context, listen: false).setCurrentCharacter(index);
      }
    }
    if (characterIndex != null) {
      Provider.of<CharactersProvider>(context, listen: false).setCurrentCharacter(characterIndex);
    } else {
      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
        content: textBodyMedium(
          AppLocalizations.of(context)!.build_character_not_available,
          utf8: false,
          color: Colors.white,
        ),
        backgroundColor: crucible,
      ));
      return;
    }

    await DisplayService.getExotics(context, characters[characterIndex].classType!).then((exotics) {
      final exoticItem = foreignBuild.items.firstWhereOrNull((element) {
        return InventoryBucket.armorBucketHashes.contains(element.bucketHash) &&
            ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.inventory?.tierType ==
                TierType.Exotic;
      });

      if (!exotics.map((e) => e.hash).contains(exoticItem?.itemHash)) {
        ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
          content: textBodyMedium(
            AppLocalizations.of(context)!.build_no_exotic,
            utf8: false,
            color: Colors.white,
          ),
          backgroundColor: crucible,
        ));
        return;
      }

      Provider.of<BuilderExoticProvider>(context, listen: false).setExoticHash(
          ManifestService.manifestParsed.destinyInventoryItemDefinition[foreignBuild.preset!.exoticHash]);
      final List<ModSlots> armorMods = [
        // helmet
        ModSlots(
            title: AppLocalizations.of(context)!.helmet,
            elementSocketEntries:
                ManifestService.manifestParsed.destinyInventoryItemDefinition[3473581026]!.sockets!.socketEntries!,
            items: [
              null,
              for (int index = 0; index < foreignBuild.preset!.armorMods["helmet"]!.length; index++)
                ManifestService
                    .manifestParsed.destinyInventoryItemDefinition[foreignBuild.preset!.armorMods["helmet"]?[index]],
            ]),
        // gauntlets
        ModSlots(
            title: AppLocalizations.of(context)!.gauntlets,
            elementSocketEntries:
                ManifestService.manifestParsed.destinyInventoryItemDefinition[2771648715]!.sockets!.socketEntries!,
            items: [
              null,
              for (int index = 0; index < foreignBuild.preset!.armorMods["gauntlets"]!.length; index++)
                ManifestService
                    .manifestParsed.destinyInventoryItemDefinition[foreignBuild.preset!.armorMods["gauntlets"]?[index]],
            ]),
        // chest
        ModSlots(
            title: AppLocalizations.of(context)!.chest,
            elementSocketEntries:
                ManifestService.manifestParsed.destinyInventoryItemDefinition[549825413]!.sockets!.socketEntries!,
            items: [
              null,
              for (int index = 0; index < foreignBuild.preset!.armorMods["chest"]!.length; index++)
                ManifestService
                    .manifestParsed.destinyInventoryItemDefinition[foreignBuild.preset!.armorMods["chest"]?[index]],
            ]),
        // legs
        ModSlots(
            title: AppLocalizations.of(context)!.legs,
            elementSocketEntries:
                ManifestService.manifestParsed.destinyInventoryItemDefinition[4287863773]!.sockets!.socketEntries!,
            items: [
              null,
              for (int index = 0; index < foreignBuild.preset!.armorMods["leg"]!.length; index++)
                ManifestService
                    .manifestParsed.destinyInventoryItemDefinition[foreignBuild.preset!.armorMods["leg"]?[index]],
            ]),
        // class items
        ModSlots(
            title: AppLocalizations.of(context)!.class_item,
            elementSocketEntries:
                ManifestService.manifestParsed.destinyInventoryItemDefinition[3500810712]!.sockets!.socketEntries!,
            items: [
              null,
              for (int index = 0; index < foreignBuild.preset!.armorMods["classItem"]!.length; index++)
                ManifestService
                    .manifestParsed.destinyInventoryItemDefinition[foreignBuild.preset!.armorMods["classItem"]?[index]],
            ]),
      ];
      Provider.of<BuilderModsProvider>(context, listen: false).setMods(armorMods);
      final filters = [
        for (int value in foreignBuild.preset!.statOrder)
          FilterHelper(name: fromIntToName(context, value), icon: fromIntToIcon(value), value: value),
      ];
      Provider.of<BuilderStatsFilterProvider>(context, listen: false).setNewStatsFilters(filters);
      Provider.of<BuilderSubclassProvider>(context, listen: false).setSubclass(
        foreignBuild.items.firstWhereOrNull((element) => element.bucketHash == InventoryBucket.subclass)?.instanceId,
        ManifestService.manifestParsed.destinyInventoryItemDefinition[foreignBuild.preset!.subclassHash],
      );
      Provider.of<BuilderSubclassModsProvider>(context, listen: false).setSubclassMods(
        foreignBuild.preset!.subclassMods
            .map((e) => ManifestService.manifestParsed.destinyInventoryItemDefinition[e]!)
            .toList(),
      );
      Navigator.pushNamed(context, routeClassItemChoice);
    });
  }

  Map<String, int> statCalculator(BuildContext context, {required DestinyItemComponent item}) {
    // instanciate stats
    Map<String, int> investmentStats = {
      StatsStringHash.mobility: 0,
      StatsStringHash.resilience: 0,
      StatsStringHash.recovery: 0,
      StatsStringHash.discipline: 0,
      StatsStringHash.intellect: 0,
      StatsStringHash.strength: 0,
    };
    if (item.state == ItemState.Masterwork || item.state == const ItemState(5)) {
      investmentStats = {
        StatsStringHash.mobility: 2,
        StatsStringHash.resilience: 2,
        StatsStringHash.recovery: 2,
        StatsStringHash.discipline: 2,
        StatsStringHash.intellect: 2,
        StatsStringHash.strength: 2,
      };
    }
    // get sockets for the item
    List<DestinyItemSocketState>? sockets =
        Provider.of<ItemProvider>(context, listen: false).getItemSockets(item.itemInstanceId);
    // get only the sockets that actually contain stats
    Iterable<DestinyItemSocketState> plugs = sockets.where(((element) => element.isVisible == false));
    // get the inventory def for given sockets
    if (plugs.isEmpty) return investmentStats;
    Iterable<DestinyInventoryItemDefinition?> plm =
        plugs.map((e) => ManifestService.manifestParsed.destinyInventoryItemDefinition[e.plugHash]);
    // foreach inventory def, get the stats and adds the to investmentStats
    for (DestinyInventoryItemDefinition? entry in plm) {
      if (entry?.investmentStats != null) {
        for (DestinyItemInvestmentStatDefinition newStats in entry!.investmentStats!) {
          investmentStats[newStats.statTypeHash!.toString()] =
              investmentStats[newStats.statTypeHash!.toString()]! + newStats.value!;
        }
      }
    }
    return investmentStats;
  }

  Map<String, int> buildStatCalculator(BuildContext context, {required List<Item> items}) {
    Map<String, int> stats = {
      StatsStringHash.mobility: 0,
      StatsStringHash.resilience: 0,
      StatsStringHash.recovery: 0,
      StatsStringHash.discipline: 0,
      StatsStringHash.intellect: 0,
      StatsStringHash.strength: 0,
    };
    for (Item item in items.where((element) => InventoryBucket.armorBucketHashes.contains(element.bucketHash))) {
      final itemComponent = Provider.of<InventoryProvider>(context, listen: false).getItemByInstanceId(item.instanceId);

      // loops through the mods in this armor
      for (int? modHash in item.mods) {
        final mod = ManifestService.manifestParsed.destinyInventoryItemDefinition[modHash];
        // check if the mod has bonus stats
        if (mod != null && mod.investmentStats != null && mod.investmentStats!.isNotEmpty) {
          // loops through the bonus stats
          for (var stat in mod.investmentStats!) {
            // if it gives a bonus to stat it adds it to the correct stat
            if (stat.statTypeHash == StatsHash.mobility ||
                stat.statTypeHash == StatsHash.resilience ||
                stat.statTypeHash == StatsHash.recovery ||
                stat.statTypeHash == StatsHash.discipline ||
                stat.statTypeHash == StatsHash.intellect ||
                stat.statTypeHash == StatsHash.strength) {
              stats[stat.statTypeHash!.toString()] = stats[stat.statTypeHash.toString()]! + stat.value!;
            }
          }
        }
      }
      if (itemComponent == null) continue;
      for (final newStats in statCalculator(context, item: itemComponent).entries) {
        stats[newStats.key] = stats[newStats.key]! + newStats.value;
      }
    }

    return stats;
  }

  List<Item> changeBuildToListOfItems(BuildContext context, {required Build data}) {
    List<Item> items = [];
    for (int i = 0; i < data.equipement.length; i++) {
      List<int> mods = [];
      mods.add(data.equipement[i].mod!.hash!);
      mods.addAll(Provider.of<BuilderModsProvider>(context, listen: false)
          .mods[i]
          .items
          .where((element) => element?.hash != null)
          .map((item) => item!.hash!));

      items.add(
        Item(
            instanceId: data.equipement[i].itemInstanceId,
            itemHash: data.equipement[i].hash,
            isEquipped: true,
            bucketHash: ManifestService
                .manifestParsed.destinyInventoryItemDefinition[data.equipement[i].hash]!.inventory!.bucketTypeHash!,
            mods: mods),
      );
    }
    if (Provider.of<BuilderSubclassProvider>(context, listen: false).subclassId != null) {
      final List<int> subclassMods = Provider.of<BuilderSubclassModsProvider>(context, listen: false)
          .subclassMods
          .where((element) => element.hash != null)
          .map((e) => e.hash!)
          .toList();
      items.add(
        Item(
            instanceId: Provider.of<BuilderSubclassProvider>(context, listen: false).subclassId!,
            itemHash: Provider.of<BuilderSubclassProvider>(context, listen: false).subclass!.hash!,
            isEquipped: true,
            bucketHash: InventoryBucket.subclass,
            mods: subclassMods),
      );
    }
    return items;
  }

  void redirectToBuildSaving(BuildContext context, {required Build data}) {
    Provider.of<CreateBuildProvider>(context, listen: false).clear();
    final items = changeBuildToListOfItems(context, data: data);
    Provider.of<CreateBuildProvider>(context, listen: false).setBuild(items);
    Navigator.pushNamed(context, routeCreateBuild);
  }

  Preset calculatePreset(BuildContext context, {required List<Item> data}) {
    List<String> stats = [];
    List<int> filters =
        Provider.of<BuilderStatsFilterProvider>(context, listen: false).filters.map((e) => e.value).toList();
    if (filters.isEmpty) {
      final mapStats = BuilderService().buildStatCalculator(context, items: data);
      stats = mapStats.keys.toList(growable: false)..sort((k1, k2) => mapStats[k2]!.compareTo(mapStats[k1]!));
    }
    final armor = data.where((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.itemType ==
        DestinyItemType.Armor);
    final int? exoticHash = armor
        .firstWhereOrNull((element) =>
            ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.inventory?.tierType ==
            TierType.Exotic)
        ?.itemHash;
    final helmetItem = armor.firstWhereOrNull((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.itemSubType ==
        DestinyItemSubType.HelmetArmor);
    final gauntletItem = armor.firstWhereOrNull((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.itemSubType ==
        DestinyItemSubType.GauntletsArmor);
    final chestItem = armor.firstWhereOrNull((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.itemSubType ==
        DestinyItemSubType.ChestArmor);
    final legItem = armor.firstWhereOrNull((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.itemSubType ==
        DestinyItemSubType.LegArmor);
    final classItem = armor.firstWhereOrNull((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.itemSubType ==
        DestinyItemSubType.ClassArmor);
    Map<String, List<int>> armorMods = {
      "helmet": helmetItem != null ? helmetItem.mods.sublist(1).toList() : [],
      "gauntlets": gauntletItem != null ? gauntletItem.mods.sublist(1).toList() : [],
      "chest": chestItem != null ? chestItem.mods.sublist(1).toList() : [],
      "leg": legItem != null ? legItem.mods.sublist(1).toList() : [],
      "classItem": classItem != null ? classItem.mods.sublist(1).toList() : [],
    };
    final Item? subclass = data.firstWhereOrNull((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.itemType ==
        DestinyItemType.Subclass);
    List<int> subclassMods = subclass != null ? subclass.mods : [];
    return Preset(
        statOrder: filters.isEmpty ? stats.map((e) => int.parse(e)).toList() : filters,
        statWeighing: Provider.of<BuilderStatsFilterProvider>(context, listen: false).statWeighing,
        exoticHash: exoticHash,
        armorMods: armorMods,
        subclassMods: subclassMods,
        subclassHash: subclass?.itemHash);
  }

  Future<void> updateBuild(BuildContext context, String name) async {
    final build = Provider.of<CreateBuildProvider>(context, listen: false).items;
    final id = Provider.of<CreateBuildProvider>(context, listen: false).id;

    await http.put(Uri.parse("${_backendURl}build"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "id": id,
          "name": name,
          "bungieName": AccountService.currentMembership?.membershipId,
          "items": build.map((e) => e.toJson()).toList(),
          "usedTimes": 0,
          "className": Provider.of<CharactersProvider>(context, listen: false).currentCharacter?.classType?.value,
          "preset": calculatePreset(context, data: build).toJson(),
        }));
    return;
  }

  Future<List<BuildStored>> getBuilds() async {
    String? bungieName = AccountService.currentMembership?.membershipId;
    final response = await http.get(Uri.parse("${_backendURl}builds/$bungieName"));
    if (response.statusCode == 200) {
      List<dynamic> builds = json.decode(response.body);
      return builds.map((e) => BuildStored.fromMap(e)).toList();
    }
    return [];
  }

  Future<void> shareBuild(BuildContext context, {required String id}) async {
    if (kIsWeb || Platform.isWindows) {
      Clipboard.setData(ClipboardData(text: "https://quriacompanion.app/build?buildId=$id"));
      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
        content: textBodyMedium(
          AppLocalizations.of(context)!.build_copy,
          utf8: false,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ));
      return;
    }
    await FlutterShare.share(
        title: 'QuriaCompanion',
        text: AppLocalizations.of(context)!.build_share_text,
        linkUrl: 'https://quriacompanion.app/build?buildId=$id',
        chooserTitle: 'Open Quria Companion');
  }

  Future<BuildStored?> getBuild(String id) async {
    final response = await http.get(Uri.parse("${_backendURl}build/$id"));
    if (response.statusCode == 200) {
      final build = BuildStored.fromJson(response.body);
      final List<int> itemIds = [];
      for (final Item item in build.items) {
        itemIds.add(item.itemHash);
      }
      await StorageService.getDefinitions<DestinyInventoryItemDefinition>(itemIds);
      return build;
    }
    return null;
  }

  Future<void> deleteBuild(String id) async {
    await http.delete(Uri.parse("${_backendURl}build/$id"));
    return;
  }

  Future<List<Build>> calculateBuilds({
    required BuilderHelper data,
  }) async {
    if (kIsWeb) {
      await Future.delayed(const Duration(milliseconds: 200));
    }
    return await compute(_armorLoop, data);
  }

  Future<List<Build>> _armorLoop(BuilderHelper builderHelper) async {
    /// Calculate the base stats for an armor
    Map<int, int> statCalculator(DestinyItemComponent item) {
      // instanciate stats
      Map<int, int> investmentStats = {
        StatsHash.mobility: 0,
        StatsHash.resilience: 0,
        StatsHash.recovery: 0,
        StatsHash.discipline: 0,
        StatsHash.intellect: 0,
        StatsHash.strength: 0,
      };
      if (builderHelper.considerMasterwork || item.state == ItemState.Masterwork || item.state == const ItemState(5)) {
        investmentStats = {
          StatsHash.mobility: 2,
          StatsHash.resilience: 2,
          StatsHash.recovery: 2,
          StatsHash.discipline: 2,
          StatsHash.intellect: 2,
          StatsHash.strength: 2,
        };
      }
      // get sockets for the item
      List<DestinyItemSocketState>? sockets = builderHelper.sockets[item.itemInstanceId]?.sockets;
      // get only the sockets that actually contain stats
      Iterable<DestinyItemSocketState>? plugs = sockets?.where(((element) => element.isVisible == false));
      // get the inventory def for given sockets
      if (plugs == null || plugs.isEmpty) return investmentStats;
      Iterable<DestinyInventoryItemDefinition?> plm = plugs.map((e) => builderHelper.manifest[e.plugHash]);
      // foreach inventory def, get the stats and adds the to investmentStats
      for (DestinyInventoryItemDefinition? entry in plm) {
        if (entry?.investmentStats != null) {
          for (DestinyItemInvestmentStatDefinition newStats in entry!.investmentStats!) {
            investmentStats[newStats.statTypeHash!] = investmentStats[newStats.statTypeHash!]! + newStats.value!;
          }
        }
      }
      return investmentStats;
    }

    /// Calculate the perfect mods to reach higher stats in the required order
    BuilderOptionalMods optionalMods(Map<int, int> statistics, List<int> armorModspace, List<int> statOrder,
        Map<int, DestinyInventoryItemDefinition> manifest) {
      // this will be the list of optional mods that will be added to the build pre calculated
      final List<DestinyInventoryItemDefinition?> modSelected = [];

      // this is every mods that can be used for each stat
      Map<int, Map<bool, DestinyInventoryItemDefinition>> armordModValues = {
        StatsHash.mobility: {false: manifest[204137529]!, true: manifest[3961599962]!},
        StatsHash.resilience: {false: manifest[3682186345]!, true: manifest[2850583378]!},
        StatsHash.recovery: {false: manifest[555005975]!, true: manifest[2645858828]!},
        StatsHash.intellect: {false: manifest[1227870362]!, true: manifest[3355995799]!},
        StatsHash.discipline: {false: manifest[2623485440]!, true: manifest[4048838440]!},
        StatsHash.strength: {false: manifest[3699676109]!, true: manifest[3253038666]!},
      };
      // remaining points that are not yet used for each armor slot
      for (int i = 0; i < armorModspace.length; i++) {
        // if there are still some points available
        if (armorModspace[i] > 0) {
          // then we loop through the stat by priority order

          for (var statHash in statOrder) {
            // check if the stat is not already maxed out
            if (statistics[statHash]! < 100) {
              // check what kind of mod is required based on how many points are required to go to the next tier
              // ex: if the stat is at 55 you only need a minor mod (+5 to reach next tier)
              // also check if the cost of the mod is not higher than the remaining points
              if ((statistics[statHash]! % 10) > 5 &&
                  armorModspace[i] >= armordModValues[statHash]![false]!.investmentStats![0].value!) {
                modSelected.add(armordModValues[statHash]![false]!);
                statistics[statHash] =
                    statistics[statHash]! + armordModValues[statHash]![false]!.investmentStats![1].value!;
                break;
              }
              // if a regular mod is required it checks if the cost of the mod is not higher than the remaining points
              if (armorModspace[i] >= armordModValues[statHash]![true]!.investmentStats![0].value!) {
                modSelected.add(armordModValues[statHash]![true]!);
                statistics[statHash] =
                    statistics[statHash]! + armordModValues[statHash]![true]!.investmentStats![1].value!;
                break;
              }
            }
          }
        }
        if (modSelected.length < i + 1) modSelected.add(null);
      }
      // return selecterd mods and the new stat values
      return BuilderOptionalMods(modSelected: modSelected, statValues: statistics);
    }

    // all bonus stats that are gonna be used (both armor mods and subclass mods)
    Map<int, int> modBonus = {
      StatsHash.mobility: 0,
      StatsHash.resilience: 0,
      StatsHash.recovery: 0,
      StatsHash.discipline: 0,
      StatsHash.intellect: 0,
      StatsHash.strength: 0,
    };
    // loops through subclass mods
    for (DestinyInventoryItemDefinition mod in builderHelper.subclassMods) {
      //check if the mod has bonus stats
      if (mod.investmentStats != null && mod.investmentStats!.isNotEmpty) {
        // loops through the bonus stats
        for (var stat in mod.investmentStats!) {
          // check if the bonus stat is in the list of armor stats
          if (stat.statTypeHash == StatsHash.mobility ||
              stat.statTypeHash == StatsHash.resilience ||
              stat.statTypeHash == StatsHash.recovery ||
              stat.statTypeHash == StatsHash.discipline ||
              stat.statTypeHash == StatsHash.intellect ||
              stat.statTypeHash == StatsHash.strength) {
            // add the bonus stat to the correct stat
            modBonus[stat.statTypeHash!] = modBonus[stat.statTypeHash]! + stat.value!;
          }
        }
      }
    }
    //instanciate armor mod space (starts at 10 points for each armor assuming everything is masterworked)
    List<int> armorModspace = [10, 10, 10, 10, 10];
    // loops through the armor mods
    for (int i = 0; i < builderHelper.armorMods.length; i++) {
      // check if there is an armor in this slot
      if (builderHelper.armorMods[i].items.isNotEmpty) {
        // loops through the mods in this armor
        for (DestinyInventoryItemDefinition? mod in builderHelper.armorMods[i].items) {
          // check if the mod has bonus stats
          if (mod != null && mod.investmentStats != null && mod.investmentStats!.isNotEmpty) {
            // loops through the bonus stats
            for (var stat in mod.investmentStats!) {
              // if it gives a bonus to stat it adds it to the correct stat
              if (stat.statTypeHash == StatsHash.mobility ||
                  stat.statTypeHash == StatsHash.resilience ||
                  stat.statTypeHash == StatsHash.recovery ||
                  stat.statTypeHash == StatsHash.discipline ||
                  stat.statTypeHash == StatsHash.intellect ||
                  stat.statTypeHash == StatsHash.strength) {
                modBonus[stat.statTypeHash!] = modBonus[stat.statTypeHash]! + stat.value!;
              }
              // if it has a cost to the armor it reduces the armor mod space
              if (stat.statTypeHash == 3779394102 ||
                  stat.statTypeHash == 3344745325 ||
                  stat.statTypeHash == 107977982 ||
                  stat.statTypeHash == 3950461274 ||
                  stat.statTypeHash == 998798867 ||
                  stat.statTypeHash == 2399985800 ||
                  stat.statTypeHash == 3176563510 ||
                  stat.statTypeHash == 3578062600) {
                armorModspace[i] -= stat.value!;
              }
            }
          }
        }
      }
    }
    // find every armor
    final List<DestinyItemComponent> armors = builderHelper.armors.where((element) {
      if (element.itemHash == builderHelper.exotic?.hash) {
        return true;
      } else if (builderHelper.manifest[element.itemHash]?.itemSubType == builderHelper.exotic?.itemSubType ||
          builderHelper.manifest[element.itemHash]?.inventory?.tierType == TierType.Exotic) {
        return false;
      } else {
        return true;
      }
    }).toList();
    List<Build> builds = [];

    for (DestinyItemComponent helmet in armors
        .where((element) => builderHelper.manifest[element.itemHash]?.itemSubType == DestinyItemSubType.HelmetArmor)) {
      Map<int, int> helmetStats = statCalculator(helmet);
      for (DestinyItemComponent gauntlet in armors.where(
          (element) => builderHelper.manifest[element.itemHash]?.itemSubType == DestinyItemSubType.GauntletsArmor)) {
        Map<int, int> gauntletStats = statCalculator(gauntlet);
        for (DestinyItemComponent chest in armors.where(
            (element) => builderHelper.manifest[element.itemHash]?.itemSubType == DestinyItemSubType.ChestArmor)) {
          Map<int, int> chestStats = statCalculator(chest);
          for (DestinyItemComponent leg in armors.where(
              (element) => builderHelper.manifest[element.itemHash]?.itemSubType == DestinyItemSubType.LegArmor)) {
            Map<int, int> legStats = statCalculator(leg);
            Map<int, int> statTiers = {};
            Map<int, int> statistics = {
              StatsHash.mobility: 0,
              StatsHash.resilience: 0,
              StatsHash.recovery: 0,
              StatsHash.discipline: 0,
              StatsHash.intellect: 0,
              StatsHash.strength: 0,
            };
            if (builderHelper.considerMasterwork ||
                builderHelper.classItem.state == ItemState.Masterwork ||
                builderHelper.classItem.state == const ItemState(5)) {
              statistics = {
                StatsHash.mobility: 2,
                StatsHash.resilience: 2,
                StatsHash.recovery: 2,
                StatsHash.discipline: 2,
                StatsHash.intellect: 2,
                StatsHash.strength: 2,
              };
            }

            statistics[StatsHash.mobility] = statistics[StatsHash.mobility]! +
                helmetStats[StatsHash.mobility]! +
                gauntletStats[StatsHash.mobility]! +
                chestStats[StatsHash.mobility]! +
                legStats[StatsHash.mobility]!;

            statistics[StatsHash.resilience] = statistics[StatsHash.resilience]! +
                helmetStats[StatsHash.resilience]! +
                gauntletStats[StatsHash.resilience]! +
                chestStats[StatsHash.resilience]! +
                legStats[StatsHash.resilience]!;

            statistics[StatsHash.recovery] = statistics[StatsHash.recovery]! +
                helmetStats[StatsHash.recovery]! +
                gauntletStats[StatsHash.recovery]! +
                chestStats[StatsHash.recovery]! +
                legStats[StatsHash.recovery]!;

            statistics[StatsHash.discipline] = statistics[StatsHash.discipline]! +
                helmetStats[StatsHash.discipline]! +
                gauntletStats[StatsHash.discipline]! +
                chestStats[StatsHash.discipline]! +
                legStats[StatsHash.discipline]!;
            statistics[StatsHash.intellect] = statistics[StatsHash.intellect]! +
                helmetStats[StatsHash.intellect]! +
                gauntletStats[StatsHash.intellect]! +
                chestStats[StatsHash.intellect]! +
                legStats[StatsHash.intellect]!;
            statistics[StatsHash.strength] = statistics[StatsHash.strength]! +
                helmetStats[StatsHash.strength]! +
                gauntletStats[StatsHash.strength]! +
                chestStats[StatsHash.strength]! +
                legStats[StatsHash.strength]!;

            statTiers[StatsHash.mobility] = (statistics[StatsHash.mobility]! / 10).floor();
            statTiers[StatsHash.resilience] = (statistics[StatsHash.resilience]! / 10).floor();
            statTiers[StatsHash.recovery] = (statistics[StatsHash.recovery]! / 10).floor();
            statTiers[StatsHash.discipline] = (statistics[StatsHash.discipline]! / 10).floor();
            statTiers[StatsHash.intellect] = (statistics[StatsHash.intellect]! / 10).floor();
            statTiers[StatsHash.strength] = (statistics[StatsHash.strength]! / 10).floor();
            int baseTier = statTiers[StatsHash.mobility]! +
                statTiers[StatsHash.resilience]! +
                statTiers[StatsHash.recovery]! +
                statTiers[StatsHash.discipline]! +
                statTiers[StatsHash.intellect]! +
                statTiers[StatsHash.strength]!;

            statistics[StatsHash.mobility] = statistics[StatsHash.mobility]! + modBonus[StatsHash.mobility]!;
            statistics[StatsHash.resilience] = statistics[StatsHash.resilience]! + modBonus[StatsHash.resilience]!;
            statistics[StatsHash.recovery] = statistics[StatsHash.recovery]! + modBonus[StatsHash.recovery]!;
            statistics[StatsHash.discipline] = statistics[StatsHash.discipline]! + modBonus[StatsHash.discipline]!;
            statistics[StatsHash.intellect] = statistics[StatsHash.intellect]! + modBonus[StatsHash.intellect]!;
            statistics[StatsHash.strength] = statistics[StatsHash.strength]! + modBonus[StatsHash.strength]!;

            BuilderOptionalMods optionalModsResult =
                optionalMods(statistics, armorModspace, builderHelper.statOrder, builderHelper.manifest);
            statistics = optionalModsResult.statValues;
            statTiers[StatsHash.mobility] = (statistics[StatsHash.mobility]! / 10).floor();
            statTiers[StatsHash.resilience] = (statistics[StatsHash.resilience]! / 10).floor();
            statTiers[StatsHash.recovery] = (statistics[StatsHash.recovery]! / 10).floor();
            statTiers[StatsHash.discipline] = (statistics[StatsHash.discipline]! / 10).floor();
            statTiers[StatsHash.intellect] = (statistics[StatsHash.intellect]! / 10).floor();
            statTiers[StatsHash.strength] = (statistics[StatsHash.strength]! / 10).floor();
            int finalTier = statTiers[StatsHash.mobility]! +
                statTiers[StatsHash.resilience]! +
                statTiers[StatsHash.recovery]! +
                statTiers[StatsHash.discipline]! +
                statTiers[StatsHash.intellect]! +
                statTiers[StatsHash.strength]!;

            int statToFilterBy = 0;
            switch (builderHelper.statWeighing) {
              case StatWeighing.allTiers:
                statToFilterBy = baseTier;

                break;
              case StatWeighing.maxOne:
                statToFilterBy = statTiers[builderHelper.statOrder[0]]!;
                break;
              case StatWeighing.maxTwo:
                statToFilterBy = statTiers[builderHelper.statOrder[0]]! + statTiers[builderHelper.statOrder[1]]!;
                break;
              case StatWeighing.maxThree:
                statToFilterBy = statTiers[builderHelper.statOrder[0]]! +
                    statTiers[builderHelper.statOrder[1]]! +
                    statTiers[builderHelper.statOrder[1]]!;
                break;
            }

            Stats stats = Stats(
                base: baseTier,
                max: finalTier,
                ordering: statTiers,
                statistics: statistics,
                statToFilterBy: statToFilterBy);

            List<Armor> armors = [
              Armor(
                  hash: helmet.itemHash!,
                  displayHash: helmet.overrideStyleItemHash ?? helmet.itemHash!,
                  itemInstanceId: helmet.itemInstanceId!,
                  mod: optionalModsResult.modSelected[0],
                  type: 0),
              Armor(
                  hash: gauntlet.itemHash!,
                  displayHash: gauntlet.overrideStyleItemHash ?? gauntlet.itemHash!,
                  itemInstanceId: gauntlet.itemInstanceId!,
                  mod: optionalModsResult.modSelected[1],
                  type: 1),
              Armor(
                  hash: chest.itemHash!,
                  displayHash: chest.overrideStyleItemHash ?? chest.itemHash!,
                  itemInstanceId: chest.itemInstanceId!,
                  mod: optionalModsResult.modSelected[2],
                  type: 2),
              Armor(
                  hash: leg.itemHash!,
                  displayHash: leg.overrideStyleItemHash ?? leg.itemHash!,
                  itemInstanceId: leg.itemInstanceId!,
                  mod: optionalModsResult.modSelected[3],
                  type: 3),
              Armor(
                  hash: builderHelper.classItem.itemHash!,
                  displayHash: builderHelper.classItem.overrideStyleItemHash ?? builderHelper.classItem.itemHash!,
                  itemInstanceId: builderHelper.classItem.itemInstanceId!,
                  mod: optionalModsResult.modSelected[4],
                  type: 4)
            ];
            builds.add(Build(
              stats: stats,
              equipement: armors,
            ));
            if (builds.length == 100) {
              builds.sort((a, b) => (a.stats.statToFilterBy < b.stats.statToFilterBy) ? 1 : -1);
              builds = builds.getRange(0, 50).toList();
            }
          }
        }
      }
    }

    if (builds.length > 50) {
      builds = builds.getRange(0, 50).toList();
    }
    builds.sort((a, b) {
      int tiers = a.stats.max.compareTo(b.stats.max);
      if (tiers != 0) return tiers;
      int stat0 =
          a.stats.ordering[builderHelper.statOrder[0]]!.compareTo(b.stats.ordering[builderHelper.statOrder[0]]!);
      if (stat0 != 0) return stat0;
      int stat1 =
          a.stats.ordering[builderHelper.statOrder[1]]!.compareTo(b.stats.ordering[builderHelper.statOrder[1]]!);

      if (stat1 != 0) return stat1;
      int stat2 =
          a.stats.ordering[builderHelper.statOrder[2]]!.compareTo(b.stats.ordering[builderHelper.statOrder[2]]!);
      if (stat2 != 0) return stat2;
      int stat3 =
          a.stats.ordering[builderHelper.statOrder[3]]!.compareTo(b.stats.ordering[builderHelper.statOrder[3]]!);
      if (stat3 != 0) return stat3;
      int stat4 =
          a.stats.ordering[builderHelper.statOrder[4]]!.compareTo(b.stats.ordering[builderHelper.statOrder[4]]!);
      if (stat4 != 0) return stat4;
      int stat5 =
          a.stats.ordering[builderHelper.statOrder[5]]!.compareTo(b.stats.ordering[builderHelper.statOrder[5]]!);
      if (stat5 != 0) return stat5;
      return 0;
    });

    return builds.reversed.toList();
  }
}
