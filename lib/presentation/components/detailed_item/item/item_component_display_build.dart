import 'package:bungie_api/enums/item_state.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display_perks_build.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';

class ItemComponentDisplayBuild extends StatefulWidget {
  final DestinyItemComponent? item;
  final DestinyInventoryItemDefinition itemDef;
  final String? elementIcon;
  final int? powerLevel;
  final List<int> perks;
  final VoidCallback callback;
  final double width;
  final bool isSubclass;

  const ItemComponentDisplayBuild({
    required this.itemDef,
    required this.perks,
    required this.width,
    required this.callback,
    required this.isSubclass,
    this.elementIcon,
    this.powerLevel,
    this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemComponentDisplayBuild> createState() => _ItemComponentDisplayBuildState();
}

class _ItemComponentDisplayBuildState extends State<ItemComponentDisplayBuild> with TickerProviderStateMixin {
  late bool dropDownActivated = true;
  late AnimationController controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
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
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width - globalPadding(context) * 2,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                widget.callback();
              },
              child: Row(
                children: [
                  ItemIcon(
                    displayHash: widget.item?.overrideStyleItemHash ?? widget.itemDef.hash!,
                    imageSize: iconSize(context, widget.width),
                    isMasterworked:
                        widget.item?.state == ItemState.Masterwork || widget.item?.state == const ItemState(5),
                  ),
                  SizedBox(width: globalPadding(context)),
                  SizedBox(
                    width: itemComponentDisplayTextWidth(context, widget.width),
                    height: iconSize(context, widget.width),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textH3(widget.itemDef.displayProperties!.name!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (widget.elementIcon != null)
                              SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: Image(
                                    image: NetworkImage(DestinyData.bungieLink + widget.elementIcon!),
                                  )),
                            if (widget.powerLevel != null) textBodyBold(widget.powerLevel.toString()),
                            divider,
                            textBodyRegular(widget.itemDef.itemTypeDisplayName!),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!widget.isSubclass)
              InkWell(
                onTap: () => {
                  dropDownActivated ? controller.forward(from: 0) : controller.reverse(from: 1),
                  setRotation(180),
                  setState(() {
                    dropDownActivated = !dropDownActivated;
                  })
                },
                child: SizedBox(
                  height: iconSize(context, widget.width),
                  width: iconSize(context, widget.width),
                  child: AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: animation.value,
                          child: child,
                        );
                      },
                      child: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.white,
                      )),
                ),
              )
          ]),
          if (!dropDownActivated)
            Column(
              children: [
                const Divider(
                  thickness: 0.5,
                  height: 25,
                  color: greyLight,
                ),
                ItemComponentDisplayPerksBuild(
                  perks: widget.perks,
                  width: widget.width,
                  itemDef: widget.itemDef,
                )
              ],
            )
        ],
      ),
    );
  }
}
