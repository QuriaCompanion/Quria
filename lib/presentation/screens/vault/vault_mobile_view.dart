import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/vaultHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profile_mobile_header.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_header.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_list.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_section.dart';

class VaultMobileView extends StatefulWidget {
  VaultHelper data;
  VaultMobileView({required this.data, Key? key}) : super(key: key);

  @override
  State<VaultMobileView> createState() => _VaultMobileView();
}

class _VaultMobileView extends State<VaultMobileView> {
  DestinyItemType currentFilter = DestinyItemType.Weapon;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          mobileHeader(context,
              image: NetworkImage('imageLink'),
              child: const VaultMobileHeader(name: "Coffre")),
          Padding(
            padding: EdgeInsets.only(
                top: globalPadding(context),
                bottom: globalPadding(context) * 2),
            child: SizedBox(
              height: 45,
              child: ListView(
                padding:
                    EdgeInsets.symmetric(horizontal: globalPadding(context)),
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
                        width: 114,
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
                        width: 114,
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          // currentFilter = DestinyItemType.Armor;
                        });
                      },
                      child: MobileNavItem(
                        selected: currentFilter == DestinyItemType.Armor,
                        value: "Inventaire",
                        width: 114,
                      )),
                ],
              ),
            ),
          ),
          VaultMobileList(
              data: widget.data.vaultItems, currentFilter: currentFilter)
        ],
      ),
    );
  }
}
