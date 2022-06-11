import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/collection/collection_item/collection_item_mobile_view.dart';

class CollectionItemPage extends StatefulWidget {
  final int itemHash;
  const CollectionItemPage({required this.itemHash, Key? key})
      : super(key: key);

  @override
  State<CollectionItemPage> createState() => _CollectionItemPageState();
}

class _CollectionItemPageState extends State<CollectionItemPage> {
  late Future<DestinyInventoryItemDefinition?> _future;
  @override
  void initState() {
    super.initState();
    _future = DisplayService().getCollectionItem(widget.itemHash);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder:
          ((context, AsyncSnapshot<DestinyInventoryItemDefinition?> snapshot) {
        if (snapshot.hasData) {
          if (vw(context) < 1000) {
            return ScaffoldBurgerAndBackOption(
                width: vw(context),
                body: CollectionItemMobileView(data: snapshot.data!));
          } else {
            return Container();
          }
        } else {
          return Container(
              height: vh(context),
              width: vw(context),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: splashBackground)),
              child: Loader(
                splashColor: Colors.transparent,
                animationSize: vw(context) * 0.5,
              ));
        }
      }),
    );
  }
}
