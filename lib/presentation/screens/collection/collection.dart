import 'dart:async';
import 'dart:convert';
import 'package:bungie_api/enums/destiny_ammunition_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/collection_filter.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/named_item.dart';
import 'package:quria/presentation/components/misc/search_bar.dart';
import 'package:quria/presentation/var/routes.dart';

class CollectionWidget extends StatefulWidget {
  const CollectionWidget({Key? key}) : super(key: key);

  @override
  _CollectionWidgetState createState() => _CollectionWidgetState();
}

class _CollectionWidgetState extends State<CollectionWidget> {
  late DestinyItemSubType currentType;
  late Map<String, DestinyItemSubType> currentFilter;
  late DestinyAmmunitionType currentAmmoType;
  late Future<Iterable<DestinyInventoryItemDefinition>?> _future;
  late String searchName;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    _future = DisplayService().collectionLoop();
    currentType = DestinyItemSubType.AutoRifle;
    currentFilter = CollectionFilter.primary;
    currentAmmoType = DestinyAmmunitionType.Primary;
    searchName = '';
    isLoading = false;
  }

  double filterHeight = 900;
  double filterItemsPadding = 15.0;
  double itemWidth = 150;
  int axisCount = 8;
  @override
  Widget build(BuildContext context) {
    final padding = globalPadding(context);
    final itemListWidth = vw(context) * 0.6;
    final filterWidth = vw(context) * 0.3;
    if (vw(context) < 2200) {
      axisCount = 7;
    }
    if (vw(context) < 1900) {
      axisCount = 6;
    }
    if (vw(context) < 1600) {
      itemWidth = 100;
    }
    if (vw(context) < 1100) {
      axisCount = 5;
    }
    if (vw(context) < 900) {
      axisCount = 4;
    }

    return SingleChildScrollView(
      child: FutureBuilder(
          future: _future,
          builder: (BuildContext context,
              AsyncSnapshot<Iterable<DestinyInventoryItemDefinition>?>
                  snapshot) {
            if (snapshot.hasData) {
              Iterable<DestinyInventoryItemDefinition> filteredData = searchName
                      .isEmpty
                  ? snapshot.data!.where((element) =>
                      element.itemSubType == currentType &&
                      element.equippingBlock?.ammoType == currentAmmoType)
                  : snapshot.data!.where(((element) => utf8
                      .decode(element.displayProperties!.name!.runes.toList())
                      .toLowerCase()
                      .contains(searchName.toLowerCase())));
              if (vw(context) < 850) {
                return mobileView(context, filteredData);
              }
              return Container(
                padding: EdgeInsets.only(
                    left: padding, right: padding, top: padding),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: filterHeight,
                        width: filterWidth,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(filterItemsPadding * 2),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4)),
                                child: SearchBar((searchValue) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Timer(const Duration(milliseconds: 100), () {
                                    setState(() {
                                      isLoading = false;
                                      searchName = searchValue;
                                    });
                                  });
                                }),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (final entry
                                    in CollectionFilter.typeFilters.entries)
                                  InkWell(
                                    onTap: () => setState(() {
                                      currentFilter = entry.value;
                                      currentAmmoType = entry.key;
                                      currentType =
                                          entry.value.values.toList().first;
                                    }),
                                    child: SelectFilterType(
                                      width: filterWidth / 3,
                                      filterLogo: CollectionFilter
                                          .ammoTypeLogo[entry.key]!,
                                      isCurrentFilter:
                                          currentFilter == entry.value,
                                    ),
                                  ),
                              ],
                            ),
                            Column(
                              children: [
                                for (final entry in currentFilter.entries)
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: filterItemsPadding),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentType = entry.value;
                                        });
                                      },
                                      child: SelectFilterWeapon(
                                        filterName: entry.key,
                                        isCurrentFilter:
                                            currentType == entry.value,
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                      if (isLoading)
                        SizedBox(
                            height: filterHeight,
                            width: itemListWidth,
                            child: const Loader())
                      else
                        SingleChildScrollView(
                          child: SizedBox(
                            width: itemListWidth,
                            height: filterHeight,
                            child: GridView.count(
                              childAspectRatio: (itemWidth / (itemWidth * 1.5)),
                              crossAxisCount: axisCount,
                              children: [
                                for (final item in filteredData)
                                  Center(
                                    child: SizedBox(
                                      width: itemWidth,
                                      height: itemWidth * 1.5,
                                      child: InkWell(
                                          onTap: () => Navigator.pushNamed(
                                              context, routeInspect,
                                              arguments: item),
                                          child: NamedItem(
                                            value: item,
                                            width: itemWidth,
                                          )),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        )
                    ]),
              );
            } else {
              return const Loader();
            }
          }),
    );
  }

  Widget mobileView(BuildContext context,
      Iterable<DestinyInventoryItemDefinition> filteredData) {
    double itemListWidth = vw(context) * 0.9;
    if (vw(context) < 500) {
      axisCount = 3;
    }
    if (vw(context) < 350) {
      itemWidth = 75;
    }
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          SearchBar((searchValue) {
            setState(() {
              isLoading = true;
            });
            Timer(const Duration(milliseconds: 100), () {
              setState(() {
                isLoading = false;
                searchName = searchValue;
              });
            });
          }),
          const Text("Filtres",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          if (isLoading)
            SizedBox(
                height: filterHeight,
                width: itemListWidth,
                child: const Loader())
          else
            SingleChildScrollView(
              child: SizedBox(
                width: itemListWidth,
                height: filterHeight,
                child: GridView.count(
                  childAspectRatio: (itemWidth / (itemWidth * 1.5)),
                  crossAxisCount: axisCount,
                  children: [
                    for (final item in filteredData)
                      Center(
                        child: SizedBox(
                          width: itemWidth,
                          height: itemWidth * 1.5,
                          child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, routeInspect,
                                  arguments: item),
                              child: NamedItem(
                                value: item,
                                width: itemWidth,
                              )),
                        ),
                      )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

class SelectFilterWeapon extends StatelessWidget {
  final String filterName;
  final double fontSizeFilter;
  final bool isCurrentFilter;
  const SelectFilterWeapon(
      {Key? key,
      required this.filterName,
      required this.isCurrentFilter,
      this.fontSizeFilter = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: isCurrentFilter
                ? Colors.black.withOpacity(0.6)
                : Colors.black.withOpacity(0.4),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
              child: Text(
            filterName,
            style: TextStyle(color: Colors.white, fontSize: fontSizeFilter),
          )),
        ));
  }
}

class SelectFilterType extends StatelessWidget {
  final String filterLogo;
  final double fontSizeFilter;
  final bool isCurrentFilter;
  final double width;
  const SelectFilterType(
      {Key? key,
      required this.filterLogo,
      required this.isCurrentFilter,
      required this.width,
      this.fontSizeFilter = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
            color: isCurrentFilter
                ? Colors.black.withOpacity(0.6)
                : Colors.black.withOpacity(0.4),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
              child: Image(
            image: NetworkImage(filterLogo),
          )),
        ));
  }
}
