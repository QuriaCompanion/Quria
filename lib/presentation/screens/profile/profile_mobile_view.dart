import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profile_mobile_item_card.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profile_mobile_header.dart';
import 'package:quria/presentation/var/routes.dart';

class ProfileMobileView extends StatefulWidget {
  final ProfileHelper data;
  final void Function(InspectData) onClick;
  const ProfileMobileView({
    required this.data,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileMobileView> createState() => _ProfileMobileViewState();
}

class _ProfileMobileViewState extends State<ProfileMobileView> {
  DestinyItemType currentFilter = DestinyItemType.Weapon;
  @override
  Widget build(BuildContext context) {
    String icon = widget.data.isNewSubclass
        ? ManifestService
            .manifestParsed
            .destinyInventoryItemDefinition[
                widget.data.selectedCharacterSubclass.itemHash]!
            .screenshot!
        : ManifestService
            .manifestParsed
            .destinyInventoryItemDefinition[
                widget.data.selectedCharacterSubclass.itemHash]!
            .secondaryIcon!;
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
              stats: widget.data.selectedCharacter.stats,
              characterSuper: widget.data.characterSuper,
              subclassId: widget.data.selectedCharacterSubclass.itemInstanceId!,
              characterId: widget.data.selectedCharacter.characterId!,
              isNewSubclass: widget.data.isNewSubclass,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: globalPadding(context),
                bottom: globalPadding(context) * 2),
            child: SizedBox(
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        width: vw(context) * 0.29,
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
                        width: vw(context) * 0.29,
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, routeVault);
                      },
                      child: MobileNavItem(
                        selected: false,
                        value: "Coffre",
                        width: vw(context) * 0.29,
                      )),
                ],
              ),
            ),
          ),
          for (DestinyItemComponent item
              in widget.data.selectedCharacterEquipment.where((element) =>
                  ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition[element.itemHash]
                      ?.itemType ==
                  currentFilter))
            Padding(
              padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
              child: Column(
                children: [
                  RepaintBoundary(
                    child: ProfileMobileItemCard(
                      onClick: (inspectData) {
                        widget.onClick(inspectData);
                      },
                      item: item,
                      characterId: widget.data.selectedCharacter.characterId!,
                      inventory: widget.data.selectedCharacterInventory
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
                    height: globalPadding(context) * 2,
                    color: grey,
                  ),
                ],
              ),
            )
        ]);
  }
}
