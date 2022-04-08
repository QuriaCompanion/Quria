import 'package:bungie_api/destiny2.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_named_description.dart';

class InspectMobileIntrinsics extends StatefulWidget {
  final List<DestinyItemSocketState>? sockets;
  const InspectMobileIntrinsics({required this.sockets, Key? key})
      : super(key: key);

  @override
  State<InspectMobileIntrinsics> createState() =>
      _InspectMobileIntrinsicsState();
}

class _InspectMobileIntrinsicsState extends State<InspectMobileIntrinsics> {
  late List<DestinyItemSocketState> displayedMods;
  @override
  void initState() {
    super.initState();
    displayedMods = widget.sockets!
        .where((element) =>
            element.plugHash != null &&
                ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition?[element.plugHash]
                        ?.displayProperties
                        ?.icon !=
                    null &&
                DestinyData.modCategoryHash.contains(ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![element.plugHash]!
                    .plug!
                    .plugCategoryHash) ||
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![element.plugHash]
                    ?.plug
                    ?.plugStyle ==
                PlugUiStyles.Masterwork ||
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![element.plugHash]
                    ?.plug
                    ?.plugCategoryIdentifier
                    ?.contains('masterworks.stat') ==
                true)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = (vw(context) - ((globalPadding(context)) * 6)) / 5;

    List<Widget> list = <Widget>[];
    for (DestinyItemSocketState socket in displayedMods) {
      list.add(Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: ItemNamedDescription(
            iconSize: iconSize,
            item: ManifestService.manifestParsed
                .destinyInventoryItemDefinition![socket.plugHash]!),
      ));
    }
    return Column(
      children: list,
    );
  }
}
