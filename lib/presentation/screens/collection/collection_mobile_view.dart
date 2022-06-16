import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/collection_filter.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/presentation/components/misc/mobile_components/character_appbar.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_item_section.dart';

class CollectionMobileView extends StatefulWidget {
  final Iterable<DestinyInventoryItemDefinition> items;
  const CollectionMobileView({required this.items, Key? key}) : super(key: key);

  @override
  State<CollectionMobileView> createState() => _CollectionMobileViewState();
}

class _CollectionMobileViewState extends State<CollectionMobileView> {
  late Map<String, DestinyItemSubType> currentFilter;
  late int selectedBucket;
  late List<DestinyInventoryItemDefinition> sortedItems;
  @override
  void initState() {
    super.initState();
    currentFilter = CollectionFilter.kinetic;
    selectedBucket = InventoryBucket.kineticWeapons;
    sortedItems = widget.items.toList();
    sortedItems.sort((a, b) =>
        b.inventory!.tierType!.index.compareTo(a.inventory!.tierType!.index));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: ScrollController(),
      slivers: [
        CharacterAppbar(onCharacterChange: (i) {}),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  mobileHeader(
                    context,
                    image: collectionHeader,
                    child: textH1(
                      AppLocalizations.of(context)!.weapons,
                      utf8: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: globalPadding(context),
                        bottom: globalPadding(context) * 2),
                    child: SizedBox(
                      height: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  currentFilter = CollectionFilter.kinetic;
                                  selectedBucket =
                                      InventoryBucket.kineticWeapons;
                                });
                              },
                              child: MobileNavItem(
                                selected: selectedBucket ==
                                    InventoryBucket.kineticWeapons,
                                value: AppLocalizations.of(context)!.kinetic,
                                width: vw(context) * 0.29,
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  currentFilter = CollectionFilter.energy;
                                  selectedBucket =
                                      InventoryBucket.energyWeapons;
                                });
                              },
                              child: MobileNavItem(
                                selected: selectedBucket ==
                                    InventoryBucket.energyWeapons,
                                value: AppLocalizations.of(context)!.energy,
                                width: vw(context) * 0.29,
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
                                value: AppLocalizations.of(context)!.power,
                                width: vw(context) * 0.29,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        ),
        for (final entry in currentFilter.entries)
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: globalPadding(context),
                vertical: globalPadding(context) / 2),
            sliver: CollectionMobileItemSection(
              sectionName: sortedItems
                      .firstWhere(
                          (element) => entry.value == element.itemSubType)
                      .itemTypeDisplayName ??
                  'oopsie woopsie',
              items: sortedItems
                  .where((element) =>
                      entry.value == element.itemSubType &&
                      element.inventory?.bucketTypeHash == selectedBucket &&
                      element.inventory?.tierType != TierType.Exotic)
                  .toList(),
            ),
          )
      ],
    );
  }
}
