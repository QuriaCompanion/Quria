import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/inspectSubclassHelper.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/details_build_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/screens/inspect/inspect_item.dart';
import 'package:quria/presentation/var/routes.dart';

class DetailsBuildSection extends StatelessWidget {
  const DetailsBuildSection({
    required this.bucketHash,
    required this.width,
    Key? key,
  }) : super(key: key);

  final int bucketHash;
  final double width;

  @override
  Widget build(BuildContext context) {
    DestinyItemComponent? itemComponent;

    final item = Provider.of<DetailsBuildProvider>(context).getEquippedItemByBucket(bucketHash);
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
                Provider.of<InspectProvider>(context, listen: false).setInspectItem(
                    itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
                    item: Provider.of<InventoryProvider>(context, listen: false).getItemByInstanceId(item.instanceId));
                if (vw(context) < 1000) {
                  Navigator.pushNamed(context, routeInspectMobile);
                } else {
                  showDialog(
                      context: context,
                      barrierColor: const Color.fromARGB(110, 0, 0, 0),
                      builder: (context) {
                        return desktopItemModal(context,
                            child: InspectItem(
                              width: vw(context) * 0.4,
                            ));
                      });
                }
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
          else if (item != null && bucketHash == InventoryBucket.subclass)
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  routeInspectSubclass,
                  arguments: InspectSubclassHelper(
                    isNewSubclass: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash] != null,
                    subclassId: item.instanceId,
                    characterId: Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!,
                  ),
                );
              },
              child: ItemIcon(
                displayHash: Provider.of<InventoryProvider>(context)
                        .getItemByInstanceId(item.instanceId)
                        ?.overrideStyleItemHash ??
                    item.itemHash,
                imageSize: width == vw(context) ? itemSize(context, width) : 80,
              ),
            )
          else if (item != null)
            SizedBox(
              width: width == vw(context) ? itemSize(context, width) : 80,
              height: width == vw(context) ? itemSize(context, width) : 80,
              child: const Icon(
                Icons.question_mark_outlined,
                color: Colors.white,
              ),
            )
          else
            SizedBox(
              width: width == vw(context) ? itemSize(context, width) : 80,
              height: width == vw(context) ? itemSize(context, width) : 80,
            )
        ],
      ),
    );
  }
}
