import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/detailed_item/item/mod_display.dart';

class ExoticMobileItem extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  const ExoticMobileItem({required this.item, Key? key}) : super(key: key);

  @override
  State<ExoticMobileItem> createState() => _ExoticMobileItemState();
}

class _ExoticMobileItemState extends State<ExoticMobileItem>
    with TickerProviderStateMixin {
  late DestinyInventoryItemDefinition perk;

  late bool dropDownActivated = true;
  late AnimationController controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 100));
  late Animation<double> animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  setRotation(int degres) {
    final angle = degres * pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  @override
  void initState() {
    super.initState();
    setRotation(90);

    perk = ManifestService.manifestParsed.destinyInventoryItemDefinition![widget
        .item.sockets!.socketEntries
        ?.firstWhere((element) =>
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[
                        element.singleInitialItemHash]
                    ?.plug
                    ?.plugCategoryHash ==
                1744546145 &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[
                        element.singleInitialItemHash]
                    ?.inventory
                    ?.tierType ==
                TierType.Exotic)
        .singleInitialItemHash]!;
  }

  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(globalPadding(context) / 2),
      decoration: BoxDecoration(
          color: blackLight, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                      width: mobileItemSize(context),
                      height: mobileItemSize(context),
                      image: NetworkImage(DestinyData.bungieLink +
                          widget.item.displayProperties!.icon!)),
                  SizedBox(width: globalPadding(context) / 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textBodyBold(widget.item.displayProperties!.name!),
                      SizedBox(height: globalPadding(context) / 3),
                      textCaption(widget.item.itemTypeDisplayName!,
                          color: greyLight),
                    ],
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    dropDownActivated
                        ? controller.forward(from: 0)
                        : controller.reverse(from: 1);
                    setRotation(180);
                    isOpen = !isOpen;
                  });
                },
                icon: const Icon(Icons.arrow_drop_down),
                color: greyLight,
                iconSize: 15,
              ),
            ],
          ),
          Visibility(
              visible: isOpen,
              child: Column(
                children: [
                  const Divider(
                    color: greyLight,
                    thickness: 1,
                  ),
                  ModDisplay(
                    width: vw(context) -
                        (globalPadding(context) * 4) -
                        mobileItemSize(context),
                    iconSize: mobileItemSize(context),
                    padding: globalPadding(context) / 2,
                    item: perk,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
