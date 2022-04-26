import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class CollectionItemLine extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  const CollectionItemLine({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: mobileItemSize(context),
          height: mobileItemSize(context),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(
                    DestinyData.bungieLink + item.displayProperties!.icon!),
                height: mobileItemSize(context),
                width: mobileItemSize(context),
                fit: BoxFit.fill,
              ),
              if (item.iconWatermark != null)
                Image(
                  image: NetworkImage(
                    DestinyData.bungieLink + item.iconWatermark!,
                  ),
                  height: mobileItemSize(context),
                  width: mobileItemSize(context),
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
