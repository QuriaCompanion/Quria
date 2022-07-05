import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/screens/collection/collection_item/mobile_components/collection_armor_view.dart';
import 'package:quria/presentation/screens/collection/collection_item/mobile_components/collection_weapon_view.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_header.dart';

class CollectionItemMobileView extends StatefulWidget {
  final DestinyInventoryItemDefinition data;
  final double? width;
  const CollectionItemMobileView({
    required this.data,
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  State<CollectionItemMobileView> createState() => _CollectionItemMobileViewState();
}

class _CollectionItemMobileViewState extends State<CollectionItemMobileView> {
  late DestinyInventoryItemDefinition data;
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(
          context,
          image: NetworkImage(DestinyData.bungieLink + data.screenshot!),
          child: InspectMobileHeader(
            name: data.displayProperties!.name!,
            type: data.itemTypeAndTierDisplayName!,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: globalPadding(context), right: globalPadding(context), bottom: globalPadding(context)),
            child: data.itemType == DestinyItemType.Weapon
                ? CollectionWeaponView(width: widget.width ?? vw(context))
                : CollectionArmorView(width: widget.width ?? vw(context)))
      ],
    );
  }
}
