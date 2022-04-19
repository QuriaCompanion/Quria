import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

import '../../../data/services/bungie_api/enums/destiny_data.dart';
import '../../../data/services/manifest/manifest.service.dart';

class ItemIcon extends StatelessWidget {
  const ItemIcon({
    required this.displayHash,
    required this.imageSize,
    this.isMasterworked = false,
    Key? key,
  }) : super(key: key);

  final int displayHash;
  final double imageSize;
  final bool isMasterworked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        border: Border.all(color: isMasterworked ? yellow : Colors.white),
      ),
      child: Stack(children: [
        Image(
          image: NetworkImage(DestinyData.bungieLink +
              ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition[displayHash]!
                  .displayProperties!
                  .icon!),
          height: imageSize,
          width: imageSize,
          fit: BoxFit.fill,
        ),
        if (ManifestService.manifestParsed
                .destinyInventoryItemDefinition[displayHash]!.iconWatermark !=
            null)
          Image(
            image: NetworkImage(DestinyData.bungieLink +
                ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition[displayHash]!
                    .iconWatermark!),
            height: imageSize,
            width: imageSize,
            fit: BoxFit.fill,
          ),
      ]),
    );
  }
}
