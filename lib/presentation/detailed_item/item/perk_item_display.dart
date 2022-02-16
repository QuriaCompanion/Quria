import 'dart:convert';

import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';

class PerkItemDisplay extends StatelessWidget {
  final DestinyInventoryItemDefinition perk;
  final double iconSize;
  const PerkItemDisplay({required this.perk, required this.iconSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: utf8.decode(perk.displayProperties!.name!.runes.toList()),
      child: CircleAvatar(
        radius: iconSize / 2,
        child: Image(
            image: NetworkImage(
          DestinyData.bungieLink + perk.displayProperties!.icon!,
        )),
      ),
    );
  }
}
