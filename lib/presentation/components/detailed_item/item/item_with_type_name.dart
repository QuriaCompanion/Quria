import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class ItemWithTypeName extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  final double iconSize;
  const ItemWithTypeName({required this.item, this.iconSize = 16, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          '${DestinyData.bungieLink}${item.displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}123456',
          height: iconSize,
          width: iconSize,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ),
        SizedBox(width: globalPadding(context)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBodyRegular(item.displayProperties!.name!),
            textCaption(item.itemTypeDisplayName!, color: greyLight),
          ],
        ),
      ],
    );
  }
}
