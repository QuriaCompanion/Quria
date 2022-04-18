import 'package:bungie_api/models/destiny_item_socket_entry_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_mod_icon_display.dart';
import 'package:quria/presentation/screens/inspect/components/armor_mod_modal.dart';

class ModsMobileSection extends StatelessWidget {
  final List<DestinyInventoryItemDefinition?> items;
  final List<DestinyItemSocketEntryDefinition> scoketEntries;
  final void Function(DestinyInventoryItemDefinition, int) onChange;
  const ModsMobileSection(
      {required this.items,
      required this.scoketEntries,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var item in items.asMap().entries)
          if (item.value != null)
            Padding(
              padding: EdgeInsets.only(
                  top: globalPadding(context) / 2,
                  bottom: globalPadding(context) / 2,
                  right: globalPadding(context)),
              child: InkWell(
                onTap: () {
                  showMaterialModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      expand: false,
                      context: context,
                      builder: (context) {
                        return ArmorModsModal(
                          socket: item.value!,
                          plugSetsHash:
                              scoketEntries[item.key].reusablePlugSetHash!,
                          onSocketChange: (itemHash) {
                            onChange(
                                ManifestService.manifestParsed
                                    .destinyInventoryItemDefinition[itemHash]!,
                                item.key);
                          },
                        );
                      });
                },
                child: ArmorModIconDisplay(
                    iconSize: mobileItemSize(context), socket: item.value!),
              ),
            ),
      ],
    );
  }
}
