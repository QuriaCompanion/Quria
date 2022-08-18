import 'package:bungie_api/enums/item_state.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display_perks.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/var/routes.dart';

class ItemComponentDisplay extends StatefulWidget {
  final DestinyItemComponent item;
  final DestinyInventoryItemDefinition itemDef;
  final String characterId;
  final String? elementIcon;
  final int? powerLevel;
  final List<DestinyItemSocketState> perks;
  final List<DestinyItemSocketState> cosmetics;
  final List<DestinyItemSocketState> armorSockets;
  final double width;

  const ItemComponentDisplay({
    required this.item,
    required this.itemDef,
    required this.elementIcon,
    required this.powerLevel,
    required this.perks,
    required this.cosmetics,
    required this.characterId,
    required this.armorSockets,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemComponentDisplay> createState() => _ItemComponentDisplayState();
}

class _ItemComponentDisplayState extends State<ItemComponentDisplay> with TickerProviderStateMixin {
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
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
            onTap: () {
              Provider.of<InspectProvider>(context, listen: false)
                  .setInspectItem(itemDef: widget.itemDef, item: widget.item);
              Navigator.pushNamed(context, routeInspectMobile);
            },
            child: Row(
              children: [
                ItemIcon(
                  displayHash: widget.item.overrideStyleItemHash ?? widget.itemDef.hash!,
                  imageSize: iconSize(context, widget.width),
                  isMasterworked: widget.item.state == ItemState.Masterwork || widget.item.state == const ItemState(5),
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
                            Container(
                                width: 12,
                                height: 12,
                                margin: const EdgeInsets.only(right: 5),
                                child: Image(
                                  image: NetworkImage('${DestinyData.bungieLink}${widget.elementIcon!}?t=12'),
                                )),
                          textBodyBold(widget.powerLevel.toString()),
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
              ItemComponentDisplayPerks(
                perks: widget.perks,
                cosmetics: widget.cosmetics,
                itemDef: widget.itemDef,
                armorSockets: widget.armorSockets,
                width: widget.width,
              )
            ],
          )
      ],
    );
  }
}
