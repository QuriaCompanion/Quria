import 'package:flutter/material.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/presentation/components/statistic_display.dart';

class VerticalCharacterStatsListingWidget extends StatelessWidget {
  final ProfileHelper? data;
  final int characterIndex;
  final double fontSize;
  final double width;
  const VerticalCharacterStatsListingWidget({
    Key? key,
    required this.data,
    required this.characterIndex,
    this.fontSize = 30,
    this.width = 110,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < 6; i++)
          StatisticDisplay(
              value: data!.characters[characterIndex]
                  .stats![DestinyData.armorStats[i]]!,
              icon: DestinyData.statsIcon[i],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              width: width,
              fontsize: fontSize),
      ],
    );
  }
}