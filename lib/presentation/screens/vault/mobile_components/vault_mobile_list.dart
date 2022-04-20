import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_section.dart';

class VaultMobileList extends StatelessWidget {
  final List<DestinyItemComponent> data;
  final DestinyItemType currentFilter;
  final DestinyClass classType;
  final void Function() onTransfer;
  const VaultMobileList({
    required this.data,
    required this.currentFilter,
    required this.classType,
    required this.onTransfer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> sections = [];
    List<int> bucketHashes = [];
    switch (currentFilter) {
      case DestinyItemType.Armor:
        bucketHashes = InventoryBucket.armorBucketHashes;
        break;
      case DestinyItemType.Weapon:
        bucketHashes = InventoryBucket.weaponBucketHashes;
        break;
      default:
        break;
    }

    for (int bucketHash in bucketHashes) {
      final items = data
          .where((element) =>
              ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition[element.itemHash]
                      ?.inventory
                      ?.bucketTypeHash ==
                  bucketHash &&
              (currentFilter == DestinyItemType.Weapon ||
                  ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition[element.itemHash]
                          ?.classType ==
                      classType))
          .toList();
      sections.add(
        VaultMobileSection(
          vaultItems: items,
          bucketHash: bucketHash,
          onTransfer: () => onTransfer(),
        ),
      );
    }

    return Column(
      children: sections,
    );
  }
}
