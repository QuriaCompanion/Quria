import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/RatedScore.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/weapon_score.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display_perks_build.dart';
import 'package:quria/presentation/components/misc/loader.dart';

class InspectSpecimens extends ConsumerWidget {
  const InspectSpecimens({
    required this.item,
    required this.width,
    Key? key,
  }) : super(key: key);

  final DestinyItemComponent item;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final owner = ref.watch(itemOwnerProvider(item.itemInstanceId));
    final character = ref.watch(charactersProvider).firstWhereOrNull((element) => element.characterId == owner);
    List<DestinyItemSocketState> sockets = ref.watch(itemSocketsProvider(item.itemInstanceId));

    final List<int> mods = sockets
        .where((element) => ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.itemType ==
                DestinyItemType.Armor
            ? Conditions.armorSockets(element)
            : Conditions.perkSockets(element.plugHash))
        .where((element) => element.plugHash != null)
        .map((element) => element.plugHash!)
        .toList();
    AsyncValue<RatedScore?> weaponScore = ref.watch(ratedScoreProvider(item));
    return Container(
      decoration: BoxDecoration(
        color: blackLight,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(globalPadding(context) / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: itemSize(context, width),
            child: Image(
              filterQuality: FilterQuality.high,
              image: CachedNetworkImageProvider(DestinyData.bungieLink +
                  (character?.emblemPath != null
                      ? '${character!.emblemPath!}?t={${BungieApiService.randomUserInt}}'
                      : "/common/destiny2_content/icons/b46b0f14f56805d4927f8a5ec15734c5.png?t={${BungieApiService.randomUserInt}}")),
            ),
          ),
          SizedBox(
            width: globalPadding(context) / 2,
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                textBodyBold(character != null
                    ? ManifestService.manifestParsed.destinyClassDefinition[character.classHash]!
                        .genderedClassNamesByGenderHash![character.genderHash.toString()]!
                    : AppLocalizations.of(context)!.vault),
                SizedBox(
                  height: globalPadding(context),
                ),
                ItemComponentDisplayPerksBuild(
                  itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
                  width: width * 0.5,
                  perks: mods,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    filterQuality: FilterQuality.high,
                    width: itemSize(context, width) / 4,
                    image: CachedNetworkImageProvider(
                        '${DestinyData.bungieLink}${ref.watch(itemElementProvider(item))}?t={${BungieApiService.randomUserInt}}123456'),
                  ),
                  textH3(ref.watch(itemPowerLevelProvider(item.itemInstanceId)).toString()),
                ],
              ),
              SizedBox(
                height: globalPadding(context),
              ),
              weaponScore.when(data: (weaponScore) {
                return Column(
                  children: [
                    textH3('PVE: ${weaponScore?.scorePve.round()}/100'),
                    textH3('PVP: ${weaponScore?.scorePvp.round()}/100'),
                  ],
                );
              }, error: (_, __) {
                return Container();
              }, loading: () {
                return const Loader();
              }),
            ],
          ),
        ],
      ),
    );
  }
}
