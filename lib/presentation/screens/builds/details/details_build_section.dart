import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

class DetailsBuildSection extends ConsumerWidget {
  const DetailsBuildSection({
    required this.bucketHash,
    required this.width,
    Key? key,
  }) : super(key: key);

  final int bucketHash;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(detailBuildEquippedItemProvider(bucketHash));
    final itemComponent = ref.watch(itemByInstanceIdProvider(item?.instanceId));
    return SizedBox(
      width: width,
      child: Row(
        children: [
          if (itemComponent != null && item != null && bucketHash != InventoryBucket.subclass)
            ItemComponentDisplayBuild(
              item: itemComponent,
              itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
              elementIcon: ref.watch(itemElementProvider(itemComponent)),
              powerLevel: ref.watch(itemPowerLevelProvider(item.instanceId)),
              width: width,
              perks: item.mods,
              isSubclass: false,
              callback: () {
                ref.read(inspectProvider.notifier).setInspectItem(
                    itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
                    item: itemComponent);
                if (isMobile(context)) {
                  Navigator.pushNamed(context, routeInspectMobile);
                } else {
                  showDialog(
                      context: context,
                      barrierColor: const Color.fromARGB(110, 0, 0, 0),
                      builder: (context) {
                        return desktopItemModal(context, ref,
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
