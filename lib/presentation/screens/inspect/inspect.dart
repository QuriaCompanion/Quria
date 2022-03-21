import 'dart:developer';

import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/cubit/perk_set_cubit.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/detailed_item/item/header_weapon_details.dart';
import 'package:quria/presentation/detailed_item/item/perk_item_display.dart';
import 'package:quria/presentation/detailed_item/item/stat_progress_bar.dart';
import 'package:quria/presentation/detailed_item/item/weapon_details_hidden_stats.dart';

import '../../../data/models/helpers/inspectHelper.model.dart';

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
    final double itemMainInfoWidth = MediaQuery.of(context).size.width * 0.33;
    if (MediaQuery.of(context).size.width < 1600) {
      imageSize = 100;
      iconSize = 50;
    }
    if (MediaQuery.of(context).size.width < 850) {
      return mobileView();
    }
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * globalPadding,
            left: MediaQuery.of(context).size.width * globalPadding,
            right: MediaQuery.of(context).size.width * globalPadding),
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
    padding = MediaQuery.of(context).size.width * 0.025;
    return SingleChildScrollView(
      child: Container(
          color: backgroundColor,
          padding: EdgeInsets.only(top: padding, left: padding, right: padding),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - padding * 2,
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
                      width: MediaQuery.of(context).size.width -
                          imageSize -
                          padding * 3,
                      height: imageSize),
                ]),
                for (int statHash in DestinyData.linearStatBySubType[
                    ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition![widget.item.hash]!
                        .itemSubType!]!)
                  StatProgressBar(
                      width: MediaQuery.of(context).size.width - padding * 2,
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
                  width: MediaQuery.of(context).size.width - padding * 2,
                  padding: childPadding,
                  fontSize: fontSize,
                  hash: widget.item.hash!,
                ),
                SizedBox(
                  child: PerkList(
                      selectedPerks: selectedPerks,
                      item: widget.item,
                      iconSize: MediaQuery.of(context).size.width / 7,
                      padding: (MediaQuery.of(context).size.width -
                              ((MediaQuery.of(context).size.width / 7) * 4) -
                              padding * 2) /
                          8),
                )
              ],
            ),
          )),
    );
  }
}

class PerkList extends StatelessWidget {
  const PerkList({
    Key? key,
    required this.selectedPerks,
    required this.item,
    required this.iconSize,
    required this.padding,
  }) : super(key: key);

  final InspectHelper selectedPerks;
  final DestinyInventoryItemDefinition item;
  final double iconSize;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PerkSetCubit(),
      child: BlocBuilder<PerkSetCubit, PerkSetState>(
        builder: (context, state) {
          return SizedBox(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              for (int index = 1; index <= 4; index++)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: ColumnPerkDisplay(
                      item: item,
                      index: index,
                      padding: padding,
                      selectedPerks: selectedPerks,
                      iconSize: iconSize),
                )
            ]),
          );
        },
      ),
    );
  }
}

class ColumnPerkDisplay extends StatefulWidget {
  const ColumnPerkDisplay({
    Key? key,
    required this.item,
    required this.index,
    required this.padding,
    required this.selectedPerks,
    required this.iconSize,
  }) : super(key: key);

  final DestinyInventoryItemDefinition item;
  final int index;
  final double padding;
  final InspectHelper selectedPerks;
  final double iconSize;

  @override
  State<ColumnPerkDisplay> createState() => _ColumnPerkDisplayState();
}

class _ColumnPerkDisplayState extends State<ColumnPerkDisplay> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List sockets = ManifestService
        .manifestParsed
        .destinyPlugSetDefinition![widget
            .item.sockets!.socketEntries![widget.index].randomizedPlugSetHash]!
        .reusablePlugItems!;
    return Column(
      children: [
        if (widget.item.sockets?.socketEntries?[widget.index]
                .randomizedPlugSetHash !=
            null)
          for (int i = 0; i < sockets.length; i++)
            Padding(
              padding: EdgeInsets.symmetric(vertical: widget.padding),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                    switch (widget.index) {
                      case 1:
                        widget.selectedPerks.firstColumn = ManifestService
                                .manifestParsed.destinyInventoryItemDefinition![
                            sockets[i].plugItemHash]!;
                        inspect(widget.selectedPerks);
                        break;
                      case 2:
                        widget.selectedPerks.secondColumn = ManifestService
                                .manifestParsed.destinyInventoryItemDefinition![
                            sockets[i].plugItemHash]!;
                        break;
                      case 3:
                        widget.selectedPerks.thirdColumn = ManifestService
                                .manifestParsed.destinyInventoryItemDefinition![
                            sockets[i].plugItemHash]!;
                        break;
                      case 4:
                        widget.selectedPerks.fourthColumn = ManifestService
                                .manifestParsed.destinyInventoryItemDefinition![
                            sockets[i].plugItemHash]!;
                        break;
                    }
                  });
                },
                child: PerkItemDisplay(
                  selected: selectedIndex == i,
                  perk: ManifestService
                          .manifestParsed.destinyInventoryItemDefinition![
                      sockets[i].plugItemHash]!,
                  iconSize: widget.iconSize,
                ),
              ),
            ),
        if (widget.item.sockets?.socketEntries?[widget.index]
                .randomizedPlugSetHash ==
            null)
          PerkItemDisplay(
            perk:
                ManifestService.manifestParsed.destinyInventoryItemDefinition![
                    widget.item.sockets?.socketEntries?[widget.index]
                        .singleInitialItemHash]!,
            iconSize: widget.iconSize,
          )
      ],
    );
  }
}
