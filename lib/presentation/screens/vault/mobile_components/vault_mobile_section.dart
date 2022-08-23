import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_modal.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/var/routes.dart';
import 'package:sliver_tools/sliver_tools.dart';

@immutable
class VaultMobileSection extends ConsumerWidget {
  final List<DestinyItemComponent> vaultItems;
  final int bucketHash;
  const VaultMobileSection({required this.vaultItems, required this.bucketHash, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverCrossAxisPadded(
      paddingStart: globalPadding(context),
      paddingEnd: globalPadding(context),
      child: MultiSliver(
        pushPinnedChildren: true,
        children: [
          SliverPinnedHeader(
            child: Container(
              decoration: const BoxDecoration(color: black),
              padding: EdgeInsets.symmetric(vertical: globalPadding(context)),
              child: textH2(ManifestService
                      .manifestParsed.destinyInventoryBucketDefinition[bucketHash]?.displayProperties?.name ??
                  'error'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: vw(context) * 0.148,
              mainAxisSpacing: globalPadding(context),
              crossAxisSpacing: globalPadding(context),
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                DestinyItemComponent item = vaultItems[index];
                return InkWell(
                  onTap: (() {
                    showMaterialModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return ItemModal(
                            width: vw(context),
                            item: item,
                            onClick: (inspect) {
                              ref.read(inspectProvider.notifier).setInspectItem(
                                    itemDef:
                                        ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
                                    item: item,
                                  );
                              Navigator.pushNamed(context, routeInspectMobile, arguments: inspect);
                            },
                          );
                        });
                  }),
                  child: ItemIcon(
                    displayHash: item.overrideStyleItemHash ?? item.itemHash!,
                    imageSize: vw(context) * 0.148,
                    isMasterworked: item.state == ItemState.Masterwork || item.state == const ItemState(5),
                    element: ref.watch(itemElementProvider(item)),
                    powerLevel: ref.watch(itemPowerLevelProvider(item.itemInstanceId)),
                  ),
                );
              },
              childCount: vaultItems.length,
            ),
          ),
        ],
      ),
    );
  }
}
