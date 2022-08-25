import 'package:bungie_api/enums/item_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/profile/components/character_stats_listing.dart';

class BuilderResultsMobileItem extends ConsumerWidget {
  final Build buildResult;
  const BuilderResultsMobileItem({required this.buildResult, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        borderRadius: BorderRadius.circular(4),
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
                    characterId: ref.watch(charactersProvider).first.characterId!,
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
                    isMasterworked:
                        ref.watch(itemByInstanceIdProvider(buildResult.equipement[i].itemInstanceId))?.state ==
                                const ItemState(5) ||
                            ref.watch(itemByInstanceIdProvider(buildResult.equipement[i].itemInstanceId))?.state ==
                                ItemState.Masterwork,
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
                text: textBodyMedium(AppLocalizations.of(context)!.equip, utf8: false, color: black),
                onPressed: () {
                  showMaterialModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      expand: false,
                      builder: (context) {
                        return LoadingModal(
                          text1: AppLocalizations.of(context)!.equipping,
                          text2: AppLocalizations.of(context)!.please_wait,
                        );
                      });
                  final items = BuilderService().changeBuildToListOfItems(ref, data: buildResult);
                  BungieActionsService()
                      .equipStoredBuild(ref, items: items)
                      .then((_) => Navigator.pop(context))
                      .then((value) => Navigator.pop(context));
                },
                width: vw(context) * 0.4,
              ),
              RoundedButton(
                text: textBodyMedium(AppLocalizations.of(context)!.save, color: Colors.white),
                onPressed: () {
                  BuilderService().redirectToBuildSaving(context, ref, data: buildResult);
                },
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
