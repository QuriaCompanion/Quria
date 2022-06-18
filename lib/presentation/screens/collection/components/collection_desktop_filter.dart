import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/collection_filter.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/presentation/screens/collection/components/select_filter_type.dart';

class CollectionDesktopFilter extends StatelessWidget {
  final int selectedBucket;
  final Map<String, DestinyItemSubType> currentFilter;
  final DestinyItemSubType selectedSubType;
  final Function(int, Map<String, DestinyItemSubType>, DestinyItemSubType)
      onFilterChanged;
  const CollectionDesktopFilter({
    Key? key,
    required this.selectedBucket,
    required this.currentFilter,
    required this.onFilterChanged,
    required this.selectedSubType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      width: 10,
    );
    return Column(
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
                  filterLogo: CollectionFilter
                      .bucketLogo[InventoryBucket.kineticWeapons]!,
                  isCurrentFilter:
                      selectedBucket == InventoryBucket.kineticWeapons,
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
                  filterLogo: CollectionFilter
                      .bucketLogo[InventoryBucket.energyWeapons]!,
                  isCurrentFilter:
                      selectedBucket == InventoryBucket.energyWeapons,
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
                  filterLogo: CollectionFilter
                      .bucketLogo[InventoryBucket.powerWeapons]!,
                  isCurrentFilter:
                      selectedBucket == InventoryBucket.powerWeapons,
                ),
              ),
            ],
          ),
        ),
        for (final entry in currentFilter.entries)
          InkWell(
            onTap: () {
              onFilterChanged(
                selectedBucket,
                currentFilter,
                entry.value,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(24),
              width: 300,
              height: 72,
              decoration: BoxDecoration(
                  color: blackLight, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textH3(entry.key, utf8: false),
                  textCaptionBold('0/10', color: greyLight)
                ],
              ),
            ),
          ),
      ],
    );
  }
}
