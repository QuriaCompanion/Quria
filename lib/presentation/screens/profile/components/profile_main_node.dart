import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/widgets.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/presentation/screens/profile/components/profile_item_section.dart';
import 'package:quria/presentation/screens/profile/profile.dart';

class ProfileMainNodeWidget extends StatelessWidget {
  final ProfileHelper data;
  final double middleSpace;

  const ProfileMainNodeWidget({
    Key? key,
    required this.data,
    this.middleSpace = 400,
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
                  CharacterStatsWidget(data: data),
                  ProfileItemSectionWidget(
                      itemType: DestinyItemType.Armor, data: data)
                ],
              ),
            ]),
      ),
    );
  }
}
