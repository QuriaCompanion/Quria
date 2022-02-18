import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/detailed_item/item/header_weapon_details.dart';
import 'package:quria/presentation/detailed_item/item/perk_item_display.dart';
import 'package:quria/presentation/detailed_item/item/stat_progress_bar.dart';
import 'package:quria/presentation/detailed_item/item/weapon_details_hidden_stats.dart';

class InspectWidget extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  const InspectWidget({required this.item, Key? key}) : super(key: key);

  @override
  _InspectWidgetState createState() => _InspectWidgetState();
}

class _InspectWidgetState extends State<InspectWidget> {
  final double imageSize = 150;
  final double fontSize = 20;
  final double itemMainInfoPadding = 15;
  final double childPadding = 15;
  final double iconSize = 75;
  final double padding = 30;
  @override
  Widget build(BuildContext context) {
    final double itemMainInfoWidth = MediaQuery.of(context).size.width * 0.33;
    return Container(
        padding:
            EdgeInsets.all(MediaQuery.of(context).size.width * globalPadding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.item.screenshot != null
                ? DestinyData.bungieLink + widget.item.screenshot!
                : ghostLink),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(padding),
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
                            displayHash: widget.item.hash!,
                            imageSize: imageSize),
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
                                .destinyInventoryItemDefinition![widget
                                    .item.hash]!
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
                        item: widget.item,
                        iconSize: iconSize,
                        padding: childPadding)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class PerkList extends StatelessWidget {
  const PerkList({
    Key? key,
    required this.item,
    required this.iconSize,
    required this.padding,
  }) : super(key: key);

  final DestinyInventoryItemDefinition item;
  final double iconSize;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        for (int index = 1; index <= 4; index++)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              children: [
                if (item.sockets?.socketEntries?[index].randomizedPlugSetHash !=
                    null)
                  for (var socket in ManifestService
                      .manifestParsed
                      .destinyPlugSetDefinition![item.sockets!
                          .socketEntries![index].randomizedPlugSetHash]!
                      .reusablePlugItems!)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: padding),
                      child: PerkItemDisplay(
                        perk: ManifestService
                                .manifestParsed.destinyInventoryItemDefinition![
                            socket.plugItemHash]!,
                        iconSize: iconSize,
                      ),
                    ),
                if (item.sockets?.socketEntries?[index].randomizedPlugSetHash ==
                    null)
                  PerkItemDisplay(
                    perk: ManifestService
                            .manifestParsed.destinyInventoryItemDefinition![
                        item.sockets?.socketEntries?[index]
                            .singleInitialItemHash]!,
                    iconSize: iconSize,
                  )
              ],
            ),
          )
      ]),
    );
  }
}
