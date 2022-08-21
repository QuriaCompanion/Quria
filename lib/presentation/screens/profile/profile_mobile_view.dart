import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profile_mobile_content.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profile_mobile_header.dart';

class ProfileMobileView extends StatelessWidget {
  final ProfileHelper data;
  const ProfileMobileView({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String icon = data.isNewSubclass
        ? '${ManifestService.manifestParsed.destinyInventoryItemDefinition[data.selectedCharacterSubclass!.itemHash]!.screenshot!}?t={${Random().nextInt(100)}}123456'
        : '${ManifestService.manifestParsed.destinyInventoryItemDefinition[data.selectedCharacterSubclass!.itemHash]!.secondaryIcon!}?t={${Random().nextInt(100)}}123456';
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          mobileHeader(
            context,
            image: NetworkImage(
              DestinyData.bungieLink + icon,
            ),
            child: ProfileMobileHeader(
              width: vw(context),
              stats: data.selectedCharacter!.stats,
              characterSuper: data.characterSuper!,
              subclassId: data.selectedCharacterSubclass!.itemInstanceId!,
              characterId: data.selectedCharacter!.characterId!,
              isNewSubclass: data.isNewSubclass,
              subclass: data.selectedCharacterSubclass!,
            ),
          ),
          ProfileMobileContent(data: data)
        ]);
  }
}
