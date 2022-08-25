import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/armor_mod_modal_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/mobile_components/subclass_mods_mobile_items.dart';
import 'package:quria/presentation/screens/inspect/components/armor_mod_desktop_modal.dart';
import 'package:quria/presentation/screens/inspect/components/armor_mod_modal.dart';

class SubclassModsBuildView extends ConsumerWidget {
  final List<int> sockets;
  final DestinyInventoryItemDefinition subclass;
  final double width;
  const SubclassModsBuildView({Key? key, required this.sockets, required this.subclass, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DestinyInventoryItemDefinition> displayedSockets =
        sockets.map((e) => ManifestService.manifestParsed.destinyInventoryItemDefinition[e]!).toList();
    return Container(
        color: black,
        child: Column(
          children: [
            mobileHeader(
              context,
              image: CachedNetworkImageProvider(
                  '${DestinyData.bungieLink}${subclass.screenshot!}?t={${BungieApiService.randomUserInt}}12345456'),
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textH1(
                    subclass.displayProperties?.name ?? "error",
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: globalPadding(context),
              ),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: globalPadding(context)),
                      decoration:
                          const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
                      width: double.infinity,
                      child: Center(
                        child: textCaption(
                          AppLocalizations.of(context)!.builder_subclass_mods_caption,
                          utf8: false,
                        ),
                      )),
                  for (int i = 0; i <= 4; i++)
                    mobileSectionInverted(context,
                        title: displayedSockets[i].itemTypeDisplayName ?? "error",
                        child: SubclassMobileItems(
                          width: width,
                          item: displayedSockets[i],
                          onSocketChange: (newSocket) {},
                        )),
                  mobileSectionInverted(
                    context,
                    title: displayedSockets[5].itemTypeDisplayName ?? "Aspects",
                    child: Column(
                      children: [
                        SubclassMobileItems(
                          width: width,
                          item: displayedSockets[5],
                          onSocketChange: (newSocket) {},
                        ),
                        SizedBox(
                          height: globalPadding(context) / 2,
                        ),
                        SubclassMobileItems(width: width, item: displayedSockets[6], onSocketChange: (newSocket) {}),
                      ],
                    ),
                  ),
                  mobileSectionInverted(context,
                      title: displayedSockets[7].itemTypeDisplayName ?? "Fragments",
                      child: Row(
                        children: [
                          for (int i = 0; i < displayedSockets.length - 7; i++)
                            Padding(
                              padding: i != 4 ? EdgeInsets.only(right: globalPadding(context)) : EdgeInsets.zero,
                              child: InkWell(
                                onTap: () {
                                  if (width == vw(context)) {
                                    showMaterialModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        expand: true,
                                        context: context,
                                        builder: (context) {
                                          return ArmorModsModal(
                                            width: width,
                                            socket: displayedSockets[7 + i],
                                            plugSetsHash: subclass.sockets!.socketEntries![7 + i].reusablePlugSetHash!,
                                            onSocketChange: (itemHash) {},
                                          );
                                        });
                                    return;
                                  }
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        ref
                                            .read(armorModModalProvider.notifier)
                                            .update((state) => state = displayedSockets[7 + i]);
                                        return Center(
                                          child: SizedBox(
                                              width: vw(context) * 0.4,
                                              child: ArmorModDesktopModal(
                                                plugSetsHash:
                                                    subclass.sockets!.socketEntries![7 + i].reusablePlugSetHash!,
                                                onSocketChange: (itemHash) async {},
                                              )),
                                        );
                                      });
                                },
                                child: pictureBordered(
                                  image:
                                      '${DestinyData.bungieLink}${displayedSockets[7 + i].displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}12345456',
                                  size: width == vw(context) ? itemSize(context, width) : 80,
                                ),
                              ),
                            ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
