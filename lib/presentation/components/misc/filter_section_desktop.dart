import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/filters_provider.dart';
import 'package:quria/presentation/components/misc/custom_checkbox.dart';
import 'package:quria/presentation/components/misc/filter_badge.dart';

class FilterSectionDesktop extends StatelessWidget {
  const FilterSectionDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            textH2("rareté", utf8: false),
            for (MapEntry<TierType, bool> item in Provider.of<FiltersProvider>(context).rarity.entries)
              SizedBox(
                width: 350,
                child: CustomCheckbox(
                    text: item.key.toString(),
                    value: item.value,
                    onChanged: (newValue) {
                      Provider.of<FiltersProvider>(context, listen: false).changeFilter<TierType>(item.key, newValue);
                    }),
              ),
          ],
        ),
        Column(
          children: [
            textH2("dégats", utf8: false),
            for (MapEntry<DamageType, bool> item in Provider.of<FiltersProvider>(context).element.entries)
              SizedBox(
                width: 350,
                child: CustomCheckbox(
                    text: item.key.toString(),
                    value: item.value,
                    onChanged: (newValue) {
                      Provider.of<FiltersProvider>(context, listen: false).changeFilter<DamageType>(item.key, newValue);
                    }),
              ),
          ],
        ),
        Column(
          children: [
            textH2("Type D'arme", utf8: false),
            SizedBox(
              width: 350,
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  for (MapEntry<DestinyItemSubType, bool> item in Provider.of<FiltersProvider>(context).type.entries)
                    InkWell(
                      onTap: () {
                        Provider.of<FiltersProvider>(context, listen: false)
                            .changeFilter<DestinyItemSubType>(item.key, !item.value);
                      },
                      child: FilterBadge(item: item),
                    ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
