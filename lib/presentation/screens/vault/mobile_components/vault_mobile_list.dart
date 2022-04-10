import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_section.dart';

class VaultMobileList extends StatelessWidget {
  final List<DestinyItemComponent> data;
  final DestinyItemType currentFilter;
  const VaultMobileList(
      {required this.data, required this.currentFilter, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> sections = [];

    for (int bucketHash in InventoryBucket.weaponBucketHashes) {
      final weapons = data
          .where((element) =>
              ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition?[element.itemHash]
                      ?.itemType ==
                  currentFilter &&
              ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition?[element.itemHash]
                      ?.inventory
                      ?.bucketTypeHash ==
                  bucketHash)
          .toList();
      sections
          .add(VaultMobileSection(vaultItems: weapons, bucketHash: bucketHash));
    }
    // VaultMobileSection(
    //     vaultItems: widget.data.vaultItems
    //         .where((element) =>
    //             ManifestService
    //                 .manifestParsed
    //                 .destinyInventoryItemDefinition?[element.itemHash]
    //                 ?.itemType ==
    //             currentFilter)
    //         .toList());
    return Column(
      children: sections,
    );
  }
}
