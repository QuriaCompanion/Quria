import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_mod_icon_display.dart';

class ModWithTypeName extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  final double iconSize;
  const ModWithTypeName({required this.item, this.iconSize = 16, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ArmorModIconDisplay(iconSize: iconSize, socket: item),
        SizedBox(width: globalPadding(context)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBodyRegular(item.displayProperties!.name!),
              textCaption(item.itemTypeDisplayName!, color: greyLight),
            ],
          ),
        ),
      ],
    );
  }
}
