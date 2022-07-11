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
  }) : super(key: key);

  final int bucketHash;

  @override
  Widget build(BuildContext context) {
    DestinyItemComponent? itemComponent;
    openModal() {
      return showMaterialModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: false,
        expand: false,
        context: context,
        builder: (context) {
          return ChooseItemModal(bucketHash: bucketHash);
        },
      );
    }

    onpenSubclassModal() {
      final data = Provider.of<InventoryProvider>(context, listen: false).getSubclassesForCharacter(
          Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!);
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
                subclasses: data,
                onSelect: (subclass) {
                  Navigator.pop(context);
                  final sockets = DisplayService.getSubclassMods(context, subclass.itemInstanceId!);
                  final item =
                      Provider.of<CreateBuildProvider>(context, listen: false).getEquippedItemByBucket(bucketHash);
                  final newItem = Item(
                      itemHash: subclass.itemHash,
                      instanceId: subclass.itemInstanceId,
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

    final item = Provider.of<CreateBuildProvider>(context).getEquippedItemByBucket(bucketHash);
    itemComponent = Provider.of<InventoryProvider>(context).getItemByInstanceId(item?.instanceId ?? "undefined");
    return Container(
      color: blackLight,
      padding: EdgeInsets.all(globalPadding(context)),
      child: Row(
        children: [
          if (item != null && bucketHash != InventoryBucket.subclass)
            InkWell(
              onTap: () {
                openModal();
              },
              child: ItemIcon(
                displayHash: item.itemHash!,
                imageSize: itemSize(context, vw(context)),
                isMasterworked:
                    itemComponent?.state == ItemState.Masterwork || itemComponent?.state == const ItemState(5),
                element: Provider.of<ItemProvider>(context).getItemElement(itemComponent!),
                powerLevel: Provider.of<ItemProvider>(context).getItemPowerLevel(item.instanceId),
              ),
            )
          else if (item != null)
            InkWell(
              onTap: () {
                onpenSubclassModal();
              },
              child: ItemIcon(
                displayHash: item.itemHash!,
                imageSize: itemSize(context, vw(context)),
              ),
            )
          else
            InkWell(
              onTap: () {
                openModal();
              },
              child: SizedBox(
                width: itemSize(context, vw(context)),
                height: itemSize(context, vw(context)),
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
