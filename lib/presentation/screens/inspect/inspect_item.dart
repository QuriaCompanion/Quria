import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/RatedScore.model.dart';
import 'package:quria/data/models/WeaponScore.model.model.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/display/weapon_score.service.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_armor_info.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_weapon_info.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_header.dart';
import 'package:quria/presentation/screens/inspect/weapon_rated_score_display.dart';

class InspectItem extends StatelessWidget {
  const InspectItem({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    String imageLink = Provider.of<InspectProvider>(context).getImageLink(context);

    DestinyInventoryItemDefinition? itemDef = Provider.of<InspectProvider>(context).itemDef;

    String? elementIcon = Provider.of<InspectProvider>(context).getElementIcon(context);

    int? powerLevel = Provider.of<InspectProvider>(context).getPowerLevel(context);
    final WeaponScore? weaponScore = Provider.of<InspectProvider>(context, listen: false).weaponScore;
    final InspectWeaponStatus? weaponStatus = Provider.of<InspectProvider>(context, listen: false).weaponStatus;

    RatedScore? ratedScore;
    if (weaponScore != null && weaponStatus != null) {
      ratedScore = WeaponScoreService().getRatedScoreCollection(context, weaponStatus, weaponScore);
    }
    return Container(
      color: black,
      child: Column(
        children: [
          SizedBox(
            height: weaponStatus != null
                ? isMobile(context)
                    ? vh(context) - (56 + globalPadding(context) * 2)
                    : vh(context) * 0.9 - (56 + globalPadding(context) * 2)
                : null,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  mobileHeader(
                    context,
                    width: width,
                    image: CachedNetworkImageProvider(imageLink),
                    child: InspectMobileHeader(
                      name: itemDef!.displayProperties!.name!,
                      iconElement: elementIcon,
                      type: itemDef.itemTypeDisplayName!,
                      power: powerLevel,
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
                        bottom: globalPadding(context),
                      ),
                      child: itemDef.itemType == DestinyItemType.Weapon
                          ? InspectMobileWeaponInfo(width: width)
                          : InspectMobileArmorInfo(width: width),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (weaponStatus != null) WeaponRatedScoreDisplay(ratedScore: ratedScore!)
        ],
      ),
    );
  }
}
