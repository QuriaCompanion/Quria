import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_item_display.dart';

class ItemComponentDisplayPerks extends StatelessWidget {
  final List<DestinyItemSocketState> perks;
  final List<DestinyItemSocketState> armorSockets;
  final DestinyInventoryItemDefinition itemDef;
  final List<DestinyItemSocketState> cosmetics;
  final double width;
  const ItemComponentDisplayPerks({
    required this.itemDef,
    required this.perks,
    required this.cosmetics,
    required this.armorSockets,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double smallIconSize = width == vw(context) ? width / 11.9 : 60;
    return Row(
      children: [
        for (DestinyItemSocketState perk in perks)
          Container(
              width: smallIconSize,
              height: smallIconSize,
              margin: const EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: PerkItemDisplay(
                selected: true,
                perk: ManifestService.manifestParsed.destinyInventoryItemDefinition[perk.plugHash]!,
                iconSize: smallIconSize,
              )),
        if (itemDef.itemType == DestinyItemType.Armor)
          for (DestinyItemSocketState socket in armorSockets)
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
                image: NetworkImage(
                    '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyInventoryItemDefinition[socket.plugHash]!.displayProperties!.icon!}?t=123456'),
                filterQuality: FilterQuality.high,
              ),
            ),
        const Spacer(),
        Row(
          children: [
            for (DestinyItemSocketState socket in cosmetics)
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
                  image: NetworkImage(
                      '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyInventoryItemDefinition[socket.plugHash]!.displayProperties!.icon!}?t=123456'),
                  filterQuality: FilterQuality.high,
                ),
              ),
          ],
        )
      ],
    );
  }
}
