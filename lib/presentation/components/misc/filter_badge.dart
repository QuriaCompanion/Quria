import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/filters_logo.dart';
import 'package:quria/constants/styles.dart';

class FilterBadge extends StatelessWidget {
  const FilterBadge({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MapEntry<DestinyItemSubType, bool> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: item.value ? yellow : blackLight),
      child: SvgPicture.asset(
        filtersLogo[item.key]!,
        width: 20,
        height: 20,
      ),
    );
  }
}
