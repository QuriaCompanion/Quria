import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/profile/components/profile_item_card.dart';

class ProfileItemSectionWidget extends StatelessWidget {
  final DestinyItemType itemType;
  final ProfileHelper? data;
  const ProfileItemSectionWidget({
    Key? key,
    required this.itemType,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isWeaponSide = itemType == DestinyItemType.Weapon;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isWeaponSide)
          for (DestinyItemComponent equipement in data!.characterEquipement
              .where((element) =>
                  ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition![element.itemHash]!
                      .itemType ==
                  DestinyItemType.Subclass))
            ProfileItemCard(displayedItem: equipement),
        for (DestinyItemComponent equipement in data!.characterEquipement.where(
            (element) =>
                ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![element.itemHash]!
                    .itemType ==
                itemType))
          ProfileItemCard(displayedItem: equipement),
      ],
    );
  }
}
