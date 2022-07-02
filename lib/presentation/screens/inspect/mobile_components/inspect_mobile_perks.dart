import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_perk_column.dart';

class InspectMobilePerks extends StatefulWidget {
  final double width;
  const InspectMobilePerks({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<InspectMobilePerks> createState() => _InspectMobilePerksState();
}

class _InspectMobilePerksState extends State<InspectMobilePerks> {
  @override
  Widget build(BuildContext context) {
    List<DestinyItemSocketState> sockets = Provider.of<InspectProvider>(context).getSockets(context);
    Map<String, List<DestinyItemPlugBase>> plugs = Provider.of<InspectProvider>(context).getPlugs(context);
    List<List<DestinyInventoryItemDefinition>> perks = ProfileService().getItemPerksAsItemDef(plugs, sockets);
    DestinyItemComponent item = Provider.of<InspectProvider>(context).item!;

    String characterId = Provider.of<InventoryProvider>(context).getItemOwner(item.itemInstanceId!) ??
        Provider.of<CharactersProvider>(context).currentCharacter!.characterId!;

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
                  Provider.of<ItemProvider>(context).setNewSockets(item.itemInstanceId!, newSockets);
                },
                instanceId: item.itemInstanceId,
                characterId: characterId,
                perkColumn: perks[i],
                sockets: sockets),
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
