import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/detailed_item/item/armor_afinity.dart';
import 'package:quria/presentation/detailed_item/item/armor_mod_icon_display.dart';
import 'package:quria/presentation/screens/inspect/components/armor_mod_modal.dart';

class ArmorMods extends StatefulWidget {
  final List<DestinyItemSocketState> sockets;
  final String? instanceId;
  final DestinyInventoryItemDefinition item;
  final String afinityIcon;
  const ArmorMods(
      {required this.afinityIcon,
      required this.sockets,
      required this.item,
      this.instanceId,
      Key? key})
      : super(key: key);

  @override
  State<ArmorMods> createState() => _ArmorModsState();
}

class _ArmorModsState extends State<ArmorMods> {
  late List<DestinyItemSocketState> currentSockets;
  @override
  void initState() {
    super.initState();
    currentSockets = widget.sockets;
  }

  @override
  Widget build(BuildContext context) {
    final Map<int, DestinyItemSocketState> displayedSockets = currentSockets
        .where((element) =>
            (element.isVisible!) &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.plug
                    ?.plugCategoryHash !=
                2973005342 &&
            !ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition![element.plugHash]!
                .plug!
                .plugCategoryIdentifier!
                .contains('masterworks.stat') &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemType !=
                DestinyItemType.Armor &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemSubType !=
                DestinyItemSubType.Ornament &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.inventory
                    ?.tierType !=
                TierType.Exotic)
        .toList()
        .asMap();
    return Column(children: [
      ArmorAfinity(
          afinityIcon: widget.afinityIcon,
          pointsAvailable: ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition![widget.sockets
                  .firstWhere((element) =>
                      ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition![element.plugHash]
                          ?.plug
                          ?.plugCategoryIdentifier
                          ?.contains('masterworks.stat') ==
                      true)
                  .plugHash]!
              .investmentStats![0]
              .value!),
      SizedBox(height: globalPadding(context)),
      Container(
          padding:
              EdgeInsets.symmetric(vertical: globalPadding(context)) * 0.875,
          decoration: const BoxDecoration(
              color: blackLight,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: double.infinity,
          child: Center(
            child: textCaption('Taper pour Ã©quiper un autre mod'),
          )),
      SizedBox(height: globalPadding(context)),
      Row(
        children: [
          for (MapEntry<int, DestinyItemSocketState> socket
              in displayedSockets.entries)
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
                          return ArmorModModal(
                            socket: ManifestService.manifestParsed
                                    .destinyInventoryItemDefinition![
                                socket.value.plugHash]!,
                            plugSetsHash: widget
                                .item
                                .sockets!
                                .socketEntries![socket.key]
                                .reusablePlugSetHash!,
                            onSocketChange: (itemHash) {
                              BungieApiService()
                                  .insertSocketPlugFree(
                                      widget.instanceId!, itemHash, socket.key)
                                  .then((value) {
                                setState(() {
                                  currentSockets = value!
                                      .response!.item!.sockets!.data!.sockets!;
                                });
                              });
                            },
                          );
                        });
                  },
                  child: ArmorModIconDisplay(
                    iconSize: mobileItemSize(context),
                    socket: ManifestService
                            .manifestParsed.destinyInventoryItemDefinition![
                        socket.value.plugHash]!,
                  ),
                ))
        ],
      )
    ]);
  }
}
