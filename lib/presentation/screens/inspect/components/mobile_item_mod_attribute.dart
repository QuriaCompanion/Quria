import 'package:bungie_api/destiny2.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class MobileItemModAttribute extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  final double iconSize;
  const MobileItemModAttribute(
      {required this.item, this.iconSize = 15, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMasterwork =
        item.plug?.plugCategoryIdentifier?.contains('masterworks.stat') == true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image(
                width: iconSize,
                height: iconSize,
                image: NetworkImage(
                    DestinyData.bungieLink + item.displayProperties!.icon!)),
            if (item.iconWatermark != null)
              Image(
                  width: iconSize,
                  height: iconSize,
                  image: NetworkImage(
                      DestinyData.bungieLink + item.iconWatermark!)),
          ],
        ),
        SizedBox(width: globalPadding(context)),
        textBodyRegular(isMasterwork
            ? ManifestService
                    .manifestParsed
                    .destinyStatDefinition![
                        item.investmentStats![0].statTypeHash]
                    ?.displayProperties
                    ?.name ??
                'Unknown'
            : item.displayProperties!.name!),
      ],
    );
  }
}
