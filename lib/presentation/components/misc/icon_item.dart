import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ItemIcon extends StatelessWidget {
  final int displayHash;
  final double imageSize;
  final bool isMasterworked;
  final int? powerLevel;
  final String? element;
  const ItemIcon({
    required this.displayHash,
    required this.imageSize,
    this.isMasterworked = false,
    this.powerLevel,
    this.element,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        border: Border.all(color: isMasterworked ? yellow : Colors.white),
      ),
      child: Stack(
        children: [
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
              image: NetworkImage(
                DestinyData.bungieLink +
                    ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition[displayHash]!
                        .iconWatermark!,
              ),
              height: imageSize,
              width: imageSize,
              fit: BoxFit.fill,
            ),
          if (powerLevel != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: imageSize,
                height: imageSize / 4,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (element != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Image(image: NetworkImage(element!)),
                      ),
                    textIcon(powerLevel.toString())
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
