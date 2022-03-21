import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

import '../../../data/services/bungie_api/enums/destiny_data.dart';
import '../../../data/services/manifest/manifest.service.dart';

class ItemIcon extends StatelessWidget {
  const ItemIcon({
    Key? key,
    required this.displayHash,
    required this.imageSize,
  }) : super(key: key);

  final int displayHash;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition?[displayHash]
                  ?.equippingBlock
                  ?.equipmentSlotTypeHash !=
              3284755031
          ? regularShadow
          : const BoxDecoration(),
      child: Stack(children: [
        Image(
          image: NetworkImage(DestinyData.bungieLink +
              ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition![displayHash]!
                  .displayProperties!
                  .icon!),
          height: imageSize,
          width: imageSize,
          fit: BoxFit.fill,
        ),
        if (ManifestService.manifestParsed
                .destinyInventoryItemDefinition![displayHash]!.iconWatermark !=
            null)
          Image(
            image: NetworkImage(DestinyData.bungieLink +
                ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![displayHash]!
                    .iconWatermark!),
            height: imageSize,
            width: imageSize,
            fit: BoxFit.fill,
          ),
      ]),
    );
  }
}
