import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/models/perk.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
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
    if (data.sockets?.socketEntries != null) {
      List<Perk> perks = [];
      for (int index = 0; index < data.sockets!.socketEntries!.length; index++) {
        final perkHash = data.sockets!.socketEntries?[index].singleInitialItemHash;

        if (Conditions.perkSockets(perkHash)) {
          perks.add(Perk(itemHash: perkHash!));
        }
      }
      Map<int, Perk> perkMap = perks.asMap();
      InspectWeaponStatus initStatus = InspectWeaponStatus(
        firstColumn: perkMap.containsKey(0) ? perks[0] : null,
        secondColumn: perkMap.containsKey(1) ? perks[1] : null,
        thirdColumn: perkMap.containsKey(2) ? perks[2] : null,
        fourthColumn: perkMap.containsKey(3) ? perks[3] : null,
        fifthColumn: perkMap.containsKey(4) ? perks[4] : null,
      );
      Provider.of<InspectProvider>(context, listen: false).setInitInspectWeaponStatus(initStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: Column(
        children: [
          mobileHeader(
            context,
            image: NetworkImage('${DestinyData.bungieLink}${data.screenshot!}?t=123456'),
            child: InspectMobileHeader(
              name: data.displayProperties!.name!,
              type: data.itemTypeAndTierDisplayName!,
            ),
            width: widget.width,
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: globalPadding(context), right: globalPadding(context), bottom: globalPadding(context)),
              child: data.itemType == DestinyItemType.Weapon
                  ? CollectionWeaponView(width: widget.width ?? vw(context))
                  : CollectionArmorView(width: widget.width ?? vw(context)))
        ],
      ),
    );
  }
}
