import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_presentation_node_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';

import '../../data/services/manifest/manifest.service.dart';

class HeaderWeaponDetails extends StatelessWidget {
  final int powerLevel;
  final DestinyItemComponent item;
  // style
  final double width;
  final double height;
  final double childPadding;
  final double iconSize = 50;
  final double fontSize;

  final fontColor = const TextStyle(color: Colors.white);

  const HeaderWeaponDetails(
      {Key? key,
      required this.powerLevel,
      required this.item,

      // style
      required this.childPadding,
      required this.fontSize,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinyPresentationNodeDefinition? typeOfAmmo = DestinyData.ammoInfoByType[
        ManifestService
            .manifestParsed
            .destinyInventoryItemDefinition![item.itemHash]!
            .equippingBlock
            ?.ammoType];
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition?[item.itemHash]
                              ?.defaultDamageTypeHash !=
                          null)
                        Image(
                          image: NetworkImage(DestinyData.bungieLink +
                              ManifestService
                                  .manifestParsed
                                  .destinyDamageTypeDefinition![ManifestService
                                      .manifestParsed
                                      .destinyInventoryItemDefinition![
                                          item.itemHash]!
                                      .defaultDamageTypeHash]!
                                  .displayProperties!
                                  .icon!),
                          width: iconSize,
                          height: iconSize,
                        ),
                      SizedBox(width: childPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            utf8.decode(ManifestService
                                .manifestParsed
                                .destinyInventoryItemDefinition![item.itemHash]!
                                .displayProperties!
                                .name!
                                .runes
                                .toList()),
                            style: TextStyle(
                                color: Colors.white, fontSize: fontSize + 5),
                          ),
                          Text(
                            utf8.decode(ManifestService
                                .manifestParsed
                                .destinyInventoryItemDefinition![item.itemHash]!
                                .itemTypeDisplayName!
                                .runes
                                .toList()),
                            style: TextStyle(
                                color: Colors.white, fontSize: fontSize - 5),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '$powerLevel',
                    style:
                        TextStyle(color: Colors.yellow, fontSize: fontSize + 5),
                  ),
                  Image(
                    image: NetworkImage(DestinyData.bungieLink +
                        ManifestService
                            .manifestParsed
                            .destinyStatDefinition![StatsHash.power]!
                            .displayProperties!
                            .icon!),
                    width: fontSize + 5,
                    color: Colors.yellow,
                  ),
                ],
              )
            ],
          ),
          if (typeOfAmmo != null)
            Row(
              children: [
                Image(
                  image: NetworkImage(DestinyData.bungieLink +
                      typeOfAmmo.displayProperties!.icon!),
                  width: iconSize,
                  height: iconSize,
                ),
                SizedBox(width: childPadding),
                Text(
                  utf8.decode(
                      typeOfAmmo.displayProperties!.name!.runes.toList()),
                  style: TextStyle(color: Colors.white, fontSize: fontSize),
                )
              ],
            ),
        ],
      ),
    );
  }
}
