import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_perk_column.dart';

class InspectMobilePerks extends StatefulWidget {
  final Map<String, List<DestinyItemPlugBase>>? plugs;
  final List<DestinyItemSocketState>? sockets;
  final String? instanceId;
  final String? characterId;
  final double width;
  const InspectMobilePerks({
    required this.sockets,
    required this.plugs,
    required this.width,
    this.characterId,
    this.instanceId,
    Key? key,
  }) : super(key: key);

  @override
  State<InspectMobilePerks> createState() => _InspectMobilePerksState();
}

class _InspectMobilePerksState extends State<InspectMobilePerks> {
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

    return Column(children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: globalPadding(context)) * 0.875,
        decoration: const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
        width: widget.width,
        child: Center(
          child: textCaption(
            AppLocalizations.of(context)!.builder_subclass_mods_caption,
            utf8: false,
          ),
        ),
      ),
      SizedBox(height: globalPadding(context)),
      Builder(builder: (context) {
        List<Widget> list = <Widget>[];
        for (int i = 0; i < perks.length; i++) {
          list.add(Padding(
            padding: i != perks.length - 1 ? EdgeInsets.only(right: globalPadding(context)) : EdgeInsets.zero,
            child: InspectMobilePerkColumn(
                width: widget.width,
                onSocketsChanged: (newSockets) {
                  setState(() {
                    currentSockets = newSockets;
                  });
                },
                instanceId: widget.instanceId,
                characterId: widget.characterId,
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
