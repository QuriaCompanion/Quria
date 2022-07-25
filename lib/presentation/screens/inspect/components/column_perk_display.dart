import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_entry_plug_item_randomized_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_item_display.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_modal.dart';

class ColumnPerkDisplay extends StatefulWidget {
  const ColumnPerkDisplay({
    required this.item,
    required this.index,
    required this.selectedPerks,
    required this.width,
    Key? key,
  }) : super(key: key);
  final DestinyInventoryItemDefinition item;
  final int index;
  final InspectHelper selectedPerks;
  final double width;
  @override
  State<ColumnPerkDisplay> createState() => _ColumnPerkDisplayState();
}

class _ColumnPerkDisplayState extends State<ColumnPerkDisplay> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<DestinyItemSocketEntryPlugItemRandomizedDefinition>? sockets = ManifestService
        .manifestParsed
        .destinyPlugSetDefinition[widget.item.sockets!.socketEntries?[widget.index].randomizedPlugSetHash]
        ?.reusablePlugItems;
    return Column(
      children: [
        if (widget.item.sockets?.socketEntries?[widget.index].randomizedPlugSetHash != null)
          for (int i = 0; i < sockets!.length; i++)
            Padding(
              padding: EdgeInsets.symmetric(vertical: globalPadding(context) / 2),
              child: InkWell(
                onTap: () {
                  if (widget.width == vw(context)) {
                    showMaterialModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        expand: false,
                        context: context,
                        builder: (context) {
                          return PerkModal(
                            width: vw(context),
                            perk:
                                ManifestService.manifestParsed.destinyInventoryItemDefinition[sockets[i].plugItemHash]!,
                            onSocketsChanged: (_) {
                              setState(() {
                                selectedIndex = i;
                                switch (widget.index) {
                                  case 1:
                                    widget.selectedPerks.firstColumn = ManifestService
                                        .manifestParsed.destinyInventoryItemDefinition[sockets[i].plugItemHash]!;
                                    break;
                                  case 2:
                                    widget.selectedPerks.secondColumn = ManifestService
                                        .manifestParsed.destinyInventoryItemDefinition[sockets[i].plugItemHash]!;
                                    break;
                                  case 3:
                                    widget.selectedPerks.thirdColumn = ManifestService
                                        .manifestParsed.destinyInventoryItemDefinition[sockets[i].plugItemHash]!;
                                    break;
                                  case 4:
                                    widget.selectedPerks.fourthColumn = ManifestService
                                        .manifestParsed.destinyInventoryItemDefinition[sockets[i].plugItemHash]!;
                                    break;
                                }
                              });
                            },
                          );
                        });
                    return;
                  }
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(
                            width: vw(context) * 0.3,
                            child: PerkModal(
                              width: vw(context) * 0.3,
                              perk: ManifestService
                                  .manifestParsed.destinyInventoryItemDefinition[sockets[i].plugItemHash]!,
                            ),
                          ),
                        );
                      });
                },
                child: PerkItemDisplay(
                  selected: selectedIndex == i,
                  perk: ManifestService.manifestParsed.destinyInventoryItemDefinition[sockets[i].plugItemHash]!,
                  iconSize: itemSize(context, widget.width),
                ),
              ),
            ),
        if (widget.item.sockets?.socketEntries?[widget.index].randomizedPlugSetHash == null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: globalPadding(context) / 2),
            child: InkWell(
              onTap: () {
                if (widget.width == vw(context)) {
                  showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    expand: false,
                    context: context,
                    builder: (context) {
                      return PerkModal(
                        width: vw(context),
                        perk: ManifestService.manifestParsed.destinyInventoryItemDefinition[
                            widget.item.sockets?.socketEntries?[widget.index].singleInitialItemHash]!,
                      );
                    },
                  );
                  return;
                }
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: SizedBox(
                          width: vw(context) * 0.3,
                          child: PerkModal(
                            width: vw(context) * 0.3,
                            perk: ManifestService.manifestParsed.destinyInventoryItemDefinition[
                                widget.item.sockets?.socketEntries?[widget.index].singleInitialItemHash]!,
                          ),
                        ),
                      );
                    });
              },
              child: PerkItemDisplay(
                perk: ManifestService.manifestParsed.destinyInventoryItemDefinition[
                    widget.item.sockets?.socketEntries?[widget.index].singleInitialItemHash]!,
                iconSize: itemSize(context, widget.width),
                selected: true,
              ),
            ),
          )
      ],
    );
  }
}
