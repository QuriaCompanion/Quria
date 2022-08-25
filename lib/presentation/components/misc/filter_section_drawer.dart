import 'package:bungie_api/enums/damage_type.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/presentation/components/misc/custom_close_button.dart';
import 'package:quria/presentation/components/misc/filter_badge.dart';
import 'package:quria/presentation/components/misc/filter_badge_element.dart';
import 'package:quria/presentation/components/misc/filter_badge_rarity.dart';
import 'package:quria/presentation/components/misc/filter_section_card.dart';

class FilterSectionDrawer extends ConsumerWidget {
  const FilterSectionDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: black,
      height: isMobile(context) ? null : vh(context),
      width: isMobile(context) ? vw(context) : 350 + globalPadding(context) * 2,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: globalPadding(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textH2(AppLocalizations.of(context)!.filters, utf8: false),
                      const CustomCloseButton(),
                    ],
                  ),
                ),
                Divider(
                  color: blackLight,
                  height: globalPadding(context),
                  thickness: 1,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterSectionCard(
                      title: AppLocalizations.of(context)!.rarity,
                      children: [
                        for (MapEntry<TierType, bool> item
                            in ref.watch(filtersProvider.select((value) => value.rarity)).entries)
                          InkWell(
                            onTap: () {
                              ref.read(filtersProvider.notifier).changeFilter<TierType>(item.key, !item.value);
                            },
                            child: FilterBadgeText(item: item),
                          ),
                      ],
                    ),
                    SizedBox(height: globalPadding(context) / 2),
                    FilterSectionCard(
                      title: AppLocalizations.of(context)!.damage_type,
                      children: [
                        for (MapEntry<DamageType, bool> item
                            in ref.watch(filtersProvider.select((value) => value.element.entries)))
                          InkWell(
                            onTap: () {
                              ref.read(filtersProvider.notifier).changeFilter<DamageType>(item.key, !item.value);
                            },
                            child: FilterBadgeElement(item: item),
                          ),
                      ],
                    ),
                    SizedBox(height: globalPadding(context) / 2),
                    FilterSectionCard(
                      title: AppLocalizations.of(context)!.weapon_type,
                      children: [
                        for (MapEntry<DestinyItemSubType, bool> item
                            in ref.watch(filtersProvider.select((value) => value.type.entries)))
                          InkWell(
                            onTap: () {
                              ref
                                  .read(filtersProvider.notifier)
                                  .changeFilter<DestinyItemSubType>(item.key, !item.value);
                            },
                            child: FilterBadge<DestinyItemSubType>(item: item),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
