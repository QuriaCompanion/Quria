import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/profile/components/character_stats_listing.dart';

class BuilderResultsMobileItem extends StatelessWidget {
  final Build buildResult;
  final String characterId;
  const BuilderResultsMobileItem(
      {required this.buildResult, required this.characterId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, int> finalStats = {
      StatsStringHash.mobility: 0,
      StatsStringHash.resilience: 0,
      StatsStringHash.recovery: 0,
      StatsStringHash.discipline: 0,
      StatsStringHash.strength: 0,
    };
    for (var stats in buildResult.stats.statistics.entries) {
      finalStats[stats.key.toString()] = stats.value;
    }
    return Container(
      decoration: BoxDecoration(
        color: blackLight,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(globalPadding(context)),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textH3("Base: T${buildResult.stats.base}"),
                    textH3("Final: T${buildResult.stats.max}"),
                  ],
                ),
                CharacterStatsListing(
                    stats: finalStats,
                    characterId: characterId,
                    width: vw(context) * 0.5,
                    direction: Axis.horizontal),
              ],
            ),
          ),
          Divider(
            color: grey,
            height: globalPadding(context) * 2,
          ),
          Row(
            children: [
              for (Armor armor in buildResult.equipement)
                Padding(
                  padding: EdgeInsets.only(right: globalPadding(context)),
                  child: ItemIcon(
                    displayHash: armor.hash,
                    imageSize: mobileItemSize(context),
                  ),
                ),
            ],
          ),
          Divider(
            color: grey,
            height: globalPadding(context) * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                text: textBodyMedium('Equiper', color: black),
                onPressed: () {},
                width: vw(context) * 0.4,
              ),
              RoundedButton(
                text: textBodyMedium('Enregistrer', color: Colors.white),
                onPressed: () {},
                textColor: Colors.white,
                buttonColor: grey,
                width: vw(context) * 0.4,
              )
            ],
          ),
        ],
      ),
    );
  }
}
