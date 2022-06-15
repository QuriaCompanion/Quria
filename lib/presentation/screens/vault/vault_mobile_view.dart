import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/vaultHelper.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/character_appbar.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_header.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_section.dart';
import 'package:quria/presentation/var/routes.dart';
import 'package:sliver_tools/sliver_tools.dart';

@immutable
class VaultMobileView extends StatefulWidget {
  final VaultHelper data;
  final void Function() onTransfer;
  const VaultMobileView({
    required this.data,
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
    return CustomScrollView(
      controller: ScrollController(),
      slivers: [
        CharacterAppbar(
          onCharacterChange: (newIndex) {
            Provider.of<CharactersProvider>(context, listen: false)
                .setCurrentCharacter(newIndex);
          },
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  mobileHeader(context,
                      image: const AssetImage('assets/img/vault.png'),
                      child: VaultMobileHeader(
                        name: AppLocalizations.of(context)!.vault,
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: globalPadding(context),
                        bottom: globalPadding(context) * 2),
                    child: SizedBox(
                      height: 45,
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                            horizontal: globalPadding(context)),
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  currentFilter = DestinyItemType.Weapon;
                                });
                              },
                              child: MobileNavItem(
                                selected:
                                    currentFilter == DestinyItemType.Weapon,
                                value: AppLocalizations.of(context)!.weapons,
                                width: vw(context) * 0.29,
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  currentFilter = DestinyItemType.Armor;
                                });
                              },
                              child: MobileNavItem(
                                selected:
                                    currentFilter == DestinyItemType.Armor,
                                value: AppLocalizations.of(context)!.armor,
                                width: vw(context) * 0.29,
                              )),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, routeProfile);
                              },
                              child: MobileNavItem(
                                selected: false,
                                value: AppLocalizations.of(context)!.character,
                                width: vw(context) * 0.29,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        ),
        _list(context),
      ],
    );
  }

  _list(BuildContext context) {
    final List<Widget> sections = [];
    List<int> bucketHashes = [];
    switch (currentFilter) {
      case DestinyItemType.Armor:
        bucketHashes = InventoryBucket.armorBucketHashes;
        break;
      case DestinyItemType.Weapon:
        bucketHashes = InventoryBucket.weaponBucketHashes;
        break;
      default:
        break;
    }

    for (int bucketHash in bucketHashes) {
      final items = widget.data.vaultItems
          .where((element) =>
              ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition[element.itemHash]
                      ?.inventory
                      ?.bucketTypeHash ==
                  bucketHash &&
              (currentFilter == DestinyItemType.Weapon ||
                  ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition[element.itemHash]
                          ?.classType ==
                      Provider.of<CharactersProvider>(context)
                          .currentCharacter
                          ?.classType))
          .toList();
      items.sort((a, b) {
        int first = ProfileService().getItemPowerLevel(b.itemInstanceId!) ?? 0;
        return first.compareTo(
            ProfileService().getItemPowerLevel(a.itemInstanceId!) ?? 0);
      });
      sections.add(
        VaultMobileSection(
          vaultItems: items,
          bucketHash: bucketHash,
          onTransfer: () => widget.onTransfer(),
        ),
      );
    }

    return MultiSliver(
      children: sections,
    );
  }
}
