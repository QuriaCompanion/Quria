import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/character_appbar.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_header.dart';
import 'package:quria/presentation/screens/vault/mobile_components/vault_mobile_section.dart';
import 'package:quria/presentation/var/routes.dart';
import 'package:sliver_tools/sliver_tools.dart';

@immutable
class VaultMobileView extends ConsumerWidget {
  const VaultMobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DestinyItemType currentFilter = ref.watch(filtersProvider.select((value) => value.itemType));
    return CustomScrollView(
      controller: ScrollController(),
      slivers: [
        CharacterAppbar(
          onCharacterChange: (newIndex) {
            setCurrentCharacter(newIndex, ref);
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
                    padding: EdgeInsets.only(top: globalPadding(context), bottom: globalPadding(context) * 2),
                    child: SizedBox(
                      height: 45,
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                              onTap: () {
                                ref.read(filtersProvider.notifier).changeType(DestinyItemType.Weapon);
                              },
                              child: MobileNavItem(
                                selected: currentFilter == DestinyItemType.Weapon,
                                value: AppLocalizations.of(context)!.weapons,
                              )),
                          SizedBox(width: globalPadding(context)),
                          InkWell(
                              onTap: () {
                                ref.read(filtersProvider.notifier).changeType(DestinyItemType.Armor);
                              },
                              child: MobileNavItem(
                                selected: currentFilter == DestinyItemType.Armor,
                                value: AppLocalizations.of(context)!.armor,
                              )),
                          SizedBox(width: globalPadding(context)),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, routeProfile);
                              },
                              child: MobileNavItem(
                                selected: false,
                                value: AppLocalizations.of(context)!.character,
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
        _list(context, ref, currentFilter),
      ],
    );
  }

  _list(BuildContext context, WidgetRef ref, DestinyItemType currentFilter) {
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
      final items = ref
          .watch(vaultMobileFilteredInventory)
          .where((element) =>
              ManifestService
                      .manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.inventory?.bucketTypeHash ==
                  bucketHash &&
              (currentFilter == DestinyItemType.Weapon ||
                  ManifestService.manifestParsed.destinyInventoryItemDefinition[element.itemHash]?.classType ==
                      ref.watch(charactersProvider).first.classType))
          .toList();
      sections.add(
        VaultMobileSection(
          vaultItems: items,
          bucketHash: bucketHash,
        ),
      );
    }

    return MultiSliver(
      children: sections,
    );
  }
}
