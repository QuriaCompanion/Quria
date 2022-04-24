import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/screens/inspect/components/column_perk_display.dart';

class PerkList extends StatelessWidget {
  const PerkList({
    Key? key,
    required this.selectedPerks,
    required this.item,
  }) : super(key: key);

  final InspectHelper selectedPerks;
  final DestinyInventoryItemDefinition item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (item.sockets?.socketEntries != null)
          for (int index = 0;
              index < item.sockets!.socketEntries!.length;
              index++)
            if (Conditions.perkSockets(
                item.sockets!.socketEntries![index].singleInitialItemHash))
              Padding(
                padding: EdgeInsets.only(
                    right: index != 5 ? globalPadding(context) : 0),
                child: ColumnPerkDisplay(
                  item: item,
                  index: index,
                  selectedPerks: selectedPerks,
                ),
              )
      ]),
    );
  }
}
