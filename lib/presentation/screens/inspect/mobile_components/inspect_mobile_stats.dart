import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/stat_no_bar.dart';
import 'package:quria/presentation/components/detailed_item/item/stat_progress_bar.dart';

class InspectMobileStats extends ConsumerWidget {
  final double width;
  final Map<int, int>? bonusStats;
  const InspectMobileStats({
    required this.width,
    this.bonusStats,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DestinyInventoryItemDefinition itemDef = ref.watch(inspectProvider.select((value) => value?.itemDef))!;
    String? instanceId = ref.watch(inspectProvider.select((value) => value?.item?.itemInstanceId));

    Map<String, DestinyStat> stats = ref.watch(itemPrecalculatedStatsProvider(instanceId));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int statHash in DestinyData.linearStatBySubType[itemDef.itemSubType]!)
          Builder(builder: (context) {
            int baseStats = stats[statHash.toString()]?.value ?? itemDef.stats?.stats?[statHash.toString()]?.value ?? 0;
            int bonusStatInt = bonusStats?.containsKey(statHash) ?? false ? bonusStats![statHash]! : 0;
            return StatProgressBar(
              width: width,
              name: ManifestService.manifestParsed.destinyStatDefinition[statHash]!.displayProperties!.name ?? 'error',
              value: baseStats,
              bonus: bonusStatInt + baseStats,
              type: itemDef.itemType,
            );
          }),
        Builder(builder: (context) {
          List<String> unusedStats = [];
          unusedStats.addAll(stats.keys.where(
              (statHash) => !DestinyData.linearStatBySubType[itemDef.itemSubType]!.contains(int.parse(statHash))));

          int armorTotal = 0;
          if (itemDef.itemType == DestinyItemType.Armor) {
            for (int statHash in DestinyData.linearStatBySubType[itemDef.itemSubType]!) {
              armorTotal += stats[statHash.toString()]!.value!;
            }

            return Column(
              children: [
                for (String statHash in unusedStats)
                  StatNoBar(
                    width: width,
                    fontSize: 20,
                    name: ManifestService
                            .manifestParsed.destinyStatDefinition[int.parse(statHash)]?.displayProperties?.name ??
                        'error',
                    value: stats[statHash.toString()]?.value ?? itemDef.stats?.stats?[statHash.toString()]?.value ?? 0,
                    type: itemDef.itemType,
                  ),
                if (itemDef.itemType == DestinyItemType.Armor)
                  StatNoBar(
                    width: width,
                    fontSize: 20,
                    name: 'Total',
                    value: armorTotal,
                    type: itemDef.itemType,
                  )
              ],
            );
          }
          return Container();
        })
      ],
    );
  }
}
