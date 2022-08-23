import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_armor_info.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_weapon_info.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_header.dart';
import 'package:quria/presentation/screens/inspect/weapon_rated_score_display.dart';

class InspectItem extends ConsumerWidget {
  const InspectItem({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DestinyItemComponent item = ref.watch(inspectProvider.select((value) => value!.item!));
    String imageLink = ref.watch(inspectImageLink)!;

    DestinyInventoryItemDefinition? itemDef = ref.watch(inspectProvider.select((value) => value?.itemDef));

    String? elementIcon = ref.watch(itemElementProvider(item))!;

    int? powerLevel = ref.watch(itemPowerLevelProvider(item.itemInstanceId));
    final currentFilter = ref.watch(subtabInspectProvider);
    return Container(
      color: black,
      child: Column(
        children: [
          SizedBox(
            height: currentFilter == InspectWeaponInfo.recommendations
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
          if (currentFilter == InspectWeaponInfo.recommendations) const WeaponRatedScoreDisplay()
        ],
      ),
    );
  }
}
