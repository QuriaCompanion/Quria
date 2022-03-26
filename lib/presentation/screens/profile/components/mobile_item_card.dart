import 'dart:math';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_equipment_slot_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/detailed_item/item/perk_item_display.dart';
import 'package:quria/presentation/var/routes.dart';

class MobileItemCard extends StatefulWidget {
  // data
  final DestinyItemComponent item;
  final String instanceId;
  const MobileItemCard({Key? key, required this.item, required this.instanceId})
      : super(key: key);

  @override
  State<MobileItemCard> createState() => _MobileItemCardState();
}

class _MobileItemCardState extends State<MobileItemCard>
    with TickerProviderStateMixin {
  late final DestinyInventoryItemDefinition itemDef;
  late final DestinyEquipmentSlotDefinition itemCategory;
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
    final instanceInfo =
        ProfileService().getInstanceInfo(widget.item.itemInstanceId!);
    final DestinyInventoryItemDefinition itemDef = ManifestService
        .manifestParsed.destinyInventoryItemDefinition![widget.item.itemHash]!;
    final DestinyEquipmentSlotDefinition itemCategory =
        ManifestService.manifestParsed.destinyEquipmentSlotDefinition![
            itemDef.equippingBlock!.equipmentSlotTypeHash]!;
    final String? elementIcon = ManifestService
            .manifestParsed
            .destinyDamageTypeDefinition?[itemDef.defaultDamageTypeHash]
            ?.displayProperties
            ?.icon ??
        ManifestService
            .manifestParsed
            .destinyEnergyTypeDefinition?[instanceInfo.energy?.energyTypeHash]
            ?.displayProperties
            ?.icon;

    final int powerLevel = instanceInfo.primaryStat!.value!;

    final sockets = ProfileService().getItemSockets(widget.instanceId);
    final List<DestinyItemSocketState>? perks = sockets!
        .where((element) =>
            element.plugHash != null &&
            DestinyData.perkCategoryHash.contains(ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition?[element.plugHash]!
                .plug!
                .plugCategoryHash!))
        .toList();

    final List<DestinyItemSocketState> armorSockets = sockets
        .where((element) =>
            (element.isVisible!) &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.plug
                    ?.plugCategoryHash !=
                2973005342 &&
            !ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition![element.plugHash]!
                .plug!
                .plugCategoryIdentifier!
                .contains('masterworks.stat') &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemType !=
                DestinyItemType.Armor &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemSubType !=
                DestinyItemSubType.Ornament &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.inventory
                    ?.tierType !=
                TierType.Exotic)
        .toList();
    final List<DestinyItemSocketState>? cosmetics = sockets
        .where((element) =>
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemType ==
                DestinyItemType.Armor ||
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemSubType ==
                DestinyItemSubType.Ornament ||
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemSubType ==
                DestinyItemSubType.Shader)
        .toList();
    double iconSize = MediaQuery.of(context).size.width / 6.69;
    double smallIconSize = MediaQuery.of(context).size.width / 11.9;
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    textH2(itemCategory.displayProperties!.name!),
                    const SizedBox(width: 20),
                    textH3('1/10', color: greyLight)
                  ],
                ),
                textBodyMedium('Tout voir')
              ],
            ),
          ),
          Row(children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, routeInspectMobile,
                    arguments: InspectData(
                        hash: widget.item.itemHash!,
                        instanceId: widget.instanceId));
              },
              child: Row(
                children: [
                  ItemIcon(
                    displayHash: itemDef.hash!,
                    imageSize: iconSize,
                  ),
                  SizedBox(width: globalPadding(context)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        (iconSize * 2) -
                        globalPadding(context) * 3,
                    height: iconSize,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textH3(itemDef.displayProperties!.name!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: 12,
                                height: 12,
                                margin: const EdgeInsets.only(right: 5),
                                child: Image(
                                  image: NetworkImage(
                                      DestinyData.bungieLink + elementIcon!),
                                )),
                            textBodyBold(powerLevel.toString()),
                            divider,
                            textBodyRegular(itemDef.itemTypeDisplayName!),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
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
                    for (DestinyItemSocketState perk in perks!)
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
                                    .destinyInventoryItemDefinition![
                                perk.plugHash]!,
                            iconSize: smallIconSize,
                          )),
                    if (itemDef.itemType == DestinyItemType.Armor)
                      for (DestinyItemSocketState socket in armorSockets)
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
                        for (DestinyItemSocketState socket in cosmetics!)
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
        ]));
  }
}
