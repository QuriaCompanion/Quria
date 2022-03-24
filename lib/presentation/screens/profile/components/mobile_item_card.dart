import 'package:bungie_api/models/destiny_damage_type_definition.dart';
import 'package:bungie_api/models/destiny_equipment_slot_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';

class MobileItemCard extends StatefulWidget {
  // data
  final int itemHash;
  final String instanceId;

  const MobileItemCard({
    Key? key,
    required this.itemHash,
    required this.instanceId,
  }) : super(key: key);

  @override
  State<MobileItemCard> createState() => _MobileItemCardState();
}

class _MobileItemCardState extends State<MobileItemCard> {
  late final DestinyInventoryItemDefinition itemDef;
  late final DestinyEquipmentSlotDefinition itemCategory;
  late final DestinyDamageTypeDefinition damageType;
  late final int powerLevel;
  @override
  void initState() {
    super.initState();
    itemDef = ManifestService
        .manifestParsed.destinyInventoryItemDefinition![widget.itemHash]!;
    itemCategory =
        ManifestService.manifestParsed.destinyEquipmentSlotDefinition![
            itemDef.equippingBlock!.equipmentSlotTypeHash!]!;
    powerLevel =
        ProfileService().getInstanceInfo(widget.instanceId).primaryStat!.value!;
    damageType = ManifestService.manifestParsed
        .destinyDamageTypeDefinition![itemDef.defaultDamageTypeHash!]!;
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width / 6.69;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
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
              textBodyMedium('Tout voir')
            ],
          ),
        ),
        Row(
          children: [
            ItemIcon(
              displayHash: itemDef.hash!,
              imageSize: iconSize,
            ),
            SizedBox(width: globalPadding(context)),
            SizedBox(
              height: iconSize,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textH3(itemDef.displayProperties!.name!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.only(right: 5),
                          child: Image(
                            image: NetworkImage(DestinyData.bungieLink +
                                damageType.displayProperties!.icon!),
                          )),
                      textBodyBold(powerLevel.toString()),
                      divider,
                      textBodyRegular(itemDef.itemTypeDisplayName!),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.white,
            )
          ],
        )
      ]),
    );
  }
}
