import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class WeaponDetailsHiddenStats extends StatelessWidget {
  final Color textColor;
  final int hash;
  final Map<String, DestinyStat>? stats;
  final double fontSize;
  final double padding;
  final double width;

  const WeaponDetailsHiddenStats(
      {Key? key,
      required this.hash,
      required this.stats,
      required this.fontSize,
      this.padding = 8,
      this.width = 800,
      this.textColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isBottomShown = ManifestService
            .manifestParsed
            .destinyInventoryItemDefinition?[hash]
            ?.stats
            ?.stats?[StatsStringHash.recoil]
            ?.value !=
        null;
    return Container(
      padding: EdgeInsets.only(top: padding / 2, bottom: padding / 2, right: 5),
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (stats?[StatsStringHash.mobility]?.value != null)
                Text(
                  'Total: ${stats![StatsStringHash.mobility]!.value! + stats![StatsStringHash.recovery]!.value! + stats![StatsStringHash.resilience]!.value! + stats![StatsStringHash.discipline]!.value! + stats![StatsStringHash.strength]!.value! + stats![StatsStringHash.intellect]!.value!}',
                  style: TextStyle(color: textColor, fontSize: fontSize),
                ),
              if (stats?[StatsStringHash.ammunition]?.value != null)
                Text(
                  'Munitions: ${stats![StatsStringHash.ammunition]?.value}',
                  style: TextStyle(color: textColor, fontSize: fontSize),
                ),
              if (stats?[StatsStringHash.rpm]?.value != null)
                Text(
                  'CPM: ${stats![StatsStringHash.rpm]?.value}',
                  style: TextStyle(color: textColor, fontSize: fontSize),
                ),
              if (stats?[StatsStringHash.chargeTime]?.value != null)
                Text(
                  'Temps de charge: ${stats![StatsStringHash.chargeTime]?.value}',
                  style: TextStyle(color: textColor, fontSize: fontSize),
                ),
              if (stats?[StatsStringHash.magazine]?.value != null)
                Text(
                  'Chargeur: ${stats![StatsStringHash.magazine]?.value}',
                  style: TextStyle(color: textColor, fontSize: fontSize),
                ),
            ],
          ),
          if (isBottomShown) SizedBox(height: padding),
          if (isBottomShown)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Zoom: ${ManifestService.manifestParsed.destinyInventoryItemDefinition?[hash]?.stats?.stats?[StatsStringHash.zoom]?.value}',
                  style: TextStyle(color: textColor, fontSize: fontSize),
                ),
                Text(
                  'Direction du recul: ${ManifestService.manifestParsed.destinyInventoryItemDefinition?[hash]?.stats?.stats?[StatsStringHash.recoil]?.value}',
                  style: TextStyle(color: textColor, fontSize: fontSize),
                )
              ],
            ),
        ],
      ),
    );
  }
}
