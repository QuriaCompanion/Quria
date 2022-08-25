import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/screens/collection/collection_item/mobile_components/collection_armor_view.dart';
import 'package:quria/presentation/screens/collection/collection_item/mobile_components/collection_weapon_view.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_header.dart';
import 'package:quria/presentation/screens/inspect/weapon_rated_score_display.dart';

class CollectionItemMobileView extends ConsumerWidget {
  final DestinyInventoryItemDefinition data;
  final double? width;
  const CollectionItemMobileView({
    required this.data,
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: black,
      child: Column(
        children: [
          SizedBox(
            height: ref.watch(inspectProvider.select((value) => value?.weaponStatus)) != null
                ? isMobile(context)
                    ? vh(context) - (56 + globalPadding(context) * 2)
                    : vh(context) * 0.9 - (56 + globalPadding(context) * 2)
                : null,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  mobileHeader(
                    context,
                    image: CachedNetworkImageProvider(
                        '${DestinyData.bungieLink}${data.screenshot!}?t={${BungieApiService.randomUserInt}}123456'),
                    child: InspectMobileHeader(
                      name: data.displayProperties!.name!,
                      type: data.itemTypeAndTierDisplayName!,
                    ),
                    width: width,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: globalPadding(context), right: globalPadding(context), bottom: globalPadding(context)),
                      child: data.itemType == DestinyItemType.Weapon
                          ? CollectionWeaponView(width: width ?? vw(context))
                          : CollectionArmorView(width: width ?? vw(context))),
                ],
              ),
            ),
          ),
          const WeaponRatedScoreDisplay()
        ],
      ),
    );
  }
}
