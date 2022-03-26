import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/detailed_item/item/mod_display.dart';

class MobileInspectExoticArmor extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  final double iconSize;
  const MobileInspectExoticArmor(
      {required this.item, this.iconSize = 15, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH2("Attribut exotique"),
        const Divider(
          color: blackLight,
          height: 15,
          thickness: 1,
        ),
        ModDisplay(iconSize: iconSize, item: item),
      ],
    );
  }
}
