import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_item_display.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_modal.dart';

class InspectMobilePerkItem extends ConsumerStatefulWidget {
  final DestinyInventoryItemDefinition perk;
  final List<DestinyItemSocketState> sockets;
  final String? characterId;
  final String? instanceId;
  final int index;
  final double width;
  final Function(List<DestinyItemSocketState>) onSocketsChanged;
  const InspectMobilePerkItem({
    required this.perk,
    required this.sockets,
    required this.onSocketsChanged,
    required this.index,
    required this.width,
    this.characterId,
    this.instanceId,
    Key? key,
  }) : super(key: key);

  @override
  InspectMobilePerkItemState createState() => InspectMobilePerkItemState();
}

class InspectMobilePerkItemState extends ConsumerState<InspectMobilePerkItem> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      bool selected = widget.sockets.any((socket) => socket.plugHash == widget.perk.hash);
      return InkWell(
        onTap: () {
          if (vw(context) > 1000) {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: SizedBox(
                        width: vw(context) * 0.25,
                        child: PerkModal(
                          width: vw(context) * 0.25,
                          isSelected: selected,
                          perk: widget.perk,
                          instanceId: widget.instanceId,
                          onSocketsChanged: (newSockets) => widget.onSocketsChanged(newSockets),
                          characterId: widget.characterId,
                          index: widget.index,
                        )),
                  );
                });
            return;
          }
          showMaterialModalBottomSheet(
              backgroundColor: Colors.transparent,
              expand: false,
              context: context,
              builder: (context) {
                return PerkModal(
                  width: vw(context),
                  isSelected: selected,
                  perk: widget.perk,
                  instanceId: widget.instanceId,
                  onSocketsChanged: (newSockets) => widget.onSocketsChanged(newSockets),
                  characterId: widget.characterId,
                  index: widget.index,
                );
              });
        },
        onLongPress: () {
          if (widget.instanceId != null && !selected) {
            setState(() {
              loading = true;
            });
            try {
              BungieApiService()
                  .insertSocketPlugFree(widget.instanceId!, widget.perk.hash!, widget.index,
                      ref.watch(charactersProvider).first.characterId)
                  .then((value) async {
                setState(() {
                  loading = false;
                  widget.onSocketsChanged(value?.response?.item?.sockets?.data?.sockets ?? []);
                });
              });
            } catch (e) {
              setState(() {
                loading = false;
              });
            }
          }
        },
        child: PerkItemDisplay(
            perk: widget.perk, selected: selected, loading: loading, iconSize: itemSize(context, widget.width)),
      );
    });
  }
}
