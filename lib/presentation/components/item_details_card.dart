import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/stat_progress_bar.dart';
import 'package:quria/presentation/components/weapon_details_hidden_stats.dart';

import 'attributs_details.dart';

@immutable
class ItemDetailsWidget extends StatelessWidget {
  final profile = ProfileService();
  final int attributeSocketId;
  final double fontSize;
  final DestinyItemComponent item;
  final double width;
  final double sidePadding;
  final double imageSize;
  final double childPadding;
  ItemDetailsWidget({
    required this.item,
    this.attributeSocketId = 0,
    this.width = 800,
    this.fontSize = 20,
    this.sidePadding = 25,
    this.imageSize = 150,
    this.childPadding = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int displayHash = item.overrideStyleItemHash ?? item.itemHash!;
    final stats = profile.getPrecalculatedStats(item.itemInstanceId!);
    return Container(
      width: width,
      padding: EdgeInsets.all(sidePadding),
      decoration: blackTransparentBackground,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: imageSize,
                width: imageSize,
                child: Container(
                  decoration: regularShadow,
                  child: Image(
                    image: NetworkImage(DestinyData.bungieLink +
                        ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition![displayHash]!
                            .displayProperties!
                            .icon!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // HeaderWeaponDetails(
              //     name: utf8.decode(ManifestService.manifestParsed
              //         .destinyInventoryItemDefinition![item.itemHash]!
              //         .displayProperties!
              //         .name!
              //         .runes
              //         .toList()),
              //     typeOfAmmo: 'typeOfAmmo',
              //     typeOfAmmoImg:
              //         'https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg',
              //     typeOfWeapon: 'typeOfWeapon',
              //     type: 'type',
              //     typeImg:
              //         'https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg',
              //     value: 100),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            for (int statHash in DestinyData.linearStatBySubType[ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition![item.itemHash]!
                .itemSubType!]!)
              StatProgressBar(
                  width: width - (sidePadding * 2),
                  fontSize: fontSize,
                  padding: childPadding,
                  name: ManifestService
                          .manifestParsed
                          .destinyStatDefinition![statHash]!
                          .displayProperties!
                          .name ??
                      'error',
                  value: stats![statHash.toString()]?.value ??
                      ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition![item.itemHash]!
                          .stats
                          ?.stats![statHash.toString()]
                          ?.value ??
                      0,
                  type: ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition![item.itemHash]!
                      .itemType!),
          ]),
          WeaponDetailsHiddenStats(
            width: width - (sidePadding * 2),
            padding: childPadding,
            fontSize: fontSize,
            stats: stats,
            hash: item.itemHash!,
          ),
          const Divider(
            color: Colors.white,
          ),
          AttributsDetails(
              width: width - (sidePadding * 2),
              padding: childPadding,
              fontSize: fontSize,
              item: item,
              socketId: attributeSocketId),
        ],
      ),
    );
  }
}
