import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/profile/components/character_desktop_item_column.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profile_mobile_header.dart';

class ProfileDesktopView extends StatelessWidget {
  final ProfileHelper data;
  final void Function(InspectData) onClick;
  const ProfileDesktopView({
    required this.data,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String icon = data.isNewSubclass
        ? ManifestService
            .manifestParsed
            .destinyInventoryItemDefinition[
                data.selectedCharacterSubclass!.itemHash]!
            .screenshot!
        : ManifestService
            .manifestParsed
            .destinyInventoryItemDefinition[
                data.selectedCharacterSubclass!.itemHash]!
            .secondaryIcon!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        desktopHeader(
          context,
          image: NetworkImage(
            DestinyData.bungieLink + icon,
          ),
          child: ProfileMobileHeader(
            width: vw(context) * 0.5,
            stats: data.selectedCharacter!.stats,
            characterSuper: data.characterSuper!,
            subclassId: data.selectedCharacterSubclass!.itemInstanceId!,
            characterId: data.selectedCharacter!.characterId!,
            isNewSubclass: data.isNewSubclass,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CharacterDesktopItemColumn(
              data: data,
              filter: DestinyItemType.Weapon,
              onClick: (inspectData) {
                onClick(inspectData);
              },
            ),
            CharacterDesktopItemColumn(
              data: data,
              filter: DestinyItemType.Armor,
              onClick: (inspectData) {
                onClick(inspectData);
              },
            ),
          ],
        )
      ],
    );
  }
}
