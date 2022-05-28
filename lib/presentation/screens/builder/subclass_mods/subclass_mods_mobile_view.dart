import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:collection/collection.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/mobile_components/subclass_mods_mobile_items.dart';
import 'package:quria/presentation/screens/inspect/components/armor_mod_modal.dart';

class SubclassModsMobileView extends StatefulWidget {
  final List<DestinyItemSocketState>? sockets;
  final DestinyInventoryItemDefinition subclass;
  final Future<void> Function(List<DestinyInventoryItemDefinition>, int)
      onChange;
  const SubclassModsMobileView(
      {required this.sockets,
      required this.subclass,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  State<SubclassModsMobileView> createState() => _SubclassModsMobileViewState();
}

class _SubclassModsMobileViewState extends State<SubclassModsMobileView> {
  late final List<DestinyInventoryItemDefinition> displayedSockets;
  @override
  void initState() {
    super.initState();

    displayedSockets = widget.sockets!
        .map((e) => ManifestService
            .manifestParsed.destinyInventoryItemDefinition[e.plugHash]!)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    int aspectOne = 0;
    int aspectTwo = 0;
    if (displayedSockets.isNotEmpty) {
      aspectOne =
          displayedSockets[5].investmentStats?.firstWhereIndexedOrNull((i, _) {
                return i == 0;
              })?.value ??
              0;
      aspectTwo =
          displayedSockets[6].investmentStats?.firstWhereIndexedOrNull((i, _) {
                return i == 0;
              })?.value ??
              0;
    }
    return Column(
      children: [
        mobileHeader(context,
            image: NetworkImage(
                DestinyData.bungieLink + widget.subclass.screenshot!),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textH1(
                  AppLocalizations.of(context)!.builder_subclass_mods_title,
                  utf8: false,
                ),
                textBodyRegular(
                  AppLocalizations.of(context)!.builder_subclass_mods_subtitle,
                  utf8: false,
                ),
              ],
            )),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: globalPadding(context),
          ),
          child: Column(
            children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: globalPadding(context)),
                  decoration: const BoxDecoration(
                      color: blackLight,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: double.infinity,
                  child: Center(
                    child: textCaption(
                      AppLocalizations.of(context)!
                          .builder_subclass_mods_caption,
                      utf8: false,
                    ),
                  )),
              for (int i = 0; i <= 4; i++)
                mobileSectionInverted(context,
                    title: displayedSockets[i].itemTypeDisplayName ?? "error",
                    child: SubclassMobileItems(
                        item: displayedSockets[i],
                        onSocketChange: (newSocket) {
                          if (!displayedSockets.contains(newSocket)) {
                            widget
                                .onChange(
                              displayedSockets
                                  .take(7 + aspectOne + aspectTwo)
                                  .toList(),
                              6,
                            )
                                .then((_) {
                              setState(() {
                                displayedSockets[i] = newSocket;
                              });
                            }, onError: (_) => null);
                          }
                        },
                        plugSetHash: widget.subclass.sockets!.socketEntries![i]
                            .reusablePlugSetHash)),
              mobileSectionInverted(context,
                  title: displayedSockets[5].itemTypeDisplayName ?? "Aspects",
                  child: Column(
                    children: [
                      SubclassMobileItems(
                          item: displayedSockets[5],
                          onSocketChange: (newSocket) {
                            if (!displayedSockets.contains(newSocket)) {
                              widget
                                  .onChange(
                                displayedSockets
                                    .take(7 + aspectOne + aspectTwo)
                                    .toList(),
                                5,
                              )
                                  .then((_) {
                                setState(() {
                                  displayedSockets[5] = newSocket;
                                });
                              }, onError: (_) => null);
                            }
                          },
                          plugSetHash: widget.subclass.sockets!
                              .socketEntries![5].reusablePlugSetHash!),
                      SizedBox(
                        height: globalPadding(context) / 2,
                      ),
                      SubclassMobileItems(
                          item: displayedSockets[6],
                          onSocketChange: (newSocket) {
                            if (!displayedSockets.contains(newSocket)) {
                              widget
                                  .onChange(
                                displayedSockets
                                    .take(7 + aspectOne + aspectTwo)
                                    .toList(),
                                6,
                              )
                                  .then((_) {
                                setState(() {
                                  displayedSockets[6] = newSocket;
                                });
                              }, onError: (_) => null);
                            }
                          },
                          plugSetHash: widget.subclass.sockets!
                              .socketEntries![6].reusablePlugSetHash!),
                    ],
                  )),
              mobileSectionInverted(context,
                  title: displayedSockets[7].itemTypeDisplayName ?? "Fragments",
                  child: Row(
                    children: [
                      for (int i = 0; i < aspectOne + aspectTwo; i++)
                        Padding(
                          padding: i != 4
                              ? EdgeInsets.only(right: globalPadding(context))
                              : EdgeInsets.zero,
                          child: InkWell(
                            onTap: () {
                              showMaterialModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  expand: true,
                                  context: context,
                                  builder: (context) {
                                    return ArmorModsModal(
                                      socket: displayedSockets[7 + i],
                                      plugSetsHash: widget
                                          .subclass
                                          .sockets!
                                          .socketEntries![7 + i]
                                          .reusablePlugSetHash!,
                                      onSocketChange: (itemHash) {
                                        if (!displayedSockets.contains(
                                            ManifestService.manifestParsed
                                                    .destinyInventoryItemDefinition[
                                                itemHash]!)) {
                                          widget
                                              .onChange(
                                            displayedSockets
                                                .take(7 + aspectOne + aspectTwo)
                                                .toList(),
                                            6,
                                          )
                                              .then((_) {
                                            setState(() {
                                              displayedSockets[
                                                  7 + i] = ManifestService
                                                      .manifestParsed
                                                      .destinyInventoryItemDefinition[
                                                  itemHash]!;
                                            });
                                          }, onError: (_) => null);
                                        }
                                      },
                                    );
                                  });
                            },
                            child: pictureBordered(
                              image: NetworkImage(DestinyData.bungieLink +
                                  displayedSockets[7 + i]
                                      .displayProperties!
                                      .icon!),
                              size: mobileItemSize(context),
                            ),
                          ),
                        ),
                    ],
                  )),
              SizedBox(
                height: globalPadding(context) * 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
