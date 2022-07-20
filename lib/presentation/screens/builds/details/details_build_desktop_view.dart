import 'dart:math' as math;
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/constants/web_widgets.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/providers/details_build_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/modal_button.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
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
  DestinyItemComponent? _subclass;
  @override
  void initState() {
    super.initState();
    _build = Provider.of<DetailsBuildProvider>(context, listen: false).buildStored!;
    final Item? subclassItem =
        Provider.of<DetailsBuildProvider>(context, listen: false).getEquippedItemByBucket(InventoryBucket.subclass);
    if (subclassItem != null) {
      _subclass = Provider.of<InventoryProvider>(context, listen: false).getItemByInstanceId(subclassItem.instanceId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        webHeader(
          context,
          image: ManifestService.manifestParsed.destinyInventoryItemDefinition[_subclass?.itemHash]?.screenshot != null
              ? NetworkImage(DestinyData.bungieLink +
                  ManifestService.manifestParsed.destinyInventoryItemDefinition[_subclass!.itemHash]!.screenshot!)
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
                                    SocketsHelper sockets =
                                        DisplayService.getSubclassMods(context, _subclass!.itemInstanceId!);
                                    return desktopRegularModal(
                                      context,
                                      child: SubclassModsMobileView(
                                        width: vw(context) * 0.4,
                                        sockets: sockets.sockets,
                                        subclass: ManifestService
                                            .manifestParsed.destinyInventoryItemDefinition[_subclass!.itemHash]!,
                                        onChange: (mods, i) async {
                                          await BungieApiService()
                                              .insertSocketPlugFree(
                                            _subclass!.itemInstanceId!,
                                            mods[i].hash!,
                                            i,
                                            Provider.of<CharactersProvider>(context, listen: false)
                                                .currentCharacter
                                                ?.characterId,
                                          )
                                              .then((value) {
                                            Provider.of<ItemProvider>(context).setNewSockets(
                                              _subclass!.itemInstanceId!,
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
                                          }, onError: (_) {
                                            Navigator.pop(context);
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Center(
                                                    child:
                                                        SizedBox(width: vw(context) * 0.4, child: const ErrorDialog()),
                                                  );
                                                });
                                          });
                                        },
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
                                ExtendedImage.network(
                                  DestinyData.bungieLink +
                                      ManifestService
                                          .manifestParsed
                                          .destinyInventoryItemDefinition[_subclass!.itemHash]!
                                          .displayProperties!
                                          .icon!,
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
                          callback: () {
                            BungieActionsService().equipStoredBuild(context, items: _build.items);
                          },
                          width: 50,
                          icon: 'assets/icons/equipDesktop.svg',
                        ),
                        ModalButton(
                          callback: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const InProgressModal();
                                });
                          },
                          width: 50,
                          icon: 'assets/icons/shareDesktop.svg',
                        ),
                        ModalButton(
                          callback: () {
                            Provider.of<CreateBuildProvider>(context, listen: false).modifyBuild(_build);
                            Navigator.of(context).pushNamed(routeCreateBuild);
                          },
                          width: 50,
                          icon: 'assets/icons/saveDesktop.svg',
                        ),
                        ModalButton(
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
                  crossAxisAlignment: WrapCrossAlignment.center,
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
