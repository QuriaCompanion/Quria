import 'package:bungie_api/destiny2.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
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
            InkWell(
              onTap: () {
                showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    expand: false,
                    context: context,
                    builder: (context) {
                      return ArmorModModal(
                        socket: item.value!,
                        plugSetsHash:
                            scoketEntries[item.key].reusablePlugSetHash!,
                        onSocketChange: (itemHash) {
                          onChange(
                              ManifestService.manifestParsed
                                  .destinyInventoryItemDefinition![itemHash]!,
                              item.key);
                        },
                      );
                    });
              },
              child: pictureBordered(
                  image: NetworkImage(DestinyData.bungieLink +
                      item.value!.displayProperties!.icon!)),
            ),
      ],
    );
  }
}
