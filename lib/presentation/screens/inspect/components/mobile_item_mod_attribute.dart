import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class MobileItemModAttribute extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  const MobileItemModAttribute({required this.item, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
            image: NetworkImage(
                DestinyData.bungieLink + item.displayProperties!.icon!)),
        Text(item.displayProperties!.name!)
      ],
    );
  }
}
