import 'package:bungie_api/destiny2.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_item_mod_attribute.dart';

class MobileItemOtherAttributes extends StatefulWidget {
  final List<DestinyItemSocketState>? sockets;
  const MobileItemOtherAttributes({required this.sockets, Key? key})
      : super(key: key);

  @override
  State<MobileItemOtherAttributes> createState() =>
      _MobileItemOtherAttributesState();
}

class _MobileItemOtherAttributesState extends State<MobileItemOtherAttributes> {
  late List<DestinyItemSocketState> displayedMods;
  @override
  void initState() {
    super.initState();
    displayedMods = widget.sockets!
        .where((element) =>
            element.plugHash != null &&
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
    final double iconSize =
        (MediaQuery.of(context).size.width - ((globalPadding(context)) * 6)) /
            5;

    List<Widget> list = <Widget>[];
    for (DestinyItemSocketState socket in displayedMods) {
      list.add(Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: MobileItemModAttribute(
            iconSize: iconSize,
            item: ManifestService.manifestParsed
                .destinyInventoryItemDefinition![socket.plugHash]!),
      ));
    }
    list.add(
      const Divider(
        color: blackLight,
        height: 22,
        thickness: 1,
      ),
    );
    return mobileSection(context,
        title: 'Mods et attributs intrinsÃ©ques', children: list);
  }
}
