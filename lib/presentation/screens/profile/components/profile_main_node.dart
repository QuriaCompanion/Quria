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

  const ProfileMainNodeWidget({
    Key? key,
    required this.data,
    required this.characterIndex,
    this.middleSpace = 400,
    this.statArmorSpace = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.center,
        child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // change ici pr le mode detail
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileItemSectionWidget(
                  itemType: DestinyItemType.Weapon, data: data),
              SizedBox(width: middleSpace),
              Row(
                children: [
                  VerticalCharacterStatsListingWidget(
                    data: data,
                    characterIndex: characterIndex,
                  ),
                  SizedBox(width: statArmorSpace),
                  ProfileItemSectionWidget(
                      itemType: DestinyItemType.Armor, data: data)
                ],
              ),
            ]),
      ),
    );
  }
}
