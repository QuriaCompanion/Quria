import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/detailed_item/item/armor_mod_icon_display.dart';

class ModDisplay extends StatelessWidget {
  final double padding;
  final double iconSize;
  final double width;
  final DestinyInventoryItemDefinition item;
  const ModDisplay({
    Key? key,
    required this.iconSize,
    required this.item,
    required this.width,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ArmorModIconDisplay(iconSize: iconSize, socket: item),
        SizedBox(width: padding),
        SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBodyRegular(item.displayProperties!.name!),
              textCaption(item.displayProperties!.description!,
                  color: greyLight),
            ],
          ),
        ),
      ],
    );
  }
}
