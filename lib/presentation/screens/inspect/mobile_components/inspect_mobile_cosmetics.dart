import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_with_type_name.dart';

class MobileInspectCosmetics extends StatelessWidget {
  final List<DestinyItemSocketState> sockets;
  final double width;
  const MobileInspectCosmetics({
    required this.sockets,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (DestinyItemSocketState socket in sockets.where((element) =>
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition[element.plugHash]
                    ?.itemType ==
                DestinyItemType.Armor ||
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition[element.plugHash]
                    ?.itemSubType ==
                DestinyItemSubType.Ornament ||
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition[element.plugHash]
                    ?.itemSubType ==
                DestinyItemSubType.Shader))
          Padding(
            padding: EdgeInsets.only(bottom: globalPadding(context)),
            child: ItemWithTypeName(
                iconSize: itemSize(context, width),
                item: ManifestService.manifestParsed
                    .destinyInventoryItemDefinition[socket.plugHash]!),
          )
      ],
    );
  }
}
