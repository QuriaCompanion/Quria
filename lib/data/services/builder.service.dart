import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_investment_stat_definition.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:quria/data/models/StatWeighing.enum.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';
import 'package:flutter/foundation.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class BuilderService {
  Future<List<Build>> calculateBuilds({
    required BuilderPreparation data,
  }) async {
    ProfileService profile = ProfileService();
    DestinyCharacterComponent? character =
        profile.getCharacter(data.characterId);
    List<DestinyItemComponent> armors = profile.getAllArmorForClass(
        character!.classType!,
        includeSunset: data.includeSunset);
    Map<String, DestinyItemSocketsComponent> sockets = profile.getAllSockets();

    DestinyItemComponent classItem =
        profile.getItemByInstanceId(data.classItemInstanceId)!;

    BuilderHelper builder = BuilderHelper(
      statOrder: data.statOrder,
      exotic: ManifestService
          .manifestParsed.destinyInventoryItemDefinition[data.exoticHash],
      armors: armors,
      manifest: ManifestService.manifestParsed.destinyInventoryItemDefinition,
      sockets: sockets,
      armorMods: data.armorMods,
      subclassMods: data.subclassMods,
      statWeighing: data.statWeighing,
      considerMasterwork: data.considerMasterwork,
      classItem: classItem,
    );

    return await compute(_armorLoop, builder);
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
      if (builderHelper.considerMasterwork ||
          item.state == ItemState.Masterwork ||
          item.state == const ItemState(5)) {
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
      List<DestinyItemSocketState>? sockets =
          builderHelper.sockets[item.itemInstanceId]?.sockets;
      // get only the sockets that actually contain stats
      Iterable<DestinyItemSocketState>? plugs =
          sockets?.where(((element) => element.isVisible == false));
      // get the inventory def for given sockets
      if (plugs == null || plugs.isEmpty) return investmentStats;
      Iterable<DestinyInventoryItemDefinition?> plm =
          plugs.map((e) => builderHelper.manifest[e.plugHash]);
      // foreach inventory def, get the stats and adds the to investmentStats
      for (DestinyInventoryItemDefinition? entry in plm) {
        if (entry?.investmentStats != null) {
          for (DestinyItemInvestmentStatDefinition newStats
              in entry!.investmentStats!) {
            investmentStats[newStats.statTypeHash!] =
                investmentStats[newStats.statTypeHash!]! + newStats.value!;
          }
        }
      }
      return investmentStats;
    }

    /// Calculate the perfect mods to reach higher stats in the required order
    BuilderOptionalMods optionalMods(
        Map<int, int> statistics,
        List<int> armorModspace,
        List<int> statOrder,
        Map<int, DestinyInventoryItemDefinition> manifest) {
      // this will be the list of optional mods that will be added to the build pre calculated
      final List<DestinyInventoryItemDefinition?> modSelected = [];

      // this is every mods that can be used for each stat
      Map<int, Map<bool, DestinyInventoryItemDefinition>> armordModValues = {
        StatsHash.mobility: {
          false: manifest[204137529]!,
          true: manifest[3961599962]!
        },
        StatsHash.resilience: {
          false: manifest[3682186345]!,
          true: manifest[2850583378]!
        },
        StatsHash.recovery: {
          false: manifest[555005975]!,
          true: manifest[2645858828]!
        },
        StatsHash.intellect: {
          false: manifest[1227870362]!,
          true: manifest[3355995799]!
        },
        StatsHash.discipline: {
          false: manifest[2623485440]!,
          true: manifest[4048838440]!
        },
        StatsHash.strength: {
          false: manifest[3699676109]!,
          true: manifest[3253038666]!
        },
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
                  armorModspace[i] >=
                      armordModValues[statHash]![false]!
                          .investmentStats![0]
                          .value!) {
                modSelected.add(armordModValues[statHash]![false]!);
                statistics[statHash] = statistics[statHash]! +
                    armordModValues[statHash]![false]!
                        .investmentStats![1]
                        .value!;
                break;
              }
              // if a regular mod is required it checks if the cost of the mod is not higher than the remaining points
              if (armorModspace[i] >=
                  armordModValues[statHash]![true]!
                      .investmentStats![0]
                      .value!) {
                modSelected.add(armordModValues[statHash]![true]!);
                statistics[statHash] = statistics[statHash]! +
                    armordModValues[statHash]![true]!
                        .investmentStats![1]
                        .value!;
                break;
              }
            }
          }
        }
        if (modSelected.length < i + 1) modSelected.add(null);
      }
      // return selecterd mods and the new stat values
      return BuilderOptionalMods(
          modSelected: modSelected, statValues: statistics);
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
            modBonus[stat.statTypeHash!] =
                modBonus[stat.statTypeHash]! + stat.value!;
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
        for (DestinyInventoryItemDefinition? mod
            in builderHelper.armorMods[i].items) {
          // check if the mod has bonus stats
          if (mod != null &&
              mod.investmentStats != null &&
              mod.investmentStats!.isNotEmpty) {
            // loops through the bonus stats
            for (var stat in mod.investmentStats!) {
              // if it gives a bonus to stat it adds it to the correct stat
              if (stat.statTypeHash == StatsHash.mobility ||
                  stat.statTypeHash == StatsHash.resilience ||
                  stat.statTypeHash == StatsHash.recovery ||
                  stat.statTypeHash == StatsHash.discipline ||
                  stat.statTypeHash == StatsHash.intellect ||
                  stat.statTypeHash == StatsHash.strength) {
                modBonus[stat.statTypeHash!] =
                    modBonus[stat.statTypeHash]! + stat.value!;
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
    final List<DestinyItemComponent> armors =
        builderHelper.armors.where((element) {
      if (element.itemHash == builderHelper.exotic?.hash) {
        return true;
      } else if (builderHelper.manifest[element.itemHash]?.itemSubType ==
              builderHelper.exotic?.itemSubType ||
          builderHelper.manifest[element.itemHash]?.inventory?.tierType ==
              TierType.Exotic) {
        return false;
      } else {
        return true;
      }
    }).toList();
    List<Build> builds = [];

    for (DestinyItemComponent helmet in armors.where((element) =>
        builderHelper.manifest[element.itemHash]?.itemSubType ==
        DestinyItemSubType.HelmetArmor)) {
      Map<int, int> helmetStats = statCalculator(helmet);
      for (DestinyItemComponent gauntlet in armors.where((element) =>
          builderHelper.manifest[element.itemHash]?.itemSubType ==
          DestinyItemSubType.GauntletsArmor)) {
        Map<int, int> gauntletStats = statCalculator(gauntlet);
        for (DestinyItemComponent chest in armors.where((element) =>
            builderHelper.manifest[element.itemHash]?.itemSubType ==
            DestinyItemSubType.ChestArmor)) {
          Map<int, int> chestStats = statCalculator(chest);
          for (DestinyItemComponent leg in armors.where((element) =>
              builderHelper.manifest[element.itemHash]?.itemSubType ==
              DestinyItemSubType.LegArmor)) {
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

            statistics[StatsHash.resilience] =
                statistics[StatsHash.resilience]! +
                    helmetStats[StatsHash.resilience]! +
                    gauntletStats[StatsHash.resilience]! +
                    chestStats[StatsHash.resilience]! +
                    legStats[StatsHash.resilience]!;

            statistics[StatsHash.recovery] = statistics[StatsHash.recovery]! +
                helmetStats[StatsHash.recovery]! +
                gauntletStats[StatsHash.recovery]! +
                chestStats[StatsHash.recovery]! +
                legStats[StatsHash.recovery]!;

            statistics[StatsHash.discipline] =
                statistics[StatsHash.discipline]! +
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

            statTiers[StatsHash.mobility] =
                (statistics[StatsHash.mobility]! / 10).floor();
            statTiers[StatsHash.resilience] =
                (statistics[StatsHash.resilience]! / 10).floor();
            statTiers[StatsHash.recovery] =
                (statistics[StatsHash.recovery]! / 10).floor();
            statTiers[StatsHash.discipline] =
                (statistics[StatsHash.discipline]! / 10).floor();
            statTiers[StatsHash.intellect] =
                (statistics[StatsHash.intellect]! / 10).floor();
            statTiers[StatsHash.strength] =
                (statistics[StatsHash.strength]! / 10).floor();
            int baseTier = statTiers[StatsHash.mobility]! +
                statTiers[StatsHash.resilience]! +
                statTiers[StatsHash.recovery]! +
                statTiers[StatsHash.discipline]! +
                statTiers[StatsHash.intellect]! +
                statTiers[StatsHash.strength]!;

            statistics[StatsHash.mobility] =
                statistics[StatsHash.mobility]! + modBonus[StatsHash.mobility]!;
            statistics[StatsHash.resilience] =
                statistics[StatsHash.resilience]! +
                    modBonus[StatsHash.resilience]!;
            statistics[StatsHash.recovery] =
                statistics[StatsHash.recovery]! + modBonus[StatsHash.recovery]!;
            statistics[StatsHash.discipline] =
                statistics[StatsHash.discipline]! +
                    modBonus[StatsHash.discipline]!;
            statistics[StatsHash.intellect] = statistics[StatsHash.intellect]! +
                modBonus[StatsHash.intellect]!;
            statistics[StatsHash.strength] =
                statistics[StatsHash.strength]! + modBonus[StatsHash.strength]!;

            BuilderOptionalMods optionalModsResult = optionalMods(statistics,
                armorModspace, builderHelper.statOrder, builderHelper.manifest);
            statistics = optionalModsResult.statValues;
            statTiers[StatsHash.mobility] =
                (statistics[StatsHash.mobility]! / 10).floor();
            statTiers[StatsHash.resilience] =
                (statistics[StatsHash.resilience]! / 10).floor();
            statTiers[StatsHash.recovery] =
                (statistics[StatsHash.recovery]! / 10).floor();
            statTiers[StatsHash.discipline] =
                (statistics[StatsHash.discipline]! / 10).floor();
            statTiers[StatsHash.intellect] =
                (statistics[StatsHash.intellect]! / 10).floor();
            statTiers[StatsHash.strength] =
                (statistics[StatsHash.strength]! / 10).floor();
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
                statToFilterBy = statTiers[builderHelper.statOrder[0]]! +
                    statTiers[builderHelper.statOrder[1]]!;
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
                  mods: optionalModsResult.modSelected[0],
                  type: 0),
              Armor(
                  hash: gauntlet.itemHash!,
                  displayHash:
                      gauntlet.overrideStyleItemHash ?? gauntlet.itemHash!,
                  itemInstanceId: gauntlet.itemInstanceId!,
                  mods: optionalModsResult.modSelected[1],
                  type: 1),
              Armor(
                  hash: chest.itemHash!,
                  displayHash: chest.overrideStyleItemHash ?? chest.itemHash!,
                  itemInstanceId: chest.itemInstanceId!,
                  mods: optionalModsResult.modSelected[2],
                  type: 2),
              Armor(
                  hash: leg.itemHash!,
                  displayHash: leg.overrideStyleItemHash ?? leg.itemHash!,
                  itemInstanceId: leg.itemInstanceId!,
                  mods: optionalModsResult.modSelected[3],
                  type: 3),
              Armor(
                  hash: builderHelper.classItem.itemHash!,
                  displayHash: builderHelper.classItem.overrideStyleItemHash ??
                      builderHelper.classItem.itemHash!,
                  itemInstanceId: builderHelper.classItem.itemInstanceId!,
                  mods: optionalModsResult.modSelected[4],
                  type: 4)
            ];
            builds.add(Build(
              stats: stats,
              equipement: armors,
            ));
            if (builds.length == 100) {
              builds.sort((a, b) =>
                  (a.stats.statToFilterBy < b.stats.statToFilterBy) ? 1 : -1);
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
      int stat0 = a.stats.ordering[builderHelper.statOrder[0]]!
          .compareTo(b.stats.ordering[builderHelper.statOrder[0]]!);
      if (stat0 != 0) return stat0;
      int stat1 = a.stats.ordering[builderHelper.statOrder[1]]!
          .compareTo(b.stats.ordering[builderHelper.statOrder[1]]!);

      if (stat1 != 0) return stat1;
      int stat2 = a.stats.ordering[builderHelper.statOrder[2]]!
          .compareTo(b.stats.ordering[builderHelper.statOrder[2]]!);
      if (stat2 != 0) return stat2;
      int stat3 = a.stats.ordering[builderHelper.statOrder[3]]!
          .compareTo(b.stats.ordering[builderHelper.statOrder[3]]!);
      if (stat3 != 0) return stat3;
      int stat4 = a.stats.ordering[builderHelper.statOrder[4]]!
          .compareTo(b.stats.ordering[builderHelper.statOrder[4]]!);
      if (stat4 != 0) return stat4;
      int stat5 = a.stats.ordering[builderHelper.statOrder[5]]!
          .compareTo(b.stats.ordering[builderHelper.statOrder[5]]!);
      if (stat5 != 0) return stat5;
      return 0;
    });

    return builds.reversed.toList();
  }
}
