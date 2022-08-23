import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/models/providers/helpers.dart/inspect_helper.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/screens/inspect/inspect_item.dart';
import 'package:quria/presentation/screens/profile/components/draggable_inventory_item.dart';
import 'package:quria/presentation/var/keys.dart';

class ProfileDesktopItemSection extends ConsumerWidget {
  final ProfileHelper data;
  final int bucket;
  const ProfileDesktopItemSection({
    required this.data,
    required this.bucket,
    Key? key,
  }) : super(key: key);

  final double itemSize = 56;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DestinyItemComponent> characterInventory = ref.watch(characterInventoryByBucketProvider(
      ByCharacterAndBucket(
        characterId: data.selectedCharacter!.characterId!,
        bucketHash: bucket,
      ),
    ));

    final List<DestinyItemComponent> inventory = ref
        .watch(vaultDisplayedInventoryProvider(data.selectedCharacter!.characterId!))
        .where((element) => element.bucketHash == bucket)
        .toList();
    final DestinyItemComponent equippedItem = ref
        .watch(characterEquipmentProvider(data.selectedCharacter!.characterId!))
        .firstWhere((element) => element.bucketHash == bucket);
    final List<DestinyCharacterComponent> characters = ref.watch(charactersProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 288,
              child: textH2(
                ManifestService
                        .manifestParsed
                        .destinyEquipmentSlotDefinition[ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition[equippedItem.itemHash]
                            ?.equippingBlock
                            ?.equipmentSlotTypeHash]
                        ?.displayProperties
                        ?.name ??
                    "error",
              ),
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
                borderRadius: BorderRadius.circular(8),
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
                          ref.read(inspectProvider.notifier).setInspectItem(
                              itemDef:
                                  ManifestService.manifestParsed.destinyInventoryItemDefinition[equippedItem.itemHash]!,
                              item: equippedItem);

                          showDialog(
                              context: context,
                              barrierColor: const Color.fromARGB(110, 0, 0, 0),
                              builder: (context) {
                                return desktopItemModal(context,
                                    child: InspectItem(
                                      width: modalWidth(context),
                                    ));
                              });
                        },
                        child: ItemIcon(
                          displayHash: equippedItem.overrideStyleItemHash ?? equippedItem.itemHash!,
                          imageSize: itemSize,
                          isMasterworked:
                              equippedItem.state == ItemState.Masterwork || equippedItem.state == const ItemState(5),
                          element: ref.watch(itemElementProvider(equippedItem)),
                          isActive: DisplayService.isItemItemActive(ref,
                              ManifestService.manifestParsed.destinyInventoryItemDefinition[equippedItem.itemHash]!),
                          powerLevel: ref.watch(itemPowerLevelProvider(equippedItem.itemInstanceId)),
                        ),
                      );
                    },
                    onAccept: (DestinyItemComponent data) {
                      if (data != equippedItem) {
                        BungieActionsService()
                            .equipItem(
                          context,
                          itemId: data.itemInstanceId!,
                          characterId: characters.first.characterId!,
                          itemHash: data.itemHash!,
                        )
                            .then((_) {
                          ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                            content: textBodyMedium(
                              AppLocalizations.of(context)!.item_equipped,
                              utf8: false,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.green,
                          ));
                        }, onError: (error) {
                          ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                            content: textBodyMedium(
                              AppLocalizations.of(context)!.error_base,
                              utf8: false,
                              color: Colors.white,
                            ),
                            backgroundColor: crucible,
                          ));
                        });
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
                    onAccept: (DestinyItemComponent newItem) {
                      if (ref.read(itemOwnerProvider(newItem.itemInstanceId)) != data.selectedCharacter?.characterId) {
                        BungieActionsService()
                            .transferItem(context, newItem.itemInstanceId!, data.selectedCharacter?.characterId,
                                itemHash: newItem.itemHash!, stackSize: 1)
                            .then((_) {
                          ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
                            SnackBar(
                              content: textBodyMedium(
                                AppLocalizations.of(context)!.item_transfered,
                                utf8: false,
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }, onError: (error) {
                          ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
                            SnackBar(
                              content: textBodyMedium(
                                AppLocalizations.of(context)!.error_base,
                                utf8: false,
                                color: Colors.white,
                              ),
                              backgroundColor: crucible,
                            ),
                          );
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                for (final character in characters.where((element) => element != data.selectedCharacter))
                  DragTarget<DestinyItemComponent>(builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return Container(
                      decoration: BoxDecoration(
                        color: blackLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: CachedNetworkImage(
                        imageUrl: DestinyData.bungieLink + character.emblemPath!,
                        width: itemSize,
                        height: itemSize,
                        fit: BoxFit.cover,
                      ),
                    );
                  }, onAccept: (DestinyItemComponent data) {
                    if (ref.read(itemOwnerProvider(data.itemInstanceId)) != character.characterId) {
                      BungieActionsService()
                          .transferItem(context, data.itemInstanceId!, character.characterId,
                              itemHash: data.itemHash!, stackSize: 1)
                          .then((_) {
                        ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                          content: textBodyMedium(
                            AppLocalizations.of(context)!.item_transfered,
                            utf8: false,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.green,
                        ));
                      }, onError: (error) {
                        ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                          content: textBodyMedium(
                            AppLocalizations.of(context)!.error_base,
                            utf8: false,
                            color: Colors.white,
                          ),
                          backgroundColor: crucible,
                        ));
                      });
                    }
                  })
              ],
            ),
            Container(
              width: vw(context) * 0.7,
              decoration: BoxDecoration(
                color: blackLight,
                borderRadius: BorderRadius.circular(8),
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
                onAccept: (DestinyItemComponent newItem) {
                  final itemOwner = ref.read(itemOwnerProvider(newItem.itemInstanceId));
                  if (itemOwner != null && itemOwner == data.selectedCharacter?.characterId) {
                    BungieActionsService()
                        .transferItem(context, newItem.itemInstanceId!, null, itemHash: newItem.itemHash!, stackSize: 1)
                        .then((_) {
                      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                        content: textBodyMedium(
                          AppLocalizations.of(context)!.item_transfered,
                          utf8: false,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.green,
                      ));
                    }, onError: (error) {
                      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                        content: textBodyMedium(
                          AppLocalizations.of(context)!.error_base,
                          utf8: false,
                          color: Colors.white,
                        ),
                        backgroundColor: crucible,
                      ));
                    });
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
