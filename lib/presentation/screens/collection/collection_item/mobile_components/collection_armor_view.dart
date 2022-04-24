import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_origin.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class CollectionArmorView extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  const CollectionArmorView({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileSection(context,
            title: "Statistiques", child: InspectMobileStats(item: item)),
        mobileSection(context,
            title: "Obtention",
            child: InspectMobileOrigin(collectionHash: item.collectibleHash)),
        SizedBox(
          height: globalPadding(context) * 3,
        )
      ],
    );
  }
}
