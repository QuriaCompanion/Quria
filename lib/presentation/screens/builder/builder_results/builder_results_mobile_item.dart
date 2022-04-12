import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/profile/components/character_stats_listing.dart';

class BuilderResultsMobileItem extends StatelessWidget {
  final Build buildResult;
  final String characterId;
  final List<ModSlots> mods;
  final String? subclassId;
  final List<DestinyInventoryItemDefinition> subclassMods;
  const BuilderResultsMobileItem(
      {required this.buildResult,
      required this.mods,
      required this.characterId,
      required this.subclassMods,
      this.subclassId,
      Key? key})
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
              for (int i = 0; i < buildResult.equipement.length; i++)
                Padding(
                  padding: i != buildResult.equipement.length - 1
                      ? EdgeInsets.only(right: globalPadding(context))
                      : EdgeInsets.zero,
                  child: ItemIcon(
                    displayHash: buildResult.equipement[i].displayHash,
                    imageSize: (vw(context) - (globalPadding(context) * 8)) / 5,
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
                onPressed: () {
                  showMaterialModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      expand: false,
                      builder: (context) {
                        return const LoadingModal(
                          text1: "Nous equipons votre equipement.",
                          text2: "Cela peut prendre du temps ...",
                        );
                      });
                  BungieActionsService()
                      .equipBuild(
                        build: buildResult,
                        characterId: characterId,
                        mods: mods,
                        subclassMods: subclassMods,
                        subclassId: subclassId,
                      )
                      .then((value) => Navigator.pop(context));
                },
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
