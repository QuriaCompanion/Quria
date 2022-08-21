import 'dart:math' as math;
import 'dart:math';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/constants/web_widgets.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/providers/details_build_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/modal_button.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_build_view.dart';
import 'package:quria/presentation/screens/builds/details/details_build_mobile_actions.dart';
import 'package:quria/presentation/screens/builds/details/details_build_section.dart';
import 'package:quria/presentation/screens/profile/components/character_stats_listing.dart';
import 'package:quria/presentation/var/keys.dart';
import 'package:quria/presentation/var/routes.dart';

class DetailsBuildDesktopView extends StatefulWidget {
  const DetailsBuildDesktopView({Key? key}) : super(key: key);

  @override
  State<DetailsBuildDesktopView> createState() => _DetailsBuildDesktopViewState();
}

class _DetailsBuildDesktopViewState extends State<DetailsBuildDesktopView> {
  late final BuildStored _build;
  late final Item? subclassItem;
  DestinyItemComponent? _subclass;
  @override
  void initState() {
    super.initState();
    _build = Provider.of<DetailsBuildProvider>(context, listen: false).buildStored!;
    subclassItem =
        Provider.of<DetailsBuildProvider>(context, listen: false).getEquippedItemByBucket(InventoryBucket.subclass);
    if (subclassItem != null) {
      _subclass = Provider.of<InventoryProvider>(context, listen: false).getItemByInstanceId(subclassItem!.instanceId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        webHeader(
          context,
          image: ManifestService.manifestParsed.destinyInventoryItemDefinition[_subclass?.itemHash]?.screenshot != null
              ? CachedNetworkImageProvider(
                  '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyInventoryItemDefinition[_subclass!.itemHash]!.screenshot!}?t={${Random().nextInt(100)}}123465')
              : ghostBuild,
          child: textDesktopTitle(
            _build.name,
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
                        if (_subclass != null)
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return desktopRegularModal(
                                      context,
                                      child: SubclassModsBuildView(
                                        width: modalWidth(context),
                                        sockets: subclassItem!.mods,
                                        subclass: ManifestService
                                            .manifestParsed.destinyInventoryItemDefinition[_subclass!.itemHash]!,
                                      ),
                                    );
                                  });
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
                                Image.network(
                                  '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyInventoryItemDefinition[_subclass!.itemHash]!.displayProperties!.icon!}?t={${Random().nextInt(100)}}123465',
                                  height: 75,
                                  width: 75,
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: globalPadding(context),
                        ),
                        CharacterStatsListing(
                          stats: BuilderService().buildStatCalculator(context, items: _build.items),
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
                          text: AppLocalizations.of(context)!.equip,
                          callback: () {
                            BungieActionsService().equipStoredBuild(context, items: _build.items);
                          },
                          width: 50,
                          icon: 'assets/icons/equipDesktop.svg',
                        ),
                        ModalButton(
                          text: AppLocalizations.of(context)!.share,
                          callback: () {
                            BuilderService().shareBuild(context, id: _build.id);
                          },
                          width: 50,
                          icon: 'assets/icons/shareDesktop.svg',
                        ),
                        ModalButton(
                          text: AppLocalizations.of(context)!.modify,
                          callback: () {
                            Provider.of<CreateBuildProvider>(context, listen: false).modifyBuild(_build);
                            Navigator.of(context).pushNamed(routeCreateBuild);
                          },
                          width: 50,
                          icon: 'assets/icons/saveDesktop.svg',
                        ),
                        ModalButton(
                          text: AppLocalizations.of(context)!.delete,
                          callback: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: DeleteConfirmation(
                                      text: AppLocalizations.of(context)!.build_delete_confirm,
                                      width: vw(context) * 0.4,
                                      onDelete: () async {
                                        try {
                                          await BuilderService().deleteBuild(_build.id).then((_) {
                                            ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                                              content: textBodyMedium(
                                                AppLocalizations.of(context)!.build_created_success,
                                                utf8: false,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Colors.green,
                                            ));
                                            Navigator.pushNamed(context, routeListBuilds);
                                          });
                                        } catch (e) {
                                          return showDialog(
                                              context: context, builder: (context) => const ErrorDialog());
                                        }
                                      },
                                    ),
                                  );
                                });
                          },
                          width: 50,
                          icon: 'assets/icons/trash.svg',
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
                            DetailsBuildSection(
                              bucketHash: bucket,
                              width: 600,
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
