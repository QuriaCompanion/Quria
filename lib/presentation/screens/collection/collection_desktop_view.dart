import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/constants/web_widgets.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/collection_filter.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/screens/collection/collection_item/collection_item_mobile_view.dart';
import 'package:quria/presentation/screens/collection/components/collection_desktop_filter.dart';

class CollectionDesktopView extends StatefulWidget {
  final Iterable<DestinyInventoryItemDefinition> items;

  const CollectionDesktopView({required this.items, Key? key}) : super(key: key);

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
    sortedItems.sort((a, b) {
      final int tier = b.inventory!.tierType!.index.compareTo(a.inventory!.tierType!.index);
      if (tier != 0) return tier;
      final int damage = a.defaultDamageType!.index.compareTo(b.defaultDamageType!.index);
      if (damage != 0) return damage;
      final int name = a.displayProperties!.name!.compareTo(b.displayProperties!.name!);
      return name;
    });
  }

  @override
  Widget build(BuildContext context) {
    double borderRadius = 8;
    List<DestinyInventoryItemDefinition> items = sortedItems
        .where((element) =>
            selectedSubType == element.itemSubType &&
            element.inventory?.tierType != TierType.Exotic &&
            DisplayService.isItemItemActive(context, element))
        .toList();
    return SingleChildScrollView(
      child: Column(
        children: [
          webHeader(
            context,
            image: collectionHeader,
            child: textDesktopTitle("Collection"),
          ),
          Container(
            width: vw(context),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                // Padding(
                //   padding:
                //       EdgeInsets.only(top: globalPadding(context), bottom: 50),
                //   child: SizedBox(
                //     height: 45,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         InkWell(
                //             onTap: () {
                //               setState(() {
                //                 currentFilter = CollectionFilter.kinetic;
                //                 selectedBucket = InventoryBucket.kineticWeapons;
                //               });
                //             },
                //             child: MobileNavItem(
                //               selected: selectedBucket ==
                //                   InventoryBucket.kineticWeapons,
                //               value: "Cinétique",
                //               width: vw(context) * 0.10,
                //             )),
                //         InkWell(
                //             onTap: () {
                //               setState(() {
                //                 currentFilter = CollectionFilter.energy;
                //                 selectedBucket = InventoryBucket.energyWeapons;
                //               });
                //             },
                //             child: MobileNavItem(
                //               selected: selectedBucket ==
                //                   InventoryBucket.energyWeapons,
                //               value: "Énergétique",
                //               width: vw(context) * 0.10,
                //             )),
                //         InkWell(
                //             onTap: () {
                //               setState(() {
                //                 currentFilter = CollectionFilter.power;
                //                 selectedBucket = InventoryBucket.powerWeapons;
                //               });
                //             },
                //             child: MobileNavItem(
                //               selected: selectedBucket ==
                //                   InventoryBucket.powerWeapons,
                //               value: "Puissante",
                //               width: vw(context) * 0.10,
                //             )),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: globalPadding(context),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CollectionDesktopFilter(
                        items: sortedItems,
                        selectedBucket: selectedBucket,
                        selectedSubType: selectedSubType,
                        currentFilter: currentFilter,
                        onFilterChanged: (bucket, filter, subtype) {
                          setState(() {
                            currentFilter = filter;
                            if (bucket != selectedBucket) {
                              selectedBucket = bucket;
                              selectedSubType = currentFilter.values.first;
                            } else {
                              selectedSubType = subtype;
                            }
                          });
                        }),
                    const Spacer(),
                    SingleChildScrollView(
                      child: SizedBox(
                        width: vw(context) - (globalPadding(context) * 2) - 400,
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 400,
                            mainAxisExtent: 100,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Provider.of<InspectProvider>(context, listen: false)
                                    .setInspectItem(itemDef: items[index]);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return desktopCollectionModal(
                                      context,
                                      child: CollectionItemMobileView(data: items[index], width: modalWidth(context)),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: blackLight,
                                  borderRadius: BorderRadius.circular(borderRadius),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    ItemIcon(displayHash: items[index].hash!, imageSize: 80),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 200, child: textH2(items[index].displayProperties!.name!)),
                                        Row(
                                          children: [
                                            Image(
                                              filterQuality: FilterQuality.high,
                                              image: CachedNetworkImageProvider(
                                                  '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyDamageTypeDefinition[items[index].defaultDamageTypeHash]!.displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}123456'),
                                              height: 15,
                                              width: 15,
                                              fit: BoxFit.fill,
                                            ),
                                            const SizedBox(width: 5),
                                            SizedBox(
                                                width: 180,
                                                child: textCaption(items[index].itemTypeAndTierDisplayName!,
                                                    color: greyLight)),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
