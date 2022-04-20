import 'package:bungie_api/destiny2.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_modal.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/var/routes.dart';

class VaultMobileSection extends StatefulWidget {
  final List<DestinyItemComponent> vaultItems;
  final int bucketHash;
  final void Function() onTransfer;
  const VaultMobileSection(
      {required this.vaultItems,
      required this.bucketHash,
      required this.onTransfer,
      Key? key})
      : super(key: key);

  @override
  State<VaultMobileSection> createState() => _VaultMobileSectionState();
}

class _VaultMobileSectionState extends State<VaultMobileSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
      child: mobileSection(
        context,
        title: ManifestService
                .manifestParsed
                .destinyInventoryBucketDefinition[widget.bucketHash]
                ?.displayProperties
                ?.name ??
            'error',
        child: Wrap(
          spacing: globalPadding(context),
          runSpacing: globalPadding(context),
          alignment: WrapAlignment.start,
          children: [
            for (DestinyItemComponent item in widget.vaultItems)
              InkWell(
                onTap: (() {
                  showMaterialModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return ItemModal(
                          item: item,
                          onClick: (inspect) {
                            Navigator.pushNamed(context, routeInspectMobile,
                                    arguments: inspect)
                                .then((_) => setState(() {}));
                          },
                          onTransfer: () => widget.onTransfer(),
                        );
                      });
                }),
                child: ItemIcon(
                  displayHash: item.overrideStyleItemHash ?? item.itemHash!,
                  imageSize: vw(context) * 0.148,
                  element: DestinyData.bungieLink +
                      ProfileService().getItemElement(item),
                  powerLevel:
                      ProfileService().getItemPowerLevel(item.itemInstanceId!),
                ),
              )
          ],
        ),
      ),
    );
  }
}
