import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/header_weapon_details.dart';
import 'package:quria/presentation/components/detailed_item/item/stat_progress_bar.dart';
import 'package:quria/presentation/components/detailed_item/item/weapon_details_hidden_stats.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/screens/inspect/components/perk_list.dart';

class InspectWidget extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  const InspectWidget({required this.item, Key? key}) : super(key: key);

  @override
  _InspectWidgetState createState() => _InspectWidgetState();
}

class _InspectWidgetState extends State<InspectWidget> {
  double imageSize = 150;
  double fontSize = 20;
  double itemMainInfoPadding = 15;
  double childPadding = 15;
  double iconSize = 75;
  double padding = 30;
  final InspectHelper selectedPerks = InspectHelper();
  @override
  Widget build(BuildContext context) {
    final double itemMainInfoWidth = vw(context) * 0.33;
    if (vw(context) < 1600) {
      imageSize = 100;
      iconSize = 50;
    }
    if (vw(context) < 850) {
      return mobileView();
    }
    return Container(
        padding: EdgeInsets.only(
            top: globalPadding(context),
            left: globalPadding(context),
            right: globalPadding(context)),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.item.screenshot != null
                ? DestinyData.bungieLink + widget.item.screenshot!
                : ghostLink),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: itemMainInfoWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Hero(
                      tag: widget.item.hash!,
                      child: ItemIcon(
                          displayHash: widget.item.hash!, imageSize: imageSize),
                    ),
                    SizedBox(width: padding),
                    HeaderWeaponDetails(
                        itemHash: widget.item.hash!,
                        iconSize: imageSize / 2.5,
                        childPadding: itemMainInfoPadding,
                        fontSize: fontSize,
                        width: itemMainInfoWidth - imageSize - padding,
                        height: imageSize)
                  ]),
                  Column(
                    children: [
                      for (int statHash in DestinyData.linearStatBySubType[
                          ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition![
                                  widget.item.hash]!
                              .itemSubType!]!)
                        StatProgressBar(
                            width: itemMainInfoWidth,
                            fontSize: fontSize,
                            padding: childPadding,
                            name: ManifestService
                                    .manifestParsed
                                    .destinyStatDefinition![statHash]!
                                    .displayProperties!
                                    .name ??
                                'error',
                            value: ManifestService
                                    .manifestParsed
                                    .destinyInventoryItemDefinition![
                                        widget.item.hash]!
                                    .stats
                                    ?.stats![statHash.toString()]
                                    ?.value ??
                                0,
                            type: ManifestService
                                .manifestParsed
                                .destinyInventoryItemDefinition![
                                    widget.item.hash]!
                                .itemType!),
                    ],
                  ),
                  WeaponDetailsHiddenStats(
                    width: itemMainInfoWidth,
                    padding: childPadding,
                    fontSize: fontSize,
                    hash: widget.item.hash!,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: imageSize),
                  PerkList(
                      selectedPerks: selectedPerks,
                      item: widget.item,
                      iconSize: iconSize,
                      padding: childPadding)
                ],
              ),
            )
          ],
        ));
  }

  Widget mobileView() {
    padding = vw(context) * 0.025;
    return SingleChildScrollView(
      child: Container(
          color: backgroundColor,
          padding: EdgeInsets.only(top: padding, left: padding, right: padding),
          child: SizedBox(
            width: vw(context) - padding * 2,
            child: Column(
              children: [
                Row(children: [
                  Hero(
                    tag: widget.item.hash!,
                    child: ItemIcon(
                        displayHash: widget.item.hash!, imageSize: imageSize),
                  ),
                  SizedBox(width: padding),
                  HeaderWeaponDetails(
                      itemHash: widget.item.hash!,
                      iconSize: imageSize / 2.5,
                      childPadding: itemMainInfoPadding,
                      fontSize: fontSize,
                      width: vw(context) - imageSize - padding * 3,
                      height: imageSize),
                ]),
                for (int statHash in DestinyData.linearStatBySubType[
                    ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition![widget.item.hash]!
                        .itemSubType!]!)
                  StatProgressBar(
                      width: vw(context) - padding * 2,
                      fontSize: fontSize,
                      padding: childPadding,
                      name: ManifestService
                              .manifestParsed
                              .destinyStatDefinition![statHash]!
                              .displayProperties!
                              .name ??
                          'error',
                      value: ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition![
                                  widget.item.hash]!
                              .stats
                              ?.stats![statHash.toString()]
                              ?.value ??
                          0,
                      type: ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition![widget.item.hash]!
                          .itemType!),
                WeaponDetailsHiddenStats(
                  width: vw(context) - padding * 2,
                  padding: childPadding,
                  fontSize: fontSize,
                  hash: widget.item.hash!,
                ),
                SizedBox(
                  child: PerkList(
                      selectedPerks: selectedPerks,
                      item: widget.item,
                      iconSize: vw(context) / 7,
                      padding: (vw(context) -
                              ((vw(context) / 7) * 4) -
                              padding * 2) /
                          8),
                )
              ],
            ),
          )),
    );
  }
}
