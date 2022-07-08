import 'package:bungie_api/enums/item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/profile/components/character_stats_listing.dart';

class BuilderResultsDesktopItem extends StatelessWidget {
  final Build buildResult;
  const BuilderResultsDesktopItem({Key? key, required this.buildResult}) : super(key: key);

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
      width: 440,
      height: 253,
      decoration: BoxDecoration(
        color: blackLight,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 72,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textH3("Base: T${buildResult.stats.base}"),
                    textH3("Final: T${buildResult.stats.max}"),
                  ],
                ),
                CharacterStatsListing(
                    stats: finalStats,
                    characterId: Provider.of<CharactersProvider>(context).currentCharacter!.characterId!,
                    width: 220,
                    direction: Axis.horizontal),
              ],
            ),
          ),
          const Divider(color: grey, thickness: 1, height: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                for (int i = 0; i < buildResult.equipement.length; i++)
                  Padding(
                    padding: i != buildResult.equipement.length - 1 ? const EdgeInsets.only(right: 8) : EdgeInsets.zero,
                    child: ItemIcon(
                      displayHash: buildResult.equipement[i].displayHash,
                      imageSize: 62,
                      isMasterworked: Provider.of<InventoryProvider>(context)
                                  .getItemByInstanceId(buildResult.equipement[i].itemInstanceId)
                                  ?.state ==
                              const ItemState(5) ||
                          Provider.of<InventoryProvider>(context)
                                  .getItemByInstanceId(buildResult.equipement[i].itemInstanceId)
                                  ?.state ==
                              ItemState.Masterwork,
                      powerLevel: Provider.of<ItemProvider>(context)
                          .getItemPowerLevel(buildResult.equipement[i].itemInstanceId),
                      element: Provider.of<ItemProvider>(context).getItemElement(Provider.of<InventoryProvider>(context)
                          .getItemByInstanceId(buildResult.equipement[i].itemInstanceId)!),
                    ),
                  ),
              ],
            ),
          ),
          const Divider(color: grey, thickness: 1, height: 0),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                text: textBodyMedium(AppLocalizations.of(context)!.equip, utf8: false, color: black),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: LoadingModal(
                            text1: AppLocalizations.of(context)!.equipping,
                            text2: AppLocalizations.of(context)!.please_wait,
                          ),
                        );
                      });
                  BungieActionsService()
                      .equipBuild(
                        context,
                        build: buildResult,
                        characterId:
                            Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!,
                        mods: Provider.of<BuilderModsProvider>(context, listen: false).mods,
                        subclassMods: Provider.of<BuilderSubclassModsProvider>(context, listen: false).subclassMods,
                        subclassId: Provider.of<BuilderSubclassProvider>(context, listen: false).subclassId,
                      )
                      .then((value) => Navigator.pop(context));
                },
                width: 185,
              ),
              RoundedButton(
                text: textBodyMedium(AppLocalizations.of(context)!.save, color: Colors.white),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(child: InProgressModal());
                      });
                },
                textColor: Colors.white,
                buttonColor: grey,
                width: 185,
              )
            ],
          ),
        ],
      ),
    );
  }
}
