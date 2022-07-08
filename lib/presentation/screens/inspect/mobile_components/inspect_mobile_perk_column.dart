import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_perk_item.dart';

class InspectMobilePerkColumn extends StatefulWidget {
  final List<DestinyInventoryItemDefinition>? perkColumn;
  final List<DestinyItemSocketState> sockets;
  final String? instanceId;
  final String? characterId;
  final double width;
  final Function(List<DestinyItemSocketState>)? onSocketsChanged;
  const InspectMobilePerkColumn({
    required this.perkColumn,
    required this.sockets,
    required this.width,
    required this.characterId,
    this.onSocketsChanged,
    this.instanceId,
    Key? key,
  }) : super(key: key);

  @override
  State<InspectMobilePerkColumn> createState() => _InspectMobilePerkColumnState();
}

class _InspectMobilePerkColumnState extends State<InspectMobilePerkColumn> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.sockets.indexOf(widget.sockets.firstWhere((socket) {
      if (widget.perkColumn != null) {
        for (DestinyInventoryItemDefinition perk in widget.perkColumn!) {
          if (socket.plugHash == perk.hash) {
            return true;
          }
        }
      }
      return false;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.perkColumn != null)
          for (DestinyInventoryItemDefinition perk in widget.perkColumn!)
            Padding(
              padding: EdgeInsets.only(bottom: globalPadding(context) / 2),
              child: InspectMobilePerkItem(
                perk: perk,
                sockets: widget.sockets,
                instanceId: widget.instanceId,
                index: index,
                characterId: widget.characterId,
                onSocketsChanged: widget.onSocketsChanged!,
                width: widget.width,
              ),
            ),
      ],
    );
  }
}
