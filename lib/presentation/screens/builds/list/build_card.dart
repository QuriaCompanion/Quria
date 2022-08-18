import 'package:bungie_api/enums/item_state.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/providers/details_build_provider.dart';
import 'dart:math' as math;
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/presentation/screens/profile/components/character_stats_listing.dart';
import 'package:quria/presentation/var/routes.dart';

class BuildCard extends StatelessWidget {
  final BuildStored buildStored;
  final double width;
  const BuildCard({
    Key? key,
    required this.buildStored,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<DetailsBuildProvider>(context, listen: false).inspectBuild(buildStored);
        Navigator.pushNamed(context, routeDetailsBuild);
      },
      child: Stack(
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: blackLight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 72,
                  width: width,
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: globalPadding(context)),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: buildStored.items
                                .where((element) => element.bucketHash == InventoryBucket.subclass)
                                .isNotEmpty
                            ? NetworkImage(DestinyData.bungieLink +
                                ManifestService
                                    .manifestParsed
                                    .destinyInventoryItemDefinition[buildStored.items
                                        .where((element) => element.bucketHash == InventoryBucket.subclass)
                                        .first
                                        .itemHash]!
                                    .screenshot!)
                            : ghostBuild),
                  ),
                  child: textH3(buildStored.name, utf8: false),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: globalPadding(context), right: globalPadding(context), bottom: globalPadding(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      CharacterStatsListing(
                        stats: BuilderService().buildStatCalculator(context, items: buildStored.items),
                        characterId: Provider.of<CharactersProvider>(context).currentCharacter!.characterId!,
                        direction: Axis.horizontal,
                        width: isMobile(context) ? width * 0.6 : 300,
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        runAlignment: WrapAlignment.start,
                        alignment: WrapAlignment.start,
                        children: [
                          for (final bucket in InventoryBucket.armorBucketHashes)
                            if (buildStored.items
                                .where((element) => element.bucketHash == bucket && element.isEquipped)
                                .isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                                child: BuildCardItem(width: width, buildStored: buildStored, bucket: bucket),
                              )
                            else
                              SizedBox(
                                height: width / 8 + 8,
                              ),
                        ],
                      ),
                      Wrap(
                        runAlignment: WrapAlignment.start,
                        alignment: WrapAlignment.start,
                        children: [
                          for (final bucket in InventoryBucket.weaponBucketHashes)
                            if (buildStored.items
                                .where((element) => element.bucketHash == bucket && element.isEquipped)
                                .isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                                child: BuildCardItem(width: width, buildStored: buildStored, bucket: bucket),
                              )
                            else
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: SizedBox(
                                  height: width / 8 + 8,
                                ),
                              ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RoundedButton(
                              text: textBodyMedium(AppLocalizations.of(context)!.equip, color: black, utf8: false),
                              onPressed: () {
                                BungieActionsService().equipStoredBuild(context, items: buildStored.items);
                              },
                            ),
                          ),
                          SizedBox(
                            width: globalPadding(context),
                          ),
                          Expanded(
                            child: RoundedButton(
                              text: textBodyMedium(AppLocalizations.of(context)!.modify,
                                  color: Colors.white, utf8: false),
                              buttonColor: grey,
                              onPressed: () {
                                Provider.of<CreateBuildProvider>(context, listen: false).modifyBuild(buildStored);
                                Navigator.pushNamed(context, routeCreateBuild);
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          if (buildStored.items.where((element) => element.bucketHash == InventoryBucket.subclass).isNotEmpty)
            Positioned(
              top: 35,
              right: 20,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: -math.pi / 4,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                    ),
                  ),
                  ExtendedImage.network(
                    DestinyData.bungieLink +
                        ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition[buildStored.items
                                .where((element) => element.bucketHash == InventoryBucket.subclass)
                                .first
                                .itemHash]!
                            .displayProperties!
                            .icon!,
                    height: 75,
                    width: 75,
                    timeLimit: const Duration(seconds: 10),
                    cache: true,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    printError: false,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class BuildCardItem extends StatelessWidget {
  const BuildCardItem({
    Key? key,
    required this.buildStored,
    required this.bucket,
    required this.width,
  }) : super(key: key);

  final BuildStored buildStored;
  final int bucket;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final item = buildStored.items.firstWhere((element) => element.bucketHash == bucket && element.isEquipped);
      final instancedItem = Provider.of<InventoryProvider>(context, listen: false).getItemByInstanceId(item.instanceId);
      if (instancedItem == null) {
        return SizedBox(
          width: width / 8,
          height: width / 8,
          child: const Icon(
            Icons.question_mark_outlined,
            color: Colors.white,
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ItemIcon(
          displayHash:
              buildStored.items.firstWhere((element) => element.bucketHash == bucket && element.isEquipped).itemHash,
          imageSize: width / 8,
          isMasterworked: instancedItem.state == ItemState.Masterwork || instancedItem.state == const ItemState(5),
          element: Provider.of<ItemProvider>(context, listen: false).getItemElement(instancedItem),
          powerLevel: Provider.of<ItemProvider>(context).getItemPowerLevel(item.instanceId),
        ),
      );
    });
  }
}
