import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_afinity.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_mod_icon_display.dart';
import 'package:quria/presentation/screens/inspect/components/armor_mod_modal.dart';

class ArmorMods extends StatefulWidget {
  final double width;
  const ArmorMods({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<ArmorMods> createState() => _ArmorModsState();
}

class _ArmorModsState extends State<ArmorMods> {
  late List<DestinyItemSocketState> currentSockets;
  @override
  @override
  Widget build(BuildContext context) {
    final DestinyInventoryItemDefinition itemDef = Provider.of<InspectProvider>(context).itemDef!;
    final DestinyItemComponent item = Provider.of<InspectProvider>(context).item!;
    final String characterId = Provider.of<InventoryProvider>(context).getItemOwner(item.itemInstanceId!) ??
        Provider.of<CharactersProvider>(context).currentCharacter!.characterId!;

    final Map<int, DestinyItemSocketState> displayedSockets =
        Provider.of<InspectProvider>(context).getArmorSockets(context);

    final List<DestinyItemSocketState> sockets = Provider.of<InspectProvider>(context).getSockets(context);
    final String afinityIcon = Provider.of<InspectProvider>(context).getAfinityIcon(context)!;
    final int remaining = Provider.of<InspectProvider>(context).getRemainingPoints(context);
    return Column(children: [
      ArmorAfinity(
          width: widget.width,
          afinityIcon: afinityIcon,
          remaining: remaining,
          pointsAvailable: ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition[sockets
                  .firstWhere((element) =>
                      ManifestService
                          .manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier
                          ?.contains('masterworks.stat') ==
                      true)
                  .plugHash]!
              .investmentStats![0]
              .value!),
      SizedBox(height: globalPadding(context)),
      Container(
          padding: EdgeInsets.symmetric(vertical: globalPadding(context)) * 0.875,
          decoration: const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
          width: double.infinity,
          child: Center(
            child: textCaption(
              AppLocalizations.of(context)!.mods_tips,
              utf8: false,
            ),
          )),
      SizedBox(height: globalPadding(context)),
      Row(
        children: [
          for (MapEntry<int, DestinyItemSocketState> socket in displayedSockets.entries)
            Padding(
                padding: socket.key + 1 != displayedSockets.length
                    ? EdgeInsets.only(right: globalPadding(context))
                    : EdgeInsets.zero,
                child: InkWell(
                  onTap: () {
                    showMaterialModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        expand: true,
                        context: context,
                        builder: (context) {
                          return ArmorModsModal(
                            width: vw(context),
                            socket:
                                ManifestService.manifestParsed.destinyInventoryItemDefinition[socket.value.plugHash]!,
                            plugSetsHash: itemDef.sockets!.socketEntries![socket.key].reusablePlugSetHash!,
                            onSocketChange: (itemHash) {
                              BungieApiService()
                                  .insertSocketPlugFree(item.itemInstanceId!, itemHash, socket.key, characterId)
                                  .then((value) {
                                setState(() {
                                  currentSockets = value!.response!.item!.sockets!.data!.sockets!;
                                });
                              });
                            },
                          );
                        });
                  },
                  child: ArmorModIconDisplay(
                    iconSize: itemSize(context, widget.width),
                    socket: ManifestService.manifestParsed.destinyInventoryItemDefinition[socket.value.plugHash]!,
                  ),
                ))
        ],
      )
    ]);
  }
}
