import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_item_investment_stat_definition.dart';
import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';
import 'package:flutter/foundation.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class BuilderService {
  Future<List<Build>> calculateBuilds(
      {required List<int> statOrder,
      required DestinyClass classType,
      int? exoticHash}) async {
    ProfileService profile = ProfileService();
    List<DestinyItemComponent> armors = profile.getAllArmorForClass(classType);
    Map<String, DestinyItemSocketsComponent> sockets = profile.getAllSockets();

    BuilderHelper builder = BuilderHelper(
        statOrder: statOrder,
        exotic: ManifestService
            .manifestParsed.destinyInventoryItemDefinition![exoticHash!],
        armors: armors,
        manifest:
            ManifestService.manifestParsed.destinyInventoryItemDefinition!,
        sockets: sockets);

    return await compute(_armorLoop, builder);
  }

  Future<List<Build>> _armorLoop(BuilderHelper builderHelper) async {
    Map<int, int> statCalculator(DestinyItemComponent item) {
      Map<int, int> investmentStats = {
        2996146975: 0,
        392767087: 0,
        1943323491: 0,
        1735777505: 0,
        144602215: 0,
        4244567218: 0,
      };
      List<DestinyItemSocketState>? sockets =
          builderHelper.sockets[item.itemInstanceId]?.sockets;
      Iterable<DestinyItemSocketState>? plugs =
          sockets?.where(((element) => element.isVisible == false));
      Iterable<DestinyInventoryItemDefinition?> plm =
          plugs!.map((e) => builderHelper.manifest[e.plugHash]);
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

    Map<int, int> modBonus = {
      2996146975: 0,
      392767087: 0,
      1943323491: 0,
      1735777505: 0,
      144602215: 0,
      4244567218: 0,
    };
    for (var mod in builderHelper.mods) {
      if (mod.investmentStats != null && mod.investmentStats!.isNotEmpty) {
        for (var stat in mod.investmentStats!) {
          if (stat.statTypeHash == 2996146975 ||
              stat.statTypeHash == 392767087 ||
              stat.statTypeHash == 1943323491 ||
              stat.statTypeHash == 1735777505 ||
              stat.statTypeHash == 144602215 ||
              stat.statTypeHash == 4244567218) {
            modBonus[stat.statTypeHash!] =
                modBonus[stat.statTypeHash]! + stat.value!;
          }
        }
      }
    }

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
            Map<int, int> statValues = {};
            int mobility = helmetStats[2996146975]! +
                gauntletStats[2996146975]! +
                chestStats[2996146975]! +
                legStats[2996146975]! +
                modBonus[2996146975]! +
                10;
            int resilience = helmetStats[392767087]! +
                gauntletStats[392767087]! +
                chestStats[392767087]! +
                legStats[392767087]! +
                modBonus[392767087]! +
                10;

            int recovery = helmetStats[1943323491]! +
                gauntletStats[1943323491]! +
                chestStats[1943323491]! +
                legStats[1943323491]! +
                modBonus[1943323491]! +
                10;

            int discipline = helmetStats[1735777505]! +
                gauntletStats[1735777505]! +
                chestStats[1735777505]! +
                legStats[1735777505]! +
                modBonus[1735777505]! +
                10;
            int intellect = helmetStats[144602215]! +
                gauntletStats[144602215]! +
                chestStats[144602215]! +
                legStats[144602215]! +
                modBonus[144602215]! +
                10;
            int strength = helmetStats[4244567218]! +
                gauntletStats[4244567218]! +
                chestStats[4244567218]! +
                legStats[4244567218]! +
                modBonus[4244567218]! +
                10;
            statValues[2996146975] = (mobility / 10).floor();
            statValues[392767087] = (resilience / 10).floor();
            statValues[1943323491] = (recovery / 10).floor();
            statValues[1735777505] = (discipline / 10).floor();
            statValues[144602215] = (intellect / 10).floor();
            statValues[4244567218] = (strength / 10).floor();
            int baseTier = statValues[2996146975]! +
                statValues[392767087]! +
                statValues[1943323491]! +
                statValues[1735777505]! +
                statValues[144602215]! +
                statValues[4244567218]!;

            Stats stats = Stats(
                base: baseTier,
                max: baseTier + 9,
                ordering: statValues,
                mobility: mobility,
                resilience: resilience,
                recovery: recovery,
                discipline: discipline,
                intellect: intellect,
                strength: strength);
            List<Armor> armors = [
              Armor(
                  hash: helmet.itemHash!,
                  itemInstanceId: helmet.itemInstanceId!,
                  type: 0),
              Armor(
                  hash: gauntlet.itemHash!,
                  itemInstanceId: gauntlet.itemInstanceId!,
                  type: 1),
              Armor(
                  hash: chest.itemHash!,
                  itemInstanceId: chest.itemInstanceId!,
                  type: 2),
              Armor(
                  hash: leg.itemHash!,
                  itemInstanceId: leg.itemInstanceId!,
                  type: 3)
            ];
            builds.add(
                Build(stats: stats, equipement: armors, mod: [], material: []));
            if (builds.length == 100) {
              builds.sort((a, b) => (a.stats.base < b.stats.base) ? 1 : -1);
              builds = builds.getRange(0, 50).toList();
            }
          }
        }
      }
    }
    builds = builds.getRange(0, 50).toList();
    builds.sort((a, b) {
      int tiers = a.stats.base.compareTo(b.stats.base);
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
