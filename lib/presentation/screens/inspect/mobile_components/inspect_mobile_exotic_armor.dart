import 'package:bungie_api/enums/tier_type.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/mod_display.dart';

class InspectMobileExoticArmor extends StatelessWidget {
  final List<DestinyItemSocketState>? sockets;
  final double width;
  const InspectMobileExoticArmor({
    required this.sockets,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinyInventoryItemDefinition item =
        ManifestService.manifestParsed.destinyInventoryItemDefinition[sockets
            ?.firstWhere((element) =>
                ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition[element.plugHash]
                        ?.plug
                        ?.plugCategoryHash ==
                    1744546145 &&
                ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition[element.plugHash]
                        ?.inventory
                        ?.tierType ==
                    TierType.Exotic)
            .plugHash]!;
    return ModDisplay(
        width:
            vw(context) - globalPadding(context) * 2 - itemSize(context, width),
        iconSize: itemSize(context, width),
        padding: globalPadding(context),
        item: item);
  }
}
