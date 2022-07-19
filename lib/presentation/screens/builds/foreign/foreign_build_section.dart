import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/models/helpers/inspectSubclassHelper.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/screens/inspect/inspect_item.dart';
import 'package:quria/presentation/var/routes.dart';

class ForeignBuildSection extends StatelessWidget {
  final double width;
  final Item? item;
  const ForeignBuildSection({
    required this.width,
    this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemDef = ManifestService.manifestParsed.destinyInventoryItemDefinition[item?.itemHash];
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
          if (itemDef?.inventory?.bucketTypeHash == InventoryBucket.subclass)
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  routeInspectSubclass,
                  arguments: InspectSubclassHelper(
                    isNewSubclass: ManifestService.manifestParsed.destinyInventoryItemDefinition[itemDef?.hash] != null,
                    subclassId: item!.instanceId,
                    characterId: Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!,
                  ),
                );
              },
              child: ItemIcon(
                displayHash: item!.itemHash,
                imageSize: width == vw(context) ? itemSize(context, width) : 80,
              ),
            )
          else if (itemDef != null)
            InkWell(
              onTap: () {
                Provider.of<InspectProvider>(context, listen: false).setInspectItem(itemDef: itemDef);
                if (vw(context) < 1000) {
                  Navigator.pushNamed(context, routeCollectionItem, arguments: itemDef.hash);
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
                displayHash: itemDef.hash!,
                imageSize: width == vw(context) ? itemSize(context, width) : 80,
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
