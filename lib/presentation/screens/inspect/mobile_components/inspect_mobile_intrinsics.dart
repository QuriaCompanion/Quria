import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_named_description.dart';

class InspectMobileIntrinsics extends StatelessWidget {
  final double width;
  const InspectMobileIntrinsics({required this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DestinyItemSocketState> displayedMods = Provider.of<InspectProvider>(context).getIntristicsSockets(context);
    final double iconSize = (width - ((globalPadding(context)) * 6)) / 5;

    List<Widget> list = <Widget>[];
    for (DestinyItemSocketState socket in displayedMods) {
      list.add(Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: ItemNamedDescription(
            iconSize: iconSize, item: ManifestService.manifestParsed.destinyInventoryItemDefinition[socket.plugHash]!),
      ));
    }
    return Column(
      children: list,
    );
  }
}
