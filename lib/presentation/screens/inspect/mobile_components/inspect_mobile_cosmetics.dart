import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_with_type_name.dart';

class MobileInspectCosmetics extends StatelessWidget {
  final double width;
  const MobileInspectCosmetics({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DestinyItemSocketState> cosmetics = Provider.of<InspectProvider>(context).getCosmeticSockets(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (DestinyItemSocketState socket in cosmetics)
          Padding(
            padding: EdgeInsets.only(bottom: globalPadding(context)),
            child: ItemWithTypeName(
                iconSize: itemSize(context, width),
                item: ManifestService.manifestParsed.destinyInventoryItemDefinition[socket.plugHash]!),
          )
      ],
    );
  }
}
