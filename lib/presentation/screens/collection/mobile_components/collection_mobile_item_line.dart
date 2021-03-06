import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class CollectionItemLine extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  final double width;
  const CollectionItemLine({
    required this.item,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: iconSize(context, width),
          height: iconSize(context, width),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(DestinyData.bungieLink + item.displayProperties!.icon!),
                height: iconSize(context, width),
                width: iconSize(context, width),
                fit: BoxFit.fill,
              ),
              if (item.iconWatermark != null)
                Image(
                  image: NetworkImage(
                    DestinyData.bungieLink + item.iconWatermark!,
                  ),
                  height: iconSize(context, width),
                  width: iconSize(context, width),
                  fit: BoxFit.fill,
                ),
            ],
          ),
        ),
        SizedBox(width: globalPadding(context)),
        textH3(item.displayProperties?.name ?? ""),
      ],
    );
  }
}
