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
      {required List<String> statOrder,
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
            int mobility = helmetStats[2996146975]! +
                gauntletStats[2996146975]! +
                chestStats[2996146975]! +
                legStats[2996146975]! +
                10;
            int resilience = helmetStats[392767087]! +
                gauntletStats[392767087]! +
                chestStats[392767087]! +
                legStats[392767087]! +
                10;
            int recovery = helmetStats[1943323491]! +
                gauntletStats[1943323491]! +
                chestStats[1943323491]! +
                legStats[1943323491]! +
                10;
            int discipline = helmetStats[1735777505]! +
                gauntletStats[1735777505]! +
                chestStats[1735777505]! +
                legStats[1735777505]! +
                10;
            int intellect = helmetStats[144602215]! +
                gauntletStats[144602215]! +
                chestStats[144602215]! +
                legStats[144602215]! +
                10;
            int strength = helmetStats[4244567218]! +
                gauntletStats[4244567218]! +
                chestStats[4244567218]! +
                legStats[4244567218]! +
                10;
            int mobiTier = (mobility / 10).floor();
            int resTier = (resilience / 10).floor();
            int recTier = (recovery / 10).floor();
            int discTier = (discipline / 10).floor();
            int intTier = (intellect / 10).floor();
            int strTier = (strength / 10).floor();
            int baseTier =
                mobiTier + resTier + recTier + discTier + intTier + strTier;
            Stats stats = Stats(
                base: baseTier,
                max: baseTier + 9,
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

    return builds;
  }
}
