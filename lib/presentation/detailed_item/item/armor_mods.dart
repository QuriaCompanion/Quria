import 'dart:developer';

import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ArmorMods extends StatelessWidget {
  final List<DestinyItemSocketState> sockets;
  final String afinityIcon;
  const ArmorMods({required this.afinityIcon, required this.sockets, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<int, DestinyItemSocketState> displayedSockets = sockets
        .where((element) =>
            (element.isVisible!) &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.plug
                    ?.plugCategoryHash !=
                2973005342 &&
            !ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition![element.plugHash]!
                .plug!
                .plugCategoryIdentifier!
                .contains('masterworks.stat') &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemType !=
                DestinyItemType.Armor)
        .toList()
        .asMap();
    return mobileSection(context, title: "Mods", children: [
      ArmorAfinity(
          afinityIcon: afinityIcon,
          afinity: sockets.firstWhere((element) =>
              ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition![element.plugHash]
                  ?.plug
                  ?.plugCategoryIdentifier
                  ?.contains('masterworks.stat') ==
              true)),
      SizedBox(height: globalPadding(context)),
      Container(
          padding:
              EdgeInsets.symmetric(vertical: globalPadding(context)) * 0.875,
          decoration: const BoxDecoration(
              color: blackLight,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: double.infinity,
          child: Center(
            child: textCaption('Taper pour Ã©quiper un autre mod'),
          )),
      SizedBox(height: globalPadding(context)),
      Row(
        children: [
          for (MapEntry<int, DestinyItemSocketState> socket
              in displayedSockets.entries)
            Padding(
              padding: socket.key + 1 != displayedSockets.length
                  ? EdgeInsets.only(right: globalPadding(context))
                  : EdgeInsets.zero,
              child: Image(
                width: mobileItemSize(context),
                height: mobileItemSize(context),
                image: NetworkImage(DestinyData.bungieLink +
                    ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition![
                            socket.value.plugHash!]!
                        .displayProperties!
                        .icon!),
              ),
            )
        ],
      )
    ]);
  }
}

class ArmorAfinity extends StatelessWidget {
  final String afinityIcon;
  final DestinyItemSocketState afinity;
  const ArmorAfinity({
    required this.afinityIcon,
    required this.afinity,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DestinyInventoryItemDefinition afinityDef = ManifestService
        .manifestParsed.destinyInventoryItemDefinition![afinity.plugHash!]!;
    inspect(afinityDef);
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: mobileItemSize(context),
            decoration: const BoxDecoration(
                color: solar,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                          width: 18,
                          height: 18,
                          image: NetworkImage(
                              DestinyData.bungieLink + afinityIcon)),
                      SizedBox(
                          width: (MediaQuery.of(context).size.width -
                                  (globalPadding(context) * 2)) *
                              0.005),
                      textH2(afinityDef.investmentStats![0].value.toString()),
                    ],
                  ),
                  textBodyRegular('InutilisÃ©: ' +
                      (10 - afinityDef.investmentStats![0].value!).toString()),
                ],
              ),
            )),
        SizedBox(
            height: (MediaQuery.of(context).size.width -
                    (globalPadding(context) * 2)) *
                0.005),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: mobileItemSize(context) / 3,
              width: (MediaQuery.of(context).size.width -
                      (globalPadding(context) * 2)) /
                  10.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
              ),
            ),
            for (int i = 2; i < 10; i++)
              Container(
                height: mobileItemSize(context) / 3,
                width: (MediaQuery.of(context).size.width -
                        (globalPadding(context) * 2)) /
                    10.5,
                decoration: BoxDecoration(
                  color: afinityDef.investmentStats![0].value! >= i
                      ? Colors.white
                      : greyLight,
                ),
              ),
            Container(
              height: mobileItemSize(context) / 3,
              width: (MediaQuery.of(context).size.width -
                      (globalPadding(context) * 2)) /
                  10.5,
              decoration: BoxDecoration(
                color: afinityDef.investmentStats![0].value! == 10
                    ? Colors.white
                    : greyLight,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(8)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
