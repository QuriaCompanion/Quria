import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/filters_logo.dart';
import 'package:quria/constants/styles.dart';

import 'package:quria/constants/texts.dart';

class FilterBadgeText extends StatelessWidget {
  final MapEntry<TierType, bool> item;

  const FilterBadgeText({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = "";
    switch (item.key) {
      case TierType.Basic:
        text = "Commun";
        break;
      case TierType.Common:
        text = "Peu Commun";
        break;
      case TierType.Rare:
        text = "Rare";
        break;
      case TierType.Superior:
        text = "Légendaire";
        break;
      case TierType.Exotic:
        text = "Exotique";
        break;
      default:
        break;
    }
    return Container(
      width: isMobile(context) ? vw(context) * 0.4 : 172,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: grey,
        border: Border.all(
          color: item.value ? vanguard : grey,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            filtersTierTypeLogo[item.key]!,
            width: 24,
            height: 24,
          ),
          textBodyMedium(text, utf8: false)
        ],
      ),
    );
  }
}
