import 'package:bungie_api/enums/destiny_ammunition_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/collection_filter.enum.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/named_item.dart';

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

  @override
  void initState() {
    super.initState();
    _future = DisplayService().collectionLoop();
    currentType = DestinyItemSubType.AutoRifle;
    currentFilter = CollectionFilter.primary;
    currentAmmoType = DestinyAmmunitionType.Primary;
  }

  @override
  Widget build(BuildContext context) {
    final itemListWidth = MediaQuery.of(context).size.width * 0.6;
    final filterWidth = MediaQuery.of(context).size.width * 0.3;
    double filterItemsPadding = 15.0;
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      decoration: ghostBackground,
      child: FutureBuilder(
          future: _future,
          builder: (BuildContext context,
              AsyncSnapshot<Iterable<DestinyInventoryItemDefinition>?>
                  snapshot) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: filterWidth,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (final entry
                              in CollectionFilter.typeFilters.entries)
                            InkWell(
                              onTap: () => setState(() {
                                currentFilter = entry.value;
                                currentAmmoType = entry.key;
                                currentType = entry.value.values.toList().first;
                              }),
                              child: SelectFilterType(
                                width: filterWidth / 3,
                                filterLogo:
                                    CollectionFilter.ammoTypeLogo[entry.key]!,
                                isCurrentFilter: currentFilter == entry.value,
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
                                  isCurrentFilter: currentType == entry.value,
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    width: itemListWidth,
                    child: Wrap(
                      children: [
                        for (final item in snapshot.data!.where((element) =>
                            element.itemSubType == currentType &&
                            element.equippingBlock?.ammoType ==
                                currentAmmoType))
                          NamedItem(value: item)
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
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
            color: isCurrentFilter ? Colors.black.withOpacity(0.5) : null,
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
            color: isCurrentFilter ? Colors.black.withOpacity(0.5) : null,
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
