import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/profile/components/profile_desktop_item_card.dart';

class CharacterDesktopItemColumn extends StatelessWidget {
  final ProfileHelper data;
  final DestinyItemType filter;
  final void Function(InspectData) onClick;
  const CharacterDesktopItemColumn({
    Key? key,
    required this.data,
    required this.filter,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: desktopCharactersColumnSize(context),
      decoration: BoxDecoration(
        color: blackLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(globalPadding(context) / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (DestinyItemComponent item in data.selectedCharacterEquipment
                .where((element) =>
                    ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition[element.itemHash]
                        ?.itemType ==
                    filter))
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RepaintBoundary(
                    child: ProfileDesktopItemCard(
                      onClick: (inspectData) {
                        onClick(inspectData);
                      },
                      item: item,
                      width: desktopCharactersColumnSize(context) -
                          globalPadding(context),
                      characterId: data.selectedCharacter!.characterId!,
                      inventory: data.selectedCharacterInventory
                          .where((element) =>
                              ManifestService
                                  .manifestParsed
                                  .destinyInventoryItemDefinition[
                                      element.itemHash]
                                  ?.equippingBlock
                                  ?.equipmentSlotTypeHash ==
                              ManifestService
                                  .manifestParsed
                                  .destinyInventoryItemDefinition[item.itemHash]
                                  ?.equippingBlock
                                  ?.equipmentSlotTypeHash)
                          .toList(),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: globalPadding(context),
                    color: Colors.white,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
