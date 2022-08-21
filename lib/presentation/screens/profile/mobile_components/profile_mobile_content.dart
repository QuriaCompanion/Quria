import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/profile/components/postmasters_items.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profile_mobile_item_card.dart';
import 'package:quria/presentation/var/routes.dart';

class ProfileMobileContent extends StatefulWidget {
  final ProfileHelper data;
  const ProfileMobileContent({Key? key, required this.data}) : super(key: key);

  @override
  State<ProfileMobileContent> createState() => _ProfileMobileContentState();
}

class _ProfileMobileContentState extends State<ProfileMobileContent> {
  DestinyItemType currentFilter = DestinyItemType.Weapon;
  bool isPostmasterOpen = false;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: globalPadding(context), bottom: globalPadding(context) * 2),
            child: SizedBox(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          isPostmasterOpen = false;
                          currentFilter = DestinyItemType.Weapon;
                        });
                      },
                      child: MobileNavItem(
                        selected: currentFilter == DestinyItemType.Weapon,
                        value: AppLocalizations.of(context)!.weapons,
                      )),
                  SizedBox(width: globalPadding(context)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isPostmasterOpen = false;
                          currentFilter = DestinyItemType.Armor;
                        });
                      },
                      child: MobileNavItem(
                        selected: currentFilter == DestinyItemType.Armor,
                        value: AppLocalizations.of(context)!.armor,
                      )),
                  SizedBox(width: globalPadding(context)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isPostmasterOpen = true;
                          currentFilter = DestinyItemType.Currency;
                        });
                      },
                      child: MobileNavItem(
                        selected: isPostmasterOpen,
                        value: AppLocalizations.of(context)!.postmaster,
                      )),
                  SizedBox(width: globalPadding(context)),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, routeVault);
                      },
                      child: MobileNavItem(
                        selected: false,
                        value: AppLocalizations.of(context)!.vault,
                      )),
                ],
              ),
            ),
          ),
          for (DestinyItemComponent item in widget.data.selectedCharacterEquipment.where((element) =>
              ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.itemType ==
              currentFilter))
            Padding(
              padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
              child: Column(
                children: [
                  RepaintBoundary(
                    child: ProfileMobileItemCard(
                      width: vw(context),
                      item: item,
                      characterId: widget.data.selectedCharacter!.characterId!,
                      inventory: widget.data.selectedCharacterInventory
                          .where((element) =>
                              ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]
                                  ?.equippingBlock?.equipmentSlotTypeHash ==
                              ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]
                                  ?.equippingBlock?.equipmentSlotTypeHash)
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
            ),
          if (isPostmasterOpen)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
              child: PostmasterItems(
                width: vw(context),
              ),
            )
        ],
      ),
    );
  }
}
