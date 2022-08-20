import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ItemNamedDescription extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  final double iconSize;
  const ItemNamedDescription({required this.item, this.iconSize = 15, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMasterwork = item.plug?.plugCategoryIdentifier?.contains('masterworks.stat') == true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.network(
              '${DestinyData.bungieLink}${item.displayProperties!.icon!}?t=123456',
              width: iconSize,
              height: iconSize,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
            if (item.iconWatermark != null)
              Image.network(
                '${DestinyData.bungieLink}${item.iconWatermark!}?t=123456',
                width: iconSize,
                height: iconSize,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
          ],
        ),
        SizedBox(width: globalPadding(context)),
        textBodyRegular(isMasterwork
            ? ManifestService.manifestParsed.destinyStatDefinition[item.investmentStats![0].statTypeHash]
                    ?.displayProperties?.name ??
                'Unknown'
            : item.displayProperties!.name!),
      ],
    );
  }
}
