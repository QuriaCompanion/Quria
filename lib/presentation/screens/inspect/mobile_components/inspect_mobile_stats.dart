import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/stat_no_bar.dart';
import 'package:quria/presentation/components/detailed_item/item/stat_progress_bar.dart';

class InspectMobileStats extends StatelessWidget {
  final double width;
  const InspectMobileStats({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinyInventoryItemDefinition itemDef = Provider.of<InspectProvider>(context).itemDef!;
    Map<String, DestinyStat> stats = Provider.of<InspectProvider>(context).getItemStats(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int statHash in DestinyData.linearStatBySubType[itemDef.itemSubType]!)
          StatProgressBar(
            width: width,
            name: ManifestService.manifestParsed.destinyStatDefinition[statHash]!.displayProperties!.name ?? 'error',
            value: stats[statHash.toString()]?.value ?? itemDef.stats?.stats?[statHash.toString()]?.value ?? 0,
            type: itemDef.itemType,
          ),
        Builder(builder: (context) {
          List<String> unusedStats = [];
          unusedStats.addAll(stats.keys.where(
              (statHash) => !DestinyData.linearStatBySubType[itemDef.itemSubType]!.contains(int.parse(statHash))));

          // else {
          //   unusedStats.addAll(item.stats!.stats!.keys.where((statHash) =>
          //       !DestinyData.linearStatBySubType[item.itemSubType]!
          //           .contains(int.parse(statHash))));
          // }
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
