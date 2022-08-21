import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
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
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        border: Border.all(color: isMasterworked ? yellow : Colors.white),
      ),
      child: Stack(
        children: [
          Image.network(
            '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyInventoryItemDefinition[displayHash]!.displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}${imageSize.toInt()}',
            height: imageSize,
            width: imageSize,
            filterQuality: FilterQuality.high,
            fit: BoxFit.fill,
          ),
          if ((ManifestService.manifestParsed.destinyInventoryItemDefinition[displayHash]!.quality
                      ?.displayVersionWatermarkIcons?.isNotEmpty ??
                  false) &&
              ManifestService.manifestParsed.destinyInventoryItemDefinition[displayHash]!.quality!
                      .displayVersionWatermarkIcons!.last !=
                  "")
            Image.network(
              '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyInventoryItemDefinition[displayHash]!.quality!.displayVersionWatermarkIcons!.last}?t={${BungieApiService.randomUserInt}}${imageSize.toInt()}',
              height: imageSize,
              width: imageSize,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
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
                        child: Image(
                          image: CachedNetworkImageProvider(
                              '${DestinyData.bungieLink}${element!}?t={${BungieApiService.randomUserInt}}${imageSize.toInt()}'),
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    textIcon(powerLevel.toString())
                  ],
                ),
              ),
            ),
          if (!isActive)
            Container(
              width: imageSize,
              height: imageSize,
              color: black.withOpacity(0.7),
            ),
        ],
      ),
    );
  }
}
