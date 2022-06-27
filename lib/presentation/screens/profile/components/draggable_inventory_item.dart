import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';

class DraggableInventoryItem extends StatelessWidget {
  final DestinyItemComponent item;
  final double size;
  const DraggableInventoryItem({
    required this.item,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<DestinyItemComponent>(
      // Data is the value this Draggable stores.
      data: item,
      feedback: ItemIcon(
        displayHash: item.overrideStyleItemHash ?? item.itemHash!,
        imageSize: size,
        isMasterworked: item.state == ItemState.Masterwork ||
            item.state == const ItemState(5),
        element: Provider.of<ItemProvider>(context).getItemElement(item),
        powerLevel: Provider.of<ItemProvider>(context)
            .getItemPowerLevel(item.itemInstanceId!),
      ),
      childWhenDragging: const SizedBox(),
      child: ItemIcon(
        displayHash: item.overrideStyleItemHash ?? item.itemHash!,
        imageSize: size,
        isMasterworked: item.state == ItemState.Masterwork ||
            item.state == const ItemState(5),
        element: Provider.of<ItemProvider>(context).getItemElement(item),
        powerLevel: Provider.of<ItemProvider>(context)
            .getItemPowerLevel(item.itemInstanceId!),
      ),
    );
  }
}
