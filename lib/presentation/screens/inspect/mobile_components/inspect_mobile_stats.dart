import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/stat_no_bar.dart';
import 'package:quria/presentation/components/detailed_item/item/stat_progress_bar.dart';

class InspectMobileStats extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  final Map<String, DestinyStat>? stats;
  final double width;
  const InspectMobileStats({
    required this.item,
    this.stats,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int statHash in DestinyData.linearStatBySubType[item.itemSubType]!)
          StatProgressBar(
            width: width,
            name: ManifestService.manifestParsed.destinyStatDefinition[statHash]!.displayProperties!.name ?? 'error',
            value: stats?[statHash.toString()]?.value ?? item.stats?.stats?[statHash.toString()]?.value ?? 0,
            type: item.itemType,
          ),
        Builder(builder: (context) {
          List<String> unusedStats = [];
          if (stats != null) {
            unusedStats.addAll(stats!.keys.where(
                (statHash) => !DestinyData.linearStatBySubType[item.itemSubType]!.contains(int.parse(statHash))));
          }
          // else {
          //   unusedStats.addAll(item.stats!.stats!.keys.where((statHash) =>
          //       !DestinyData.linearStatBySubType[item.itemSubType]!
          //           .contains(int.parse(statHash))));
          // }
          int armorTotal = 0;
          if (item.itemType == DestinyItemType.Armor && stats != null) {
            for (int statHash in DestinyData.linearStatBySubType[item.itemSubType]!) {
              armorTotal += stats![statHash.toString()]!.value!;
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
                    value: stats?[statHash.toString()]?.value ?? item.stats?.stats?[statHash.toString()]?.value ?? 0,
                    type: item.itemType,
                  ),
                if (item.itemType == DestinyItemType.Armor)
                  StatNoBar(
                    width: width,
                    fontSize: 20,
                    name: 'Total',
                    value: armorTotal,
                    type: item.itemType,
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
