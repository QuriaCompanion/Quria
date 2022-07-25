import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/collection_filter.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/presentation/screens/collection/components/select_filter_type.dart';

class CollectionDesktopFilter extends StatelessWidget {
  final List<DestinyInventoryItemDefinition> items;
  final int selectedBucket;
  final Map<String, DestinyItemSubType> currentFilter;
  final DestinyItemSubType selectedSubType;
  final Function(int, Map<String, DestinyItemSubType>, DestinyItemSubType) onFilterChanged;
  const CollectionDesktopFilter({
    required this.selectedBucket,
    required this.currentFilter,
    required this.onFilterChanged,
    required this.selectedSubType,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      width: 10,
    );
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    onFilterChanged(
                      InventoryBucket.kineticWeapons,
                      CollectionFilter.kinetic,
                      selectedSubType,
                    );
                  },
                  child: SelectFilterType(
                    width: 93.333,
                    filterLogo: CollectionFilter.bucketLogo[InventoryBucket.kineticWeapons]!,
                    isCurrentFilter: selectedBucket == InventoryBucket.kineticWeapons,
                  ),
                ),
                spacer,
                InkWell(
                  onTap: () {
                    onFilterChanged(
                      InventoryBucket.energyWeapons,
                      CollectionFilter.energy,
                      selectedSubType,
                    );
                  },
                  child: SelectFilterType(
                    width: 93.333,
                    filterLogo: CollectionFilter.bucketLogo[InventoryBucket.energyWeapons]!,
                    isCurrentFilter: selectedBucket == InventoryBucket.energyWeapons,
                  ),
                ),
                spacer,
                InkWell(
                  onTap: () {
                    onFilterChanged(
                      InventoryBucket.powerWeapons,
                      CollectionFilter.power,
                      selectedSubType,
                    );
                  },
                  child: SelectFilterType(
                    width: 93.333,
                    filterLogo: CollectionFilter.bucketLogo[InventoryBucket.powerWeapons]!,
                    isCurrentFilter: selectedBucket == InventoryBucket.powerWeapons,
                  ),
                ),
              ],
            ),
          ),
          for (final entry in currentFilter.entries)
            Container(
              margin: const EdgeInsets.only(top: 16),
              width: 300,
              height: 72,
              decoration: BoxDecoration(
                  color: blackLight,
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: selectedSubType == entry.value ? Colors.white : Colors.transparent, width: 1)),
              child: InkWell(
                onTap: () {
                  onFilterChanged(
                    selectedBucket,
                    currentFilter,
                    entry.value,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textH3(entry.key, utf8: false),
                      textCaptionBold(
                          '${items.where((element) => entry.value == element.itemSubType && element.inventory?.bucketTypeHash == selectedBucket && element.inventory?.tierType != TierType.Exotic).length}',
                          color: greyLight)
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
