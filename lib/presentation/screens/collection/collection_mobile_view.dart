import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_body.dart';

class CollectionMobileView extends StatefulWidget {
  final Iterable<DestinyInventoryItemDefinition> items;
  const CollectionMobileView({required this.items, Key? key}) : super(key: key);

  @override
  State<CollectionMobileView> createState() => _CollectionMobileViewState();
}

class _CollectionMobileViewState extends State<CollectionMobileView> {
  late String collectionSelected;
  @override
  void initState() {
    super.initState();
    collectionSelected = 'cinétiques';
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: ScrollController(),
      slivers: [
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
                    child: textH1("Armes"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CollectionMobileBody(
                            collectionSelected: collectionSelected),
                      ],
                    ),
                  )
                ],
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }

  // _list(BuildContext context) {
  //   final List<Widget> sections = [];
  //   List<int> bucketHashes = [];
  //   switch (currentFilter) {
  //     case DestinyItemType.Armor:
  //       bucketHashes = InventoryBucket.armorBucketHashes;
  //       break;
  //     case DestinyItemType.Weapon:
  //       bucketHashes = InventoryBucket.weaponBucketHashes;
  //       break;
  //     default:
  //       break;
  //   }
  // }
}
