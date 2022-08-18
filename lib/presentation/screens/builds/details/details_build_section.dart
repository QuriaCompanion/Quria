import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/details_build_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display_build.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_build_view.dart';
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
    return SizedBox(
      width: width,
      child: Row(
        children: [
          if (itemComponent != null && item != null && bucketHash != InventoryBucket.subclass)
            ItemComponentDisplayBuild(
              item: Provider.of<InventoryProvider>(context).getItemByInstanceId(item.instanceId)!,
              itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
              elementIcon: Provider.of<ItemProvider>(context).getItemElement(itemComponent),
              powerLevel: Provider.of<ItemProvider>(context).getItemPowerLevel(item.instanceId),
              width: width,
              perks: item.mods,
              isSubclass: false,
              callback: () {
                Provider.of<InspectProvider>(context, listen: false).setInspectItem(
                    itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
                    item: Provider.of<InventoryProvider>(context, listen: false).getItemByInstanceId(item.instanceId));
                if (isMobile(context)) {
                  Navigator.pushNamed(context, routeInspectMobile);
                } else {
                  showDialog(
                      context: context,
                      barrierColor: const Color.fromARGB(110, 0, 0, 0),
                      builder: (context) {
                        return desktopItemModal(context,
                            child: InspectItem(
                              width: modalWidth(context),
                            ));
                      });
                }
              },
            )
          else if (item != null && bucketHash == InventoryBucket.subclass)
            ItemComponentDisplayBuild(
              itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
              width: width,
              perks: item.mods,
              isSubclass: true,
              callback: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ScaffoldBurgerAndBackOption(
                        width: vw(context),
                        body: SubclassModsBuildView(
                          sockets: item.mods,
                          subclass: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
                          width: vw(context),
                        ),
                      );
                    });
              },
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
