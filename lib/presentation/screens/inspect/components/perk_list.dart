import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/presentation/screens/inspect/components/column_perk_display.dart';

class PerkList extends StatelessWidget {
  const PerkList({
    Key? key,
    required this.selectedPerks,
    required this.item,
    required this.iconSize,
    required this.padding,
  }) : super(key: key);

  final InspectHelper selectedPerks;
  final DestinyInventoryItemDefinition item;
  final double iconSize;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        for (int index = 1; index <= 4; index++)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: ColumnPerkDisplay(
                item: item,
                index: index,
                padding: padding,
                selectedPerks: selectedPerks,
                iconSize: iconSize),
          )
      ]),
    );
  }
}
