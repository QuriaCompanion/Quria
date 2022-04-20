import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/vaultHelper.model.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_header.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_list.dart';
import 'package:quria/presentation/var/routes.dart';

@immutable
class VaultMobileView extends StatefulWidget {
  final VaultHelper data;
  final DestinyClass characterClass;
  final void Function() onTransfer;
  const VaultMobileView({
    required this.data,
    required this.characterClass,
    required this.onTransfer,
    Key? key,
  }) : super(key: key);

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
              image: const AssetImage('assets/img/vault.png'),
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
                        Navigator.pushNamed(context, routeProfile);
                      },
                      child: MobileNavItem(
                        selected: false,
                        value: "Personnage",
                        width: vw(context) * 0.29,
                      )),
                ],
              ),
            ),
          ),
          VaultMobileList(
            data: widget.data.vaultItems,
            currentFilter: currentFilter,
            classType: widget.characterClass,
            onTransfer: () => widget.onTransfer(),
          ),
        ],
      ),
    );
  }
}
