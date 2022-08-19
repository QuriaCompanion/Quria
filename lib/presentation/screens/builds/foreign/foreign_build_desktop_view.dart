import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:collection/collection.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/constants/web_widgets.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/modal_button.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_build_view.dart';
import 'package:quria/presentation/screens/builds/foreign/foreign_build_section.dart';
import 'package:quria/presentation/screens/profile/components/character_stats_listing.dart';
import 'package:quria/presentation/var/keys.dart';

class ForeignBuildDesktopView extends StatefulWidget {
  final BuildStored foreignBuild;
  const ForeignBuildDesktopView({
    required this.foreignBuild,
    Key? key,
  }) : super(key: key);

  @override
  State<ForeignBuildDesktopView> createState() => _ForeignBuildDesktopViewState();
}

class _ForeignBuildDesktopViewState extends State<ForeignBuildDesktopView> {
  DestinyInventoryItemDefinition? subclassDef;
  DestinyItemComponent? subclassComponent;
  Item? subclassItem;
  @override
  void initState() {
    super.initState();
    subclassItem = widget.foreignBuild.items
        .firstWhereOrNull((item) => item.isEquipped && item.bucketHash == InventoryBucket.subclass);
    subclassDef = ManifestService.manifestParsed.destinyInventoryItemDefinition[subclassItem?.itemHash];
    subclassComponent =
        Provider.of<InventoryProvider>(context, listen: false).getItemByInstanceId(subclassItem?.instanceId ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        webHeader(
          context,
          image: subclassDef?.screenshot != null
              ? NetworkImage('${DestinyData.bungieLink}${subclassDef!.screenshot!}?t=123456')
              : ghostBuild,
          child: textDesktopTitle(
            widget.foreignBuild.name,
            utf8: false,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(globalPadding(context)),
              child: SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(globalPadding(context)),
                      width: 400,
                      decoration: BoxDecoration(
                        color: blackLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(children: [
                        if (subclassDef != null)
                          InkWell(
                            onTap: () {
                              if (subclassItem!.mods.isNotEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return desktopRegularModal(
                                        context,
                                        child: SubclassModsBuildView(
                                          width: modalWidth(context),
                                          sockets: subclassItem!.mods,
                                          subclass: subclassDef!,
                                        ),
                                      );
                                    });
                                return;
                              }
                              ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                                content: textBodyMedium(
                                  AppLocalizations.of(context)!.build_no_mods,
                                  utf8: false,
                                  color: Colors.white,
                                ),
                                backgroundColor: crucible,
                              ));
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.rotate(
                                  angle: -math.pi / 4,
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                                  ),
                                ),
                                ExtendedImage.network(
                                  '${DestinyData.bungieLink}${subclassDef!.displayProperties!.icon!}?t=123456',
                                  height: 75,
                                  width: 75,
                                  timeLimit: const Duration(seconds: 10),
                                  cache: true,
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill,
                                  printError: false,
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: globalPadding(context),
                        ),
                        CharacterStatsListing(
                          stats: BuilderService().buildStatCalculator(context, items: widget.foreignBuild.items),
                          characterId: Provider.of<CharactersProvider>(context).currentCharacter!.characterId!,
                          direction: Axis.horizontal,
                          width: 300,
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: globalPadding(context),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ModalButton(
                          text: AppLocalizations.of(context)!.save,
                          callback: () {
                            if (widget.foreignBuild.preset != null) {
                              BuilderService().useForeignBuild(context, widget.foreignBuild);
                              return;
                            }
                            ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                              content: textBodyMedium(
                                AppLocalizations.of(context)!.build_no_mods,
                                utf8: false,
                                color: Colors.white,
                              ),
                              backgroundColor: crucible,
                            ));
                          },
                          width: 50,
                          icon: 'assets/icons/saveDesktop.svg',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(globalPadding(context)),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    for (final bucket in InventoryBucket.loadoutNoSubclass)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textH3(
                              ManifestService
                                  .manifestParsed.destinyInventoryBucketDefinition[bucket]!.displayProperties!.name!,
                            ),
                            const SizedBox(height: 16),
                            ForeignBuildSection(
                              item:
                                  widget.foreignBuild.items.firstWhereOrNull((element) => element.bucketHash == bucket),
                              width: 400,
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
