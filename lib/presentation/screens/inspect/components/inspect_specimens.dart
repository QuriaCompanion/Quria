import 'package:flutter/material.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display_perks_build.dart';

class InspectSpecimens extends StatelessWidget {
  const InspectSpecimens({
    required this.item,
    required this.width,
    Key? key,
  }) : super(key: key);

  final DestinyItemComponent item;
  final double width;

  @override
  Widget build(BuildContext context) {
    final owner = Provider.of<InventoryProvider>(context).getItemOwner(item.itemInstanceId!);
    final character =
        Provider.of<CharactersProvider>(context).characters.firstWhereOrNull((element) => element.characterId == owner);
    List<DestinyItemSocketState> sockets =
        Provider.of<ItemProvider>(context, listen: false).getItemSockets(item.itemInstanceId!);

    final List<int> mods = sockets
        .where((element) => ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.itemType ==
                DestinyItemType.Armor
            ? Conditions.armorSockets(element)
            : Conditions.perkSockets(element.plugHash))
        .where((element) => element.plugHash != null)
        .map((element) => element.plugHash!)
        .toList();
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
              image: NetworkImage(DestinyData.bungieLink +
                  (character?.emblemPath != null
                      ? '${character!.emblemPath!}?t=123456'
                      : "/common/destiny2_content/icons/b46b0f14f56805d4927f8a5ec15734c5.png?t=123456")),
            ),
          ),
          SizedBox(
            width: globalPadding(context) / 2,
          ),
          SizedBox(
            height: itemSize(context, width),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBodyBold(character != null
                    ? ManifestService.manifestParsed.destinyClassDefinition[character.classHash]!
                        .genderedClassNamesByGenderHash![character.genderHash.toString()]!
                    : AppLocalizations.of(context)!.vault),
                ItemComponentDisplayPerksBuild(
                  itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
                  width: width,
                  perks: mods,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  textH3(Provider.of<ItemProvider>(context).getItemPowerLevel(item.itemInstanceId!).toString()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
