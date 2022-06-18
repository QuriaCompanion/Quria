import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/constants/web_widgets.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/collection_filter.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/collection/components/collection_desktop_filter.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_item_line.dart';

class CollectionDesktopView extends StatefulWidget {
  final Iterable<DestinyInventoryItemDefinition> items;

  const CollectionDesktopView({required this.items, Key? key})
      : super(key: key);

  @override
  State<CollectionDesktopView> createState() => _CollectionDesktopViewState();
}

class _CollectionDesktopViewState extends State<CollectionDesktopView> {
  late Map<String, DestinyItemSubType> currentFilter;
  late DestinyItemSubType selectedSubType;
  late int selectedBucket;
  late List<DestinyInventoryItemDefinition> sortedItems;
  @override
  void initState() {
    super.initState();
    currentFilter = CollectionFilter.kinetic;
    selectedSubType = currentFilter.values.first;
    selectedBucket = InventoryBucket.kineticWeapons;
    sortedItems = widget.items.toList();
    sortedItems.sort((a, b) =>
        b.inventory!.tierType!.index.compareTo(a.inventory!.tierType!.index));
  }

  @override
  Widget build(BuildContext context) {
    double borderRadius = 8;
    List<DestinyInventoryItemDefinition> items = sortedItems
        .where((element) =>
            selectedSubType == element.itemSubType &&
            element.inventory?.bucketTypeHash == selectedBucket &&
            element.inventory?.tierType != TierType.Exotic)
        .toList();
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            webHeader(
              context,
              image: collectionHeader,
              child: textH1("Collection"),
            ),
            Container(
              width: vw(context),
              height: vh(context),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      image: splashBackgroundWeb)),
              child: Column(children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: globalPadding(context), bottom: 50),
                  child: SizedBox(
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                currentFilter = CollectionFilter.kinetic;
                                selectedBucket = InventoryBucket.kineticWeapons;
                              });
                            },
                            child: MobileNavItem(
                              selected: selectedBucket ==
                                  InventoryBucket.kineticWeapons,
                              value: "Cinétique",
                              width: vw(context) * 0.10,
                            )),
                        InkWell(
                            onTap: () {
                              setState(() {
                                currentFilter = CollectionFilter.energy;
                                selectedBucket = InventoryBucket.energyWeapons;
                              });
                            },
                            child: MobileNavItem(
                              selected: selectedBucket ==
                                  InventoryBucket.energyWeapons,
                              value: "Énergétique",
                              width: vw(context) * 0.10,
                            )),
                        InkWell(
                            onTap: () {
                              setState(() {
                                currentFilter = CollectionFilter.power;
                                selectedBucket = InventoryBucket.powerWeapons;
                              });
                            },
                            child: MobileNavItem(
                              selected: selectedBucket ==
                                  InventoryBucket.powerWeapons,
                              value: "Puissante",
                              width: vw(context) * 0.10,
                            )),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CollectionDesktopFilter(
                        selectedBucket: selectedBucket,
                        selectedSubType: selectedSubType,
                        currentFilter: currentFilter,
                        onFilterChanged: (bucket, filter, subtype) {
                          setState(() {
                            currentFilter = filter;
                            selectedBucket = bucket;
                            selectedSubType = subtype;
                          });
                        }),
                    SingleChildScrollView(
                      child: SizedBox(
                        width: (vw(context) - 600),
                        height: 2000,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: (vw(context) - 600) / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return CollectionItemLine(
                                item: items[index],
                                width: (vw(context) - 600) / 2,
                              );
                            }),
                      ),
                    )
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
