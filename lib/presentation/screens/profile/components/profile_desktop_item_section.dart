import 'package:bungie_api/destiny2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/screens/inspect/inspect_item.dart';
import 'package:quria/presentation/screens/profile/components/draggable_inventory_item.dart';

class ProfileDesktopItemSection extends StatefulWidget {
  final ProfileHelper data;
  final int bucket;
  const ProfileDesktopItemSection({
    required this.data,
    required this.bucket,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileDesktopItemSection> createState() => _ProfileDesktopItemSectionState();
}

class _ProfileDesktopItemSectionState extends State<ProfileDesktopItemSection> {
  @override
  Widget build(BuildContext context) {
    List<DestinyItemComponent> characterInventory = Provider.of<InventoryProvider>(context)
        .getCharacterInventoryByBucket(widget.data.selectedCharacter!.characterId!, widget.bucket);

    List<DestinyItemComponent> inventory = Provider.of<InventoryProvider>(context)
        .getVaultInventoryForCharacterByBucket(widget.data.selectedCharacter!.characterId!, widget.bucket);

    DestinyItemComponent equippedItem = Provider.of<InventoryProvider>(context)
        .getCharacterEquipmentByBucket(widget.data.selectedCharacter!.characterId!, widget.bucket);
    double itemSize = 56;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textH2(
              ManifestService
                      .manifestParsed
                      .destinyEquipmentSlotDefinition[ManifestService.manifestParsed
                          .destinyInventoryItemDefinition[equippedItem.itemHash]?.equippingBlock?.equipmentSlotTypeHash]
                      ?.displayProperties
                      ?.name ??
                  "error",
            ),
            SizedBox(
              width: vw(context) * 0.7,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: blackLight,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DragTarget<DestinyItemComponent>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return InkWell(
                        onTap: () {
                          Provider.of<InspectProvider>(context, listen: false).setInspectItem(
                              itemDef:
                                  ManifestService.manifestParsed.destinyInventoryItemDefinition[equippedItem.itemHash]!,
                              item: equippedItem);
                          showDialog(
                              context: context,
                              barrierColor: const Color.fromARGB(110, 0, 0, 0),
                              builder: (context) {
                                return desktopItemModal(context,
                                    child: InspectItem(
                                      width: vw(context) * 0.4,
                                    ));
                              });
                        },
                        child: ItemIcon(
                          displayHash: equippedItem.overrideStyleItemHash ?? equippedItem.itemHash!,
                          imageSize: itemSize,
                          isMasterworked:
                              equippedItem.state == ItemState.Masterwork || equippedItem.state == const ItemState(5),
                          element: Provider.of<ItemProvider>(context).getItemElement(equippedItem),
                          powerLevel:
                              Provider.of<ItemProvider>(context).getItemPowerLevel(equippedItem.itemInstanceId!),
                        ),
                      );
                    },
                    onAccept: (DestinyItemComponent data) {
                      if (data != equippedItem) {
                        BungieActionsService().equipItem(
                          context,
                          itemId: data.itemInstanceId!,
                          characterId:
                              Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!,
                          itemHash: data.itemHash!,
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 16),
                  DragTarget<DestinyItemComponent>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return SizedBox(
                        width: (itemSize * 3) + 16,
                        child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              crossAxisCount: 3,
                            ),
                            itemCount: characterInventory.length,
                            itemBuilder: (context, index) {
                              return DraggableInventoryItem(size: itemSize, item: characterInventory[index]);
                            }),
                      );
                    },
                    onAccept: (DestinyItemComponent data) {
                      if (Provider.of<InventoryProvider>(context, listen: false).getItemOwner(data.itemInstanceId!) !=
                          widget.data.selectedCharacter?.characterId) {
                        BungieActionsService().transferItem(
                            context, data.itemInstanceId!, widget.data.selectedCharacter?.characterId,
                            itemHash: data.itemHash!, stackSize: 1);
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
              padding: const EdgeInsets.all(16),
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
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
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
                  if (Provider.of<InventoryProvider>(context, listen: false).getItemOwner(data.itemInstanceId!) !=
                          null &&
                      Provider.of<InventoryProvider>(context, listen: false).getItemOwner(data.itemInstanceId!) ==
                          widget.data.selectedCharacter?.characterId) {
                    BungieActionsService()
                        .transferItem(context, data.itemInstanceId!, null, itemHash: data.itemHash!, stackSize: 1);
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
