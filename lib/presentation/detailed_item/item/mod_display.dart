import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/detailed_item/item/armor_mod_icon_display.dart';

class ModDisplay extends StatelessWidget {
  const ModDisplay({
    Key? key,
    required this.iconSize,
    required this.item,
  }) : super(key: key);

  final double iconSize;
  final DestinyInventoryItemDefinition item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ArmorModIconDisplay(socket: item),
        SizedBox(width: globalPadding(context)),
        SizedBox(
          width: MediaQuery.of(context).size.width -
              (globalPadding(context) * 3) -
              iconSize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBodyRegular(item.displayProperties!.name!),
              textCaption(item.displayProperties!.description!),
            ],
          ),
        ),
      ],
    );
  }
}
