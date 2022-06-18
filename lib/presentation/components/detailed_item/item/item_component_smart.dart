import 'package:bungie_api/enums/item_state.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';

class ItemComponentSmart extends StatelessWidget {
  final DestinyItemComponent item;
  final double width;
  const ItemComponentSmart({
    required this.item,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final instanceInfo = ProfileService().getInstanceInfo(item.itemInstanceId!);
    final DestinyInventoryItemDefinition itemDef = ManifestService
        .manifestParsed.destinyInventoryItemDefinition[item.itemHash]!;
    final String? elementIcon = ManifestService
            .manifestParsed
            .destinyDamageTypeDefinition[itemDef.defaultDamageTypeHash]
            ?.displayProperties
            ?.icon ??
        ManifestService
            .manifestParsed
            .destinyEnergyTypeDefinition[instanceInfo.energy?.energyTypeHash]
            ?.displayProperties
            ?.icon;
    final int? powerLevel = instanceInfo.primaryStat?.value;
    return Row(
      children: [
        ItemIcon(
          displayHash: item.overrideStyleItemHash ?? item.itemHash!,
          imageSize: itemSize(context, width),
          isMasterworked: item.state == ItemState.Masterwork ||
              item.state == const ItemState(5),
        ),
        SizedBox(width: globalPadding(context)),
        SizedBox(
          width: vw(context) -
              (itemSize(context, width) * 2) -
              globalPadding(context) * 3,
          height: itemSize(context, width),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textH3(itemDef.displayProperties!.name!),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (elementIcon != null)
                    Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 5),
                        child: Image(
                          image: NetworkImage(
                              DestinyData.bungieLink + elementIcon),
                        )),
                  if (powerLevel != null) textBodyBold(powerLevel.toString()),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
