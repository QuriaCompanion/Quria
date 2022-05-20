import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/constants/web_widgets.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/collection_filter.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';

class CollectionWebView extends StatefulWidget {
  final Iterable<DestinyInventoryItemDefinition> items;

  const CollectionWebView({required this.items, Key? key}) : super(key: key);

  @override
  State<CollectionWebView> createState() => _CollectionWebViewState();
}

class _CollectionWebViewState extends State<CollectionWebView> {
  late Map<String, DestinyItemSubType> currentFilter;
  late DestinyItemSubType currentType;
  late int selectedBucket;
  late List<DestinyInventoryItemDefinition> sortedItems;
  @override
  void initState() {
    super.initState();
    currentFilter = CollectionFilter.primary;
    selectedBucket = InventoryBucket.kineticWeapons;
    currentType = DestinyItemSubType.AutoRifle;
    sortedItems = widget.items.toList();
    sortedItems.sort((a, b) =>
        b.inventory!.tierType!.index.compareTo(a.inventory!.tierType!.index));
  }

  @override
  Widget build(BuildContext context) {
    double borderRadius = 8;

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
                                currentFilter = CollectionFilter.primary;
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
                                currentFilter = CollectionFilter.special;
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
                                currentFilter = CollectionFilter.heavy;
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
                    Column(
                      children: [
                        Row(children: [
                          InkWell(
                              child: Container(
                                  width: 96,
                                  height: 96,
                                  decoration: BoxDecoration(
                                      color: blackLight,
                                      borderRadius:
                                          BorderRadius.circular(borderRadius)),
                                  child: const Image(
                                    image: modsHeader,
                                  ))),
                          const SizedBox(width: 8),
                          InkWell(
                              child: Container(
                                  width: 96,
                                  height: 96,
                                  decoration: BoxDecoration(
                                      color: blackLight,
                                      borderRadius:
                                          BorderRadius.circular(borderRadius)),
                                  child: const Image(
                                    image: modsHeader,
                                  ))),
                          const SizedBox(width: 8),
                          InkWell(
                              child: Container(
                                  width: 96,
                                  height: 96,
                                  decoration: BoxDecoration(
                                      color: blackLight,
                                      borderRadius:
                                          BorderRadius.circular(borderRadius)),
                                  child: const Image(
                                    image: modsHeader,
                                  )))
                        ]),
                        Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.all(24),
                            width: 306,
                            height: 72,
                            decoration: BoxDecoration(
                                color: blackLight,
                                borderRadius:
                                    BorderRadius.circular(borderRadius)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textH3('Fusils auto'),
                                textCaptionBold('0/10', color: greyLight)
                              ],
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.all(24),
                            width: 306,
                            height: 72,
                            decoration: BoxDecoration(
                                color: blackLight,
                                borderRadius:
                                    BorderRadius.circular(borderRadius)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textH3('Fusils auto'),
                                textCaptionBold('0/10', color: greyLight)
                              ],
                            ))
                      ],
                    ),
                    SizedBox(width: 24),
                    Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          width: 512,
                          height: 88,
                          decoration: BoxDecoration(
                              color: blackLight,
                              borderRadius:
                                  BorderRadius.circular(borderRadius)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(width: 56, height: 56, image: modsHeader),
                              SizedBox(width: 12),
                              Text(
                                'arme name',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
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
