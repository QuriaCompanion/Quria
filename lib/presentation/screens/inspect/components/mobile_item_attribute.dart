import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_column_perk_display.dart';

class MobileItemAttributes extends StatefulWidget {
  final Map<String, List<DestinyItemPlugBase>>? plugs;
  final List<DestinyItemSocketState>? sockets;
  final String? instanceId;
  const MobileItemAttributes(
      {required this.sockets, required this.plugs, this.instanceId, Key? key})
      : super(key: key);

  @override
  State<MobileItemAttributes> createState() => _MobileItemAttributesState();
}

class _MobileItemAttributesState extends State<MobileItemAttributes> {
  List<DestinyItemSocketState>? currentSockets;
  @override
  void initState() {
    super.initState();
    currentSockets = widget.sockets;
  }

  @override
  Widget build(BuildContext context) {
    List<List<DestinyInventoryItemDefinition>> perks =
        ProfileService().getItemPerksAsItemDef(widget.plugs, currentSockets);

    return mobileSection(context, title: 'Attributs', children: [
      Container(
          padding:
              EdgeInsets.symmetric(vertical: globalPadding(context)) * 0.875,
          decoration: const BoxDecoration(
              color: blackLight,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: double.infinity,
          child: Center(
            child: textCaption(
                'Taper pour plus de dÃ©tails, maintenir pour Ã©quiper'),
          )),
      SizedBox(height: globalPadding(context)),
      Builder(builder: (context) {
        List<Widget> list = <Widget>[];
        for (int i = 0; i < perks.length; i++) {
          list.add(Padding(
            padding: i != perks.length - 1
                ? EdgeInsets.only(right: globalPadding(context))
                : EdgeInsets.zero,
            child: MobileColumnPerkDisplay(
                onSocketsChanged: (newSockets) {
                  setState(() {
                    currentSockets = newSockets;
                  });
                },
                instanceId: widget.instanceId,
                perkColumn: perks[i],
                sockets: currentSockets!),
          ));
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: list,
        );
      })
    ]);
  }
}
