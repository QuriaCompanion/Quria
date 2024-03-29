import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/collection_filter.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_searchbar_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';
import 'package:quria/presentation/components/misc/page_loader.dart';
import 'package:quria/presentation/screens/collection/collection_mobile_view.dart';
import 'package:quria/presentation/screens/collection/collection_desktop_view.dart';
import 'package:quria/presentation/var/routes.dart';

class CollectionWeaponPage extends StatefulWidget {
  const CollectionWeaponPage({Key? key}) : super(key: key);

  @override
  State<CollectionWeaponPage> createState() => _CollectionWeaponPageState();
}

class _CollectionWeaponPageState extends State<CollectionWeaponPage> {
  late Future<Iterable<DestinyInventoryItemDefinition>> _future;
  late Map<String, DestinyItemSubType> currentFilter;
  @override
  void initState() {
    super.initState();
    _future = DisplayService.getCollectionByType(DestinyItemType.Weapon);
    currentFilter = CollectionFilter.kinetic;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot<Iterable<DestinyInventoryItemDefinition>> snapshot) {
          if (snapshot.hasData) {
            if (isMobile(context)) {
              return Scaffold(
                  drawer: const Burger(), backgroundColor: black, body: CollectionMobileView(items: snapshot.data!));
            } else {
              return ScaffoldSearchbarDesktop(
                body: SingleChildScrollView(
                  child: CollectionDesktopView(items: snapshot.data!),
                ),
                currentRoute: routeCollection,
              );
            }
          } else {
            return const PageLoader();
          }
        });
  }
}
