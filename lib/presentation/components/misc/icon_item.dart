import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ItemIcon extends StatelessWidget {
  final int displayHash;
  final double imageSize;
  final bool isMasterworked;
  final bool isSunset;
  final bool isActive;
  final int? powerLevel;
  final String? element;
  const ItemIcon({
    required this.displayHash,
    required this.imageSize,
    this.isMasterworked = false,
    this.isSunset = false,
    this.isActive = true,
    this.powerLevel,
    this.element,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            border: Border.all(color: isMasterworked ? yellow : Colors.white),
          ),
          child: Stack(
            children: [
              ExtendedImage.network(
                DestinyData.bungieLink +
                    ManifestService
                        .manifestParsed.destinyInventoryItemDefinition[displayHash]!.displayProperties!.icon!,
                loadStateChanged: (ExtendedImageState state) {
                  switch (state.extendedImageLoadState) {
                    case LoadState.loading:
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: DestinyData.getTierColor(ManifestService
                                .manifestParsed.destinyInventoryItemDefinition[displayHash]!.inventory!.tierType!)),
                      );
                    case LoadState.completed:
                      return null;
                    case LoadState.failed:
                      return null;
                  }
                },
                height: imageSize,
                width: imageSize,
                timeLimit: const Duration(seconds: 10),
                cache: true,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
                printError: false,
              ),
              if (ManifestService.manifestParsed.destinyInventoryItemDefinition[displayHash]!.quality
                          ?.displayVersionWatermarkIcons?[0] !=
                      null &&
                  ManifestService.manifestParsed.destinyInventoryItemDefinition[displayHash]!.quality
                          ?.displayVersionWatermarkIcons?[0] !=
                      "")
                ExtendedImage.network(
                  DestinyData.bungieLink +
                      ManifestService.manifestParsed.destinyInventoryItemDefinition[displayHash]!.quality!
                          .displayVersionWatermarkIcons![0],
                  height: imageSize,
                  timeLimit: const Duration(seconds: 10),
                  width: imageSize,
                  cache: true,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                  printError: false,
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
                            child: Image(image: NetworkImage(DestinyData.bungieLink + element!)),
                          ),
                        textIcon(powerLevel.toString())
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (!isActive)
          Container(
            width: imageSize,
            height: imageSize,
            color: black.withOpacity(0.7),
          ),
      ],
    );
  }
}
