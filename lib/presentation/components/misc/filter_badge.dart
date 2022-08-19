import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/filters_logo.dart';
import 'package:quria/constants/styles.dart';

class FilterBadge<T> extends StatelessWidget {
  const FilterBadge({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MapEntry<T, bool> item;

  @override
  Widget build(BuildContext context) {
    late Map logoMap;
    switch (T) {
      case DestinyItemSubType:
        logoMap = filtersItemTypeLogo;
        break;
      case DamageType:
        logoMap = filtersDamageTypeLogo;
        break;
    }

    return Container(
      width: isMobile(context) ? vw(context) * 0.2 : 112,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: grey,
        border: Border.all(
          color: item.value ? vanguard : grey,
          width: 1,
        ),
      ),
      child: SvgPicture.asset(
        logoMap[item.key],
        width: 24,
        height: 24,
        color: Colors.white,
      ),
    );
  }
}
