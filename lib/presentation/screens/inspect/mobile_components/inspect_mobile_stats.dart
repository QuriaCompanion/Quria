import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/detailed_item/item/stat_progress_bar.dart';

class InspectMobileStats extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  final Map<String, DestinyStat>? stats;
  const InspectMobileStats({required this.item, required this.stats, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int statHash in DestinyData.linearStatBySubType[item.itemSubType]!)
          StatProgressBar(
              width: vw(context),
              fontSize: 20,
              name: ManifestService
                      .manifestParsed
                      .destinyStatDefinition![statHash]!
                      .displayProperties!
                      .name ??
                  'error',
              value: stats?[statHash.toString()]?.value ??
                  item.stats?.stats?[statHash.toString()]?.value ??
                  0,
              type: item.itemType),
      ],
    );
  }
}
