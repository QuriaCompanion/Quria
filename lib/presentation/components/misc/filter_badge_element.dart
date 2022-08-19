import 'package:bungie_api/destiny2.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/filters_logo.dart';
import 'package:quria/constants/styles.dart';

import 'package:quria/constants/texts.dart';

class FilterBadgeElement extends StatelessWidget {
  final MapEntry<DamageType, bool> item;

  const FilterBadgeElement({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = "";
    switch (item.key) {
      case DamageType.Kinetic:
        text = "Cinétique";
        break;
      case DamageType.Arc:
        text = "Cryo";
        break;
      case DamageType.Thermal:
        text = "Solaire";
        break;
      case DamageType.Void:
        text = "Abyssal";
        break;
      case DamageType.Stasis:
        text = "Stase";
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
            filtersDamageTypeLogo[item.key]!,
            width: 24,
            height: 24,
          ),
          textBodyMedium(text, utf8: false)
        ],
      ),
    );
  }
}
