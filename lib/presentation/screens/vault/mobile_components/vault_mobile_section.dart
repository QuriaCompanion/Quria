import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_modal.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/var/routes.dart';
import 'package:sliver_tools/sliver_tools.dart';

class VaultMobileSection extends StatefulWidget {
  final List<DestinyItemComponent> vaultItems;
  final int bucketHash;
  const VaultMobileSection({required this.vaultItems, required this.bucketHash, Key? key}) : super(key: key);

  @override
  State<VaultMobileSection> createState() => _VaultMobileSectionState();
}

class _VaultMobileSectionState extends State<VaultMobileSection> {
  @override
  Widget build(BuildContext context) {
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
                      .manifestParsed.destinyInventoryBucketDefinition[widget.bucketHash]?.displayProperties?.name ??
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
                DestinyItemComponent item = widget.vaultItems[index];
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
                              Navigator.pushNamed(context, routeInspectMobile, arguments: inspect);
                            },
                          );
                        });
                  }),
                  child: ItemIcon(
                    displayHash: item.overrideStyleItemHash ?? item.itemHash!,
                    imageSize: vw(context) * 0.148,
                    isMasterworked: item.state == ItemState.Masterwork || item.state == const ItemState(5),
                    element: Provider.of<ItemProvider>(context).getItemElement(item),
                    powerLevel: Provider.of<ItemProvider>(context).getItemPowerLevel(item.itemInstanceId!),
                  ),
                );
              },
              childCount: widget.vaultItems.length,
            ),
          ),
        ],
      ),
    );
  }
}
