import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/widgets.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/presentation/screens/profile/components/vertical_character_stats_listing.dart';
import 'package:quria/presentation/screens/profile/components/profile_item_section.dart';

class ProfileMainNodeWidget extends StatelessWidget {
  final ProfileHelper data;
  final double middleSpace;
  final double statArmorSpace;
  final int characterIndex;
  final double verticalStatWidth;
  final double imageSize;
  final double itemSectionSpacing;
  final double statsFontSize;

  const ProfileMainNodeWidget(
      {Key? key,
      required this.data,
      required this.characterIndex,
      this.middleSpace = 400,
      this.statArmorSpace = 50,
      this.verticalStatWidth = 110,
      this.imageSize = 150,
      this.itemSectionSpacing = 20,
      this.statsFontSize = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.center,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileItemSectionWidget(
                  sizes: imageSize,
                  itemSectionSpacing: itemSectionSpacing,
                  itemType: DestinyItemType.Weapon,
                  data: data),
              SizedBox(width: middleSpace),
              Row(
                children: [
                  VerticalCharacterStatsListing(
                    fontSize: statsFontSize,
                    width: verticalStatWidth,
                    stats: data.characters[characterIndex].stats!,
                    characterId: data.characters[characterIndex].characterId!,
                  ),
                  SizedBox(width: statArmorSpace),
                  ProfileItemSectionWidget(
                      sizes: imageSize,
                      itemSectionSpacing: itemSectionSpacing,
                      itemType: DestinyItemType.Armor,
                      data: data)
                ],
              ),
            ]),
      ),
    );
  }
}
