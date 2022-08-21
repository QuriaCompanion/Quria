import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
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
                filterQuality: FilterQuality.high,
                image: CachedNetworkImageProvider(
                    '${DestinyData.bungieLink}${item.displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}123456'),
                height: iconSize(context, width),
                width: iconSize(context, width),
                fit: BoxFit.fill,
              ),
              if (item.iconWatermark != null)
                Image(
                  filterQuality: FilterQuality.high,
                  image: CachedNetworkImageProvider(
                    '${DestinyData.bungieLink}${item.iconWatermark!}?t={${BungieApiService.randomUserInt}}123456',
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
