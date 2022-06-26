import 'dart:developer';

import 'package:bungie_api/destiny2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';

class ProfileDesktopItemSection extends StatefulWidget {
  final ProfileHelper data;
  final int bucket;
  final void Function(InspectData) onClick;
  const ProfileDesktopItemSection({
    required this.data,
    required this.bucket,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileDesktopItemSection> createState() =>
      _ProfileDesktopItemSectionState();
}

class _ProfileDesktopItemSectionState extends State<ProfileDesktopItemSection> {
  @override
  Widget build(BuildContext context) {
    List<DestinyItemComponent> characterInventory =
        Provider.of<InventoryProvider>(context).getCharacterInventoryByBucket(
            widget.data.selectedCharacter!.characterId!, widget.bucket);
    List<DestinyItemComponent> inventory =
        Provider.of<InventoryProvider>(context)
            .getVaultInventoryForCharacterByBucket(
                widget.data.selectedCharacter!.characterId!, widget.bucket);

    DestinyItemComponent equippedItem = Provider.of<InventoryProvider>(context)
        .getCharacterEquipmentByBucket(
            widget.data.selectedCharacter!.characterId!, widget.bucket);
    double itemSize = 70;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH2(ManifestService
                .manifestParsed
                .destinyEquipmentSlotDefinition[ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition[equippedItem.itemHash]
                    ?.equippingBlock
                    ?.equipmentSlotTypeHash]
                ?.displayProperties
                ?.name ??
            "error"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: blackLight,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(globalPadding(context) / 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemIcon(
                    displayHash: equippedItem.overrideStyleItemHash ??
                        equippedItem.itemHash!,
                    imageSize: itemSize,
                    isMasterworked:
                        equippedItem.state == ItemState.Masterwork ||
                            equippedItem.state == const ItemState(5),
                    element: Provider.of<ItemProvider>(context)
                        .getItemElement(equippedItem),
                    powerLevel: Provider.of<ItemProvider>(context)
                        .getItemPowerLevel(equippedItem.itemInstanceId!),
                  ),
                  SizedBox(width: 10),
                  DragTarget<DestinyItemComponent>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return SizedBox(
                        width: (itemSize * 3) + 20,
                        child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 3,
                            ),
                            itemCount: characterInventory.length,
                            itemBuilder: (context, index) {
                              return DraggableInventoryItem(
                                  size: itemSize,
                                  item: characterInventory[index]);
                            }),
                      );
                    },
                    onAccept: (DestinyItemComponent data) {
                      if (Provider.of<InventoryProvider>(context, listen: false)
                              .getItemOwner(data.itemInstanceId!) !=
                          widget.data.selectedCharacter?.characterId) {
                        BungieActionsService().transferItem(
                            context,
                            data.itemInstanceId!,
                            widget.data.selectedCharacter?.characterId,
                            itemHash: data.itemHash!,
                            stackSize: 1);
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: vw(context) * 0.7,
              decoration: BoxDecoration(
                color: blackLight,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(globalPadding(context) / 4),
              child: DragTarget<DestinyItemComponent>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return SizedBox(
                    width: vw(context) * 0.7,
                    child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: itemSize,
                          mainAxisExtent: itemSize,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: inventory.length,
                        itemBuilder: (context, index) {
                          return DraggableInventoryItem(
                            item: inventory[index],
                            size: itemSize,
                          );
                        }),
                  );
                },
                onAccept: (DestinyItemComponent data) {
                  if (Provider.of<InventoryProvider>(context, listen: false)
                              .getItemOwner(data.itemInstanceId!) !=
                          null &&
                      Provider.of<InventoryProvider>(context, listen: false)
                              .getItemOwner(data.itemInstanceId!) ==
                          widget.data.selectedCharacter?.characterId) {
                    BungieActionsService().transferItem(
                        context, data.itemInstanceId!, null,
                        itemHash: data.itemHash!, stackSize: 1);
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

class DraggableInventoryItem extends StatelessWidget {
  final DestinyItemComponent item;
  final double size;
  const DraggableInventoryItem({
    required this.item,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<DestinyItemComponent>(
      // Data is the value this Draggable stores.
      data: item,
      feedback: ItemIcon(
        displayHash: item.overrideStyleItemHash ?? item.itemHash!,
        imageSize: size,
        isMasterworked: item.state == ItemState.Masterwork ||
            item.state == const ItemState(5),
        element: Provider.of<ItemProvider>(context).getItemElement(item),
        powerLevel: Provider.of<ItemProvider>(context)
            .getItemPowerLevel(item.itemInstanceId!),
      ),
      childWhenDragging: SizedBox(),
      child: ItemIcon(
        displayHash: item.overrideStyleItemHash ?? item.itemHash!,
        imageSize: size,
        isMasterworked: item.state == ItemState.Masterwork ||
            item.state == const ItemState(5),
        element: Provider.of<ItemProvider>(context).getItemElement(item),
        powerLevel: Provider.of<ItemProvider>(context)
            .getItemPowerLevel(item.itemInstanceId!),
      ),
    );
  }
}
