import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_item_display.dart';

class ItemComponentDisplayPerksBuild extends StatelessWidget {
  final List<int> perks;
  final double width;
  final DestinyInventoryItemDefinition itemDef;
  const ItemComponentDisplayPerksBuild({
    required this.perks,
    required this.width,
    required this.itemDef,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double smallIconSize = width == vw(context) ? width / 11.9 : 60;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (itemDef.itemType == DestinyItemType.Weapon)
          for (int perk in perks)
            Container(
                width: smallIconSize,
                height: smallIconSize,
                margin: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: PerkItemDisplay(
                  selected: true,
                  perk: ManifestService.manifestParsed.destinyInventoryItemDefinition[perk]!,
                  iconSize: smallIconSize,
                ))
        else
          for (int perk in perks)
            Container(
              width: smallIconSize,
              height: smallIconSize,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: Image(
                image: NetworkImage(DestinyData.bungieLink +
                    ManifestService.manifestParsed.destinyInventoryItemDefinition[perk]!.displayProperties!.icon!),
              ),
            ),
      ],
    );
  }
}
