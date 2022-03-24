import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/detailed_item/item/perk_item_display.dart';

class MobileColumnPerkDisplay extends StatefulWidget {
  final List<DestinyInventoryItemDefinition> perkColumn;
  final List<DestinyItemSocketState> sockets;
  const MobileColumnPerkDisplay(
      {required this.perkColumn, required this.sockets, Key? key})
      : super(key: key);

  @override
  State<MobileColumnPerkDisplay> createState() =>
      _MobileColumnPerkDisplayState();
}

class _MobileColumnPerkDisplayState extends State<MobileColumnPerkDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (DestinyInventoryItemDefinition perk in widget.perkColumn)
          Builder(builder: (context) {
            var selected =
                widget.sockets.any((socket) => socket.plugHash == perk.hash);
            return PerkItemDisplay(
                perk: perk,
                selected: selected,
                iconSize: (MediaQuery.of(context).size.width -
                        ((MediaQuery.of(context).size.width * globalPadding) *
                            6)) /
                    5);
          }),
      ],
    );
  }
}
