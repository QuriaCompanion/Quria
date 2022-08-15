import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/filters_provider.dart';
import 'package:quria/presentation/components/misc/filter_badge.dart';
import 'package:quria/presentation/components/misc/filter_badge_text.dart';
import 'package:quria/presentation/components/misc/filter_section_card.dart';

class FilterSectionDrawer extends StatelessWidget {
  const FilterSectionDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vh(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilterSectionCard(
              title: "Rareté",
              children: [
                for (MapEntry<TierType, bool> item in Provider.of<FiltersProvider>(context).rarity.entries)
                  InkWell(
                    onTap: () {
                      Provider.of<FiltersProvider>(context, listen: false)
                          .changeFilter<TierType>(item.key, !item.value);
                    },
                    child: FilterBadgeText(item: item),
                  ),
              ],
            ),
            SizedBox(height: globalPadding(context) / 2),
            FilterSectionCard(
              title: "Type d'arme",
              children: [
                for (MapEntry<DamageType, bool> item in Provider.of<FiltersProvider>(context).element.entries)
                  InkWell(
                    onTap: () {
                      Provider.of<FiltersProvider>(context, listen: false)
                          .changeFilter<DamageType>(item.key, !item.value);
                    },
                    child: FilterBadge<DamageType>(item: item),
                  ),
              ],
            ),
            SizedBox(height: globalPadding(context) / 2),
            FilterSectionCard(
              title: "Dégats",
              children: [
                for (MapEntry<DestinyItemSubType, bool> item in Provider.of<FiltersProvider>(context).type.entries)
                  InkWell(
                    onTap: () {
                      Provider.of<FiltersProvider>(context, listen: false)
                          .changeFilter<DestinyItemSubType>(item.key, !item.value);
                    },
                    child: FilterBadge<DestinyItemSubType>(item: item),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
