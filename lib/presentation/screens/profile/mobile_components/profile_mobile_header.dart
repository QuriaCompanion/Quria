import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/inspectSubclassHelper.model.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'dart:math' as math;
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/talent_grid_mobile_view.dart';
import 'package:quria/presentation/screens/profile/components/character_stats_listing.dart';
import 'package:quria/presentation/var/routes.dart';

class ProfileMobileHeader extends StatelessWidget {
  final String characterId;
  final String characterSuper;
  final String subclassId;
  final Map<String, int>? stats;
  final bool isNewSubclass;
  final double width;
  final DestinyItemComponent subclass;
  const ProfileMobileHeader({
    required this.stats,
    required this.characterId,
    required this.characterSuper,
    required this.subclassId,
    required this.isNewSubclass,
    required this.width,
    required this.subclass,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: globalPadding(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width: globalPadding(context)),
          InkWell(
            onTap: () {
              if (vw(context) == width) {
                Navigator.of(context).pushNamed(
                  routeInspectSubclass,
                  arguments: InspectSubclassHelper(
                      isNewSubclass: isNewSubclass, subclassId: subclassId, characterId: characterId),
                );
                return;
              }
              showDialog(
                context: context,
                builder: (context) {
                  SocketsHelper sockets = DisplayService.getSubclassMods(context, subclassId);
                  if (isNewSubclass) {
                    return desktopSubclassModal(
                      context,
                      child: SubclassModsMobileView(
                        width: vw(context) * 0.4,
                        displayedSockets: sockets.displayedSockets,
                        subclass: ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]!,
                        onChange: (mods, i) async {
                          await BungieApiService()
                              .insertSocketPlugFree(
                            subclassId,
                            mods[i].hash!,
                            i,
                            characterId,
                          )
                              .then(
                            (value) {
                              Provider.of<ItemProvider>(context).setNewSockets(
                                subclassId,
                                value?.response?.item?.sockets?.data?.sockets ?? [],
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: textBodyMedium(
                                    AppLocalizations.of(context)!.item_equipped,
                                    utf8: false,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            onError: (_) {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(child: SizedBox(width: vw(context) * 0.4, child: const ErrorDialog()));
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                  DestinyItemTalentGridComponent talentGridComponent =
                      Provider.of<ItemProvider>(context).getTalentGrid(subclassId)!;
                  DestinyItemComponent itemComponent =
                      Provider.of<InventoryProvider>(context).getItemByInstanceId(subclassId)!;
                  DestinyInventoryItemDefinition definition =
                      ManifestService.manifestParsed.destinyInventoryItemDefinition[itemComponent.itemHash]!;
                  return desktopRegularModal(context,
                      child: Container(
                        color: black,
                        child: TalentGridMobileView(
                          width: vw(context) * .4,
                          talentGrid: ManifestService
                              .manifestParsed.destinyTalentGridDefinition[talentGridComponent.talentGridHash]!,
                          talentGridComponent: talentGridComponent,
                          subclass: definition,
                        ),
                      ));
                },
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: -math.pi / 4,
                  child: Container(
                    height: width * 0.15,
                    width: width * 0.15,
                    decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                  ),
                ),
                ExtendedImage.network(
                  DestinyData.bungieLink + characterSuper,
                  height: width * 0.17,
                  width: width * 0.17,
                  timeLimit: const Duration(seconds: 10),
                  cache: true,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  printError: false,
                ),
              ],
            ),
          ),
          SizedBox(width: globalPadding(context)),
          SizedBox(
            height: width * 0.17,
            child: CharacterStatsListing(
              stats: stats!,
              characterId: characterId,
              direction: Axis.horizontal,
              width: vw(context) < 1000 ? width * 0.6 : 300,
            ),
          ),
        ],
      ),
    );
  }
}
