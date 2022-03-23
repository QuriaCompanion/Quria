import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class PerkItemDisplay extends StatelessWidget {
  final DestinyInventoryItemDefinition perk;
  final double iconSize;
  final bool selected;
  const PerkItemDisplay(
      {required this.perk,
      required this.iconSize,
      this.selected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = iconSize / 2;
    return CircleAvatar(
      radius: radius,
      backgroundColor: grey,
      child: CircleAvatar(
        backgroundColor: Color(0xFF24262A),
        radius: radius * 0.95,
        child: CircleAvatar(
          radius: radius * 0.8,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: radius * 0.75,
            backgroundColor: selected ? blueEquipped : Color(0xFF505155),
            child: Image(
                width: iconSize * 0.5,
                image: NetworkImage(
                  DestinyData.bungieLink + perk.displayProperties!.icon!,
                )),
          ),
        ),
      ),
    );
  }
}
