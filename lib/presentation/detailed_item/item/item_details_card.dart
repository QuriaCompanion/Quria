import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/detailed_item/item/header_weapon_details.dart';
import 'package:quria/presentation/detailed_item/item/stat_progress_bar.dart';
import 'package:quria/presentation/detailed_item/item/weapon_details_hidden_stats.dart';
import 'package:quria/presentation/detailed_item/subclass/attributs_details.dart';

@immutable
class ItemDetailsWidget extends StatelessWidget {
  final profile = ProfileService();
  final int attributeSocketId;
  final double fontSize;
  final DestinyItemComponent item;
  final double width;
  final double sidePadding;
  final double iconSize;
  final double imageSize;
  final double childPadding;
  ItemDetailsWidget({
    required this.item,
    this.attributeSocketId = 0,
    this.width = 800,
    this.fontSize = 20,
    this.sidePadding = 25,
    this.imageSize = 150,
    this.iconSize = 100,
    this.childPadding = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int displayHash = item.overrideStyleItemHash ?? item.itemHash!;
    final stats = profile.getPrecalculatedStats(item.itemInstanceId!);
    final instanceInfo = profile.getInstanceInfo(item.itemInstanceId!);
    return RepaintBoundary(
      child: Container(
        width: width,
        padding: EdgeInsets.all(sidePadding),
        decoration: blackTransparentBackground,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ItemIcon(displayHash: displayHash, imageSize: imageSize),
                SizedBox(
                  width: childPadding,
                ),
                HeaderWeaponDetails(
                  iconSize: iconSize / 2,
                  height: imageSize,
                  width: width - imageSize - childPadding - sidePadding * 2,
                  itemHash: item.itemHash!,
                  fontSize: fontSize,
                  childPadding: childPadding,
                  powerLevel: instanceInfo.primaryStat?.value! ?? 0,
                ),
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              for (int statHash in DestinyData.linearStatBySubType[
                  ManifestService
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
                iconSize: iconSize,
                padding: childPadding,
                fontSize: fontSize,
                item: item,
                socketId: attributeSocketId),
          ],
        ),
      ),
    );
  }
}
