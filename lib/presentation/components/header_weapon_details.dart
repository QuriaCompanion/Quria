import 'dart:convert';
import 'dart:developer';

import 'package:bungie_api/models/destiny_damage_type_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_presentation_node_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';

import '../../data/services/manifest/manifest.service.dart';

class HeaderWeaponDetails extends StatelessWidget {
  // final DestinyInventoryItemDefinition definition;
  // final DestinyItemComponent item;

  final int value;
  final String name;
  final DestinyPresentationNodeDefinition? typeOfAmmo;
  final DestinyDamageTypeDefinition type;
  // style
  final double width;
  final double height;
  final double iconSize = 10;

  final fontColor = const TextStyle(color: Colors.white);

  const HeaderWeaponDetails(
      {Key? key,
      required this.name,
      this.typeOfAmmo,
      required this.type,
      required this.value,

      // style
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(
                        image: NetworkImage(DestinyData.bungieLink +
                            type.displayProperties!.icon!),
                        width: iconSize,
                        height: iconSize,
                      ),
                      Text(
                        utf8.decode(name.runes.toList()),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                  Text(
                    utf8.decode(type.displayProperties!.name!.runes.toList()),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
              // const Spacer(),
              Container(
                child: Row(
                  children: [
                    Text(
                      '$value',
                      style:
                          const TextStyle(color: Colors.yellow, fontSize: 40),
                    ),
                    Image(
                      image: NetworkImage(DestinyData.bungieLink +
                          ManifestService
                              .manifestParsed
                              .destinyStatDefinition![StatsHash.power]!
                              .displayProperties!
                              .icon!),
                      color: Colors.yellow,
                    ),
                  ],
                ),
              )
            ],
          ),
          if (typeOfAmmo != null)
            Row(
              children: [
                Image(
                  image: NetworkImage(DestinyData.bungieLink +
                      typeOfAmmo!.displayProperties!.icon!),
                  width: iconSize,
                  height: iconSize,
                ),
                Text(
                  utf8.decode(
                      typeOfAmmo!.displayProperties!.name!.runes.toList()),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
        ],
      ),
    );
  }
}
