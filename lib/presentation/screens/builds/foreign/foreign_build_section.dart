import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display_build.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_build_view.dart';
import 'package:quria/presentation/screens/collection/collection_item/collection_item_mobile_view.dart';
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
    return SizedBox(
      width: width,
      child: Row(
        children: [
          if (itemDef?.inventory?.bucketTypeHash == InventoryBucket.subclass)
            ItemComponentDisplayBuild(
              itemDef: itemDef!,
              width: width,
              perks: item?.mods ?? [],
              isSubclass: true,
              callback: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return desktopRegularModal(
                        context,
                        child: SubclassModsBuildView(
                          width: width,
                          sockets: item!.mods,
                          subclass: ManifestService.manifestParsed.destinyInventoryItemDefinition[item!.itemHash]!,
                        ),
                      );
                    });
              },
            )
          else if (itemDef != null)
            ItemComponentDisplayBuild(
              itemDef: itemDef,
              width: width,
              perks: item?.mods ?? [],
              isSubclass: false,
              callback: () {
                Provider.of<InspectProvider>(context, listen: false).setInspectItem(itemDef: itemDef);
                if (isMobile(context)) {
                  Navigator.pushNamed(context, routeCollectionItem, arguments: itemDef.hash);
                } else {
                  showDialog(
                      context: context,
                      barrierColor: const Color.fromARGB(110, 0, 0, 0),
                      builder: (context) {
                        return desktopCollectionModal(context,
                            child: CollectionItemMobileView(data: itemDef, width: modalWidth(context)));
                      });
                }
              },
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
