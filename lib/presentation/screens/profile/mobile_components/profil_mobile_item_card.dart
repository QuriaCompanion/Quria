import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_equipment_slot_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display.dart';

class ProfileMobileItemCard extends StatefulWidget {
  final DestinyItemComponent item;
  final String characterId;
  const ProfileMobileItemCard(
      {Key? key, required this.characterId, required this.item})
      : super(key: key);

  @override
  State<ProfileMobileItemCard> createState() => _ProfileMobileItemCardState();
}

class _ProfileMobileItemCardState extends State<ProfileMobileItemCard> {
  late final DestinyInventoryItemDefinition itemDef;
  late final DestinyEquipmentSlotDefinition itemCategory;

  @override
  Widget build(BuildContext context) {
    final instanceInfo =
        ProfileService().getInstanceInfo(widget.item.itemInstanceId!);
    final DestinyInventoryItemDefinition itemDef = ManifestService
        .manifestParsed.destinyInventoryItemDefinition![widget.item.itemHash]!;
    final DestinyEquipmentSlotDefinition itemCategory =
        ManifestService.manifestParsed.destinyEquipmentSlotDefinition![
            itemDef.equippingBlock!.equipmentSlotTypeHash]!;
    final String? elementIcon = ManifestService
            .manifestParsed
            .destinyDamageTypeDefinition?[itemDef.defaultDamageTypeHash]
            ?.displayProperties
            ?.icon ??
        ManifestService
            .manifestParsed
            .destinyEnergyTypeDefinition?[instanceInfo.energy?.energyTypeHash]
            ?.displayProperties
            ?.icon;

    final int powerLevel = instanceInfo.primaryStat!.value!;

    final sockets =
        ProfileService().getItemSockets(widget.item.itemInstanceId!);
    final List<DestinyItemSocketState>? perks = sockets!
        .where((element) =>
            element.plugHash != null &&
            DestinyData.perkCategoryHash.contains(ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition?[element.plugHash]!
                .plug!
                .plugCategoryHash!))
        .toList();

    final List<DestinyItemSocketState> armorSockets = sockets
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
        .toList();
    final List<DestinyItemSocketState>? cosmetics = sockets
        .where((element) =>
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemType ==
                DestinyItemType.Armor ||
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemSubType ==
                DestinyItemSubType.Ornament ||
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.plugHash]
                    ?.itemSubType ==
                DestinyItemSubType.Shader)
        .toList();
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                textH2(itemCategory.displayProperties!.name!),
                const SizedBox(width: 20),
                textH3('1/10', color: greyLight)
              ],
            ),
            textBodyMedium('Tout voir'),
          ],
        ),
      ),
      ItemComponentDisplay(
          item: widget.item,
          itemDef: itemDef,
          elementIcon: elementIcon!,
          powerLevel: powerLevel,
          perks: perks,
          cosmetics: cosmetics!,
          characterId: widget.characterId,
          armorSockets: armorSockets)
    ]);
  }
}
