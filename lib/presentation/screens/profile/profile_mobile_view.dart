import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profil_mobile_item_card.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profile_mobile_header.dart';

class ProfileMobileView extends StatefulWidget {
  final ProfileHelper data;
  const ProfileMobileView({required this.data, Key? key}) : super(key: key);

  @override
  State<ProfileMobileView> createState() => _ProfileMobileViewState();
}

class _ProfileMobileViewState extends State<ProfileMobileView> {
  DestinyItemType currentFilter = DestinyItemType.Weapon;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              mobileHeader(
                context,
                image: NetworkImage(DestinyData.bungieLink +
                    ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition![
                            widget.data.selectedCharacterSubclass.itemHash]!
                        .screenshot!),
                child: ProfileMobileHeader(
                    stats: widget.data.selectedCharacter.stats,
                    characterId: widget.data.selectedCharacter.characterId!),
              ),
            ],
          ),
          SizedBox(
            height: 45,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        currentFilter = DestinyItemType.Weapon;
                      });
                    },
                    child: MobileNavItem(
                      selected: currentFilter == DestinyItemType.Weapon,
                      value: "Armes",
                      width: 171,
                    )),
                InkWell(
                    onTap: () {
                      setState(() {
                        currentFilter = DestinyItemType.Armor;
                      });
                    },
                    child: MobileNavItem(
                      selected: currentFilter == DestinyItemType.Armor,
                      value: "Armure",
                      width: 171,
                    )),
              ],
            ),
          ),
          for (DestinyItemComponent item
              in widget.data.selectedCharacterInventory.where((element) =>
                  ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition?[element.itemHash]
                      ?.itemType ==
                  currentFilter))
            Padding(
              padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
              child: Column(
                children: [
                  ProfileMobileItemCard(
                    item: item,
                    instanceId: item.itemInstanceId!,
                  ),
                  const Divider(
                    thickness: 1,
                    height: 25,
                    color: grey,
                  ),
                ],
              ),
            )
        ]);
  }
}
