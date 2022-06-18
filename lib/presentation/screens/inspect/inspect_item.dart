import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/itemInfoHelper.model.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_armor_info.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_weapon_info.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_header.dart';

class InspectItem extends StatelessWidget {
  const InspectItem({
    Key? key,
    required this.width,
    required this.data,
    required this.inspectData,
  }) : super(key: key);

  final double width;
  final ItemInfoHelper data;
  final InspectData inspectData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(
          context,
          width: width,
          image: NetworkImage(data.imageLink),
          child: InspectMobileHeader(
            name: data.itemDef.displayProperties!.name!,
            iconElement: data.elementIcon,
            type: data.itemDef.itemTypeDisplayName!,
            power: data.powerLevel,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: black,
          ),
          width: width,
          child: Padding(
            padding: EdgeInsets.only(
                left: globalPadding(context),
                right: globalPadding(context),
                bottom: globalPadding(context)),
            child: data.itemDef.itemType == DestinyItemType.Weapon
                ? InspectMobileWeaponInfo(
                    item: data.itemDef,
                    stats: data.stats,
                    characterId: inspectData.characterId,
                    instanceId: inspectData.instanceId,
                    sockets: data.sockets,
                    width: width,
                    plugs: data.plugs)
                : InspectMobileArmorInfo(
                    item: data.itemDef,
                    stats: data.stats,
                    instanceId: inspectData.instanceId,
                    characterId: inspectData.characterId,
                    sockets: data.sockets,
                    width: width,
                    afinityIcon: data.afinityIcon),
          ),
        )
      ],
    );
  }
}
