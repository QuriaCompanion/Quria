import 'package:bungie_api/destiny2.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';

class VaultMobileSection extends StatefulWidget {
  final List<DestinyItemComponent> vaultItems;
  final int bucketHash;
  const VaultMobileSection(
      {required this.vaultItems, required this.bucketHash, Key? key})
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
                .destinyInventoryBucketDefinition?[widget.bucketHash]
                ?.displayProperties
                ?.name ??
            'error',
        child: Wrap(
          spacing: globalPadding(context),
          runSpacing: globalPadding(context),
          alignment: WrapAlignment.start,
          children: [
            for (DestinyItemComponent item in widget.vaultItems)
              ItemIcon(
                  displayHash: item.overrideStyleItemHash ?? item.itemHash!,
                  imageSize: vw(context) / 6.69)
          ],
        ),
      ),
    );
  }
}
