import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_item_display.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/var/routes.dart';

class ItemComponentDisplay extends StatefulWidget {
  final DestinyItemComponent item;
  final DestinyInventoryItemDefinition itemDef;
  final String elementIcon;
  final int powerLevel;
  final List<DestinyItemSocketState>? perks;
  final List<DestinyItemSocketState> cosmetics;
  final List<DestinyItemSocketState> armorSockets;

  const ItemComponentDisplay(
      {required this.item,
      required this.itemDef,
      required this.elementIcon,
      required this.powerLevel,
      required this.perks,
      required this.cosmetics,
      required this.armorSockets,
      Key? key})
      : super(key: key);

  @override
  State<ItemComponentDisplay> createState() => _ItemComponentDisplayState();
}

class _ItemComponentDisplayState extends State<ItemComponentDisplay>
    with TickerProviderStateMixin {
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
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = vw(context) / 6.69;
    double smallIconSize = vw(context) / 11.9;
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, routeInspectMobile,
                  arguments: InspectData(
                      hash: widget.item.itemHash!,
                      instanceId: widget.item.itemInstanceId!));
            },
            child: Row(
              children: [
                ItemIcon(
                  displayHash: widget.itemDef.hash!,
                  imageSize: iconSize,
                ),
                SizedBox(width: globalPadding(context)),
                SizedBox(
                  width:
                      vw(context) - (iconSize * 2) - globalPadding(context) * 3,
                  height: iconSize,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textH3(widget.itemDef.displayProperties!.name!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 5),
                              child: Image(
                                image: NetworkImage(DestinyData.bungieLink +
                                    widget.elementIcon),
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
              dropDownActivated
                  ? controller.forward(from: 0)
                  : controller.reverse(from: 1),
              setRotation(180),
              setState(() {
                dropDownActivated = !dropDownActivated;
              })
            },
            child: SizedBox(
              height: iconSize,
              width: iconSize,
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
        Visibility(
          visible: !dropDownActivated,
          child: Column(
            children: [
              const Divider(
                thickness: 0.5,
                height: 25,
                color: greyLight,
              ),
              Row(
                children: [
                  for (DestinyItemSocketState perk in widget.perks!)
                    Container(
                        width: smallIconSize,
                        height: smallIconSize,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: PerkItemDisplay(
                          selected: true,
                          perk: ManifestService.manifestParsed
                              .destinyInventoryItemDefinition![perk.plugHash]!,
                          iconSize: smallIconSize,
                        )),
                  if (widget.itemDef.itemType == DestinyItemType.Armor)
                    for (DestinyItemSocketState socket in widget.armorSockets)
                      Container(
                        width: smallIconSize,
                        height: smallIconSize,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Image(
                          image: NetworkImage(DestinyData.bungieLink +
                              ManifestService
                                  .manifestParsed
                                  .destinyInventoryItemDefinition![
                                      socket.plugHash]!
                                  .displayProperties!
                                  .icon!),
                        ),
                      ),
                  const Spacer(),
                  Row(
                    children: [
                      for (DestinyItemSocketState socket in widget.cosmetics)
                        Container(
                          width: smallIconSize,
                          height: smallIconSize,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Image(
                            image: NetworkImage(DestinyData.bungieLink +
                                ManifestService
                                    .manifestParsed
                                    .destinyInventoryItemDefinition![
                                        socket.plugHash]!
                                    .displayProperties!
                                    .icon!),
                          ),
                        ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}