import 'dart:developer';

import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_column_perk_display.dart';

class MobileItemAttributes extends StatelessWidget {
  final Map<String, List<DestinyItemPlugBase>>? plugs;
  final List<DestinyItemSocketState>? sockets;
  const MobileItemAttributes(
      {required this.sockets, required this.plugs, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<DestinyInventoryItemDefinition>> perks =
        ProfileService().getItemPerksAsItemDef(plugs!, sockets);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH2("Attributs"),
        const Divider(
          color: blackLight,
          height: 15,
          thickness: 1,
        ),
        textCaption('Taper pour plus de dÃ©tails, maintenir pour Ã©quiper'),
        SizedBox(height: 15),
        Builder(builder: (context) {
          List<Widget> list = <Widget>[];
          for (var perkColumn in perks) {
            list.add(MobileColumnPerkDisplay(
                perkColumn: perkColumn, sockets: sockets!));
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: list,
          );
        })
      ],
    );
  }
}
