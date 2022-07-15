import 'package:bungie_api/destiny2.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/builder/subclass/subclass_mobile_view.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
import 'package:quria/presentation/screens/builds/create/choose_item_modal.dart';

class CreateBuildSection extends StatelessWidget {
  const CreateBuildSection({
    Key? key,
    required this.bucketHash,
    required this.width,
  }) : super(key: key);

  final int bucketHash;
  final double width;

  openModal(BuildContext context) {
    if (width < vw(context)) {
      return showDialog(
          context: context,
          builder: (context) => Center(
                child: SizedBox(
                  width: vw(context) * 0.4,
                  height: vh(context) * 0.9,
                  child: ChooseItemModal(
                    bucketHash: bucketHash,
                    width: vw(context) * 0.4,
                  ),
                ),
              ));
    }
    return showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: false,
      expand: false,
      context: context,
      builder: (context) {
        return ChooseItemModal(bucketHash: bucketHash, width: vw(context));
      },
    );
  }

  onpenSubclassModal(BuildContext context) {
    final data = Provider.of<InventoryProvider>(context, listen: false).getSubclassesForCharacter(
        Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!);
    if (width < vw(context)) {
      return showDialog(
        context: context,
        builder: (context) => Center(
          child: Container(
            color: black,
            width: vw(context) * 0.4,
            height: vh(context) * 0.9,
            child: SingleChildScrollView(
              child: SubclassMobileView(
                width: vw(context) * 0.4,
                subclasses: data,
                onSelect: (subclass) {
                  Navigator.pop(context);
                  final sockets = DisplayService.getSubclassMods(context, subclass.itemInstanceId!);
                  final item =
                      Provider.of<CreateBuildProvider>(context, listen: false).getEquippedItemByBucket(bucketHash);
                  final newItem = Item(
                      itemHash: subclass.itemHash!,
                      instanceId: subclass.itemInstanceId!,
                      isEquipped: true,
                      bucketHash: bucketHash,
                      mods: sockets.sockets.where((e) => e.plugHash != null).map((e) => e.plugHash!).toList());
                  if (item != null) {
                    Provider.of<CreateBuildProvider>(context, listen: false).replaceItem(item, newItem);
                  } else {
                    Provider.of<CreateBuildProvider>(context, listen: false).addItem(newItem);
                  }
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: SizedBox(
                          width: vw(context) * 0.4,
                          height: vh(context) * 0.9,
                          child: SingleChildScrollView(
                            child: Container(
                              color: black,
                              child: Column(
                                children: [
                                  SubclassModsMobileView(
                                    width: vw(context) * 0.4,
                                    sockets: sockets.sockets,
                                    subclass: ManifestService
                                        .manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]!,
                                    onChange: (newSockets, i) async {
                                      Provider.of<CreateBuildProvider>(context, listen: false).replaceItem(
                                          newItem,
                                          newItem
                                            ..mods =
                                                newSockets.where((e) => e.hash != null).map((e) => e.hash!).toList());
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(globalPadding(context)),
                                    child: RoundedButton(
                                      width: vw(context),
                                      text: textBodyMedium(
                                        AppLocalizations.of(context)!.save,
                                        color: black,
                                        utf8: false,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
    }
    return showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: black,
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () => Navigator.pop(context),
            child: const Icon(
              Icons.chevron_left,
              color: black,
              size: 35,
            ),
          ),
          body: SingleChildScrollView(
            child: SubclassMobileView(
              width: vw(context),
              subclasses: data,
              onSelect: (subclass) {
                Navigator.pop(context);
                final sockets = DisplayService.getSubclassMods(context, subclass.itemInstanceId!);
                final item =
                    Provider.of<CreateBuildProvider>(context, listen: false).getEquippedItemByBucket(bucketHash);
                final newItem = Item(
                    itemHash: subclass.itemHash!,
                    instanceId: subclass.itemInstanceId!,
                    isEquipped: true,
                    bucketHash: bucketHash,
                    mods: sockets.sockets.where((e) => e.plugHash != null).map((e) => e.plugHash!).toList());
                if (item != null) {
                  Provider.of<CreateBuildProvider>(context, listen: false).replaceItem(item, newItem);
                } else {
                  Provider.of<CreateBuildProvider>(context, listen: false).addItem(newItem);
                }
                showMaterialModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isDismissible: true,
                  expand: true,
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Container(
                        color: black,
                        child: Column(
                          children: [
                            SubclassModsMobileView(
                              width: vw(context),
                              sockets: sockets.sockets,
                              subclass:
                                  ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]!,
                              onChange: (newSockets, i) async {
                                Provider.of<CreateBuildProvider>(context, listen: false).replaceItem(
                                    newItem,
                                    newItem
                                      ..mods = newSockets.where((e) => e.hash != null).map((e) => e.hash!).toList());
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.all(globalPadding(context)),
                              child: RoundedButton(
                                width: vw(context),
                                text: textBodyMedium(
                                  AppLocalizations.of(context)!.save,
                                  color: black,
                                  utf8: false,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DestinyItemComponent? itemComponent;

    final item = Provider.of<CreateBuildProvider>(context).getEquippedItemByBucket(bucketHash);
    itemComponent = Provider.of<InventoryProvider>(context).getItemByInstanceId(item?.instanceId ?? "undefined");
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: blackLight,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(
        width == vw(context) ? globalPadding(context) : 16,
      ),
      child: Row(
        children: [
          if (itemComponent != null && item != null && bucketHash != InventoryBucket.subclass)
            InkWell(
              onTap: () {
                openModal(context);
              },
              child: ItemIcon(
                displayHash: Provider.of<InventoryProvider>(context)
                        .getItemByInstanceId(item.instanceId)
                        ?.overrideStyleItemHash ??
                    item.itemHash,
                imageSize: width == vw(context) ? itemSize(context, width) : 80,
                isMasterworked:
                    itemComponent.state == ItemState.Masterwork || itemComponent.state == const ItemState(5),
                element: Provider.of<ItemProvider>(context).getItemElement(itemComponent),
                powerLevel: Provider.of<ItemProvider>(context).getItemPowerLevel(item.instanceId),
              ),
            )
          else if (itemComponent == null && item != null && bucketHash != InventoryBucket.subclass)
            InkWell(
              onTap: () {
                openModal(context);
              },
              child: SizedBox(
                width: width == vw(context) ? itemSize(context, width) : 80,
                height: width == vw(context) ? itemSize(context, width) : 80,
                child: const Icon(
                  Icons.question_mark_outlined,
                  color: Colors.white,
                ),
              ),
            )
          else if (item != null)
            InkWell(
              onTap: () {
                onpenSubclassModal(context);
              },
              child: ItemIcon(
                displayHash: item.itemHash,
                imageSize: width == vw(context) ? itemSize(context, width) : 80,
              ),
            )
          else
            InkWell(
              onTap: () {
                bucketHash != InventoryBucket.subclass ? openModal(context) : onpenSubclassModal(context);
              },
              child: SizedBox(
                width: width == vw(context) ? itemSize(context, width) : 80,
                height: width == vw(context) ? itemSize(context, width) : 80,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
