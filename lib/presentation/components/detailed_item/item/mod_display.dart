import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_sandbox_perk_definition.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_mod_icon_display.dart';

class ModDisplay extends StatelessWidget {
  final double padding;
  final double iconSize;
  final double width;
  final DestinyInventoryItemDefinition item;
  const ModDisplay({
    Key? key,
    required this.iconSize,
    required this.item,
    required this.width,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinySandboxPerkDefinition? perkItem;
    if (item.perks != null && item.perks!.isNotEmpty) {
      perkItem = ManifestService.manifestParsed.destinySandboxPerkDefinition[item.perks?[0].perkHash];
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ArmorModIconDisplay(iconSize: iconSize, socket: item),
        SizedBox(width: padding),
        Expanded(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBodyRegular(item.displayProperties!.name!),
                textCaption(perkItem?.displayProperties?.description ?? item.displayProperties?.description ?? "",
                    color: greyLight),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
