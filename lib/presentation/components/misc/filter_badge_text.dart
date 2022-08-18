import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'dart:math' as math;

class FilterBadgeText extends StatelessWidget {
  final MapEntry<TierType, bool> item;

  const FilterBadgeText({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    String text = "";
    switch (item.key) {
      case TierType.Basic:
        color = Colors.white;
        text = "Commun";
        break;
      case TierType.Common:
        color = Colors.green;
        text = "Peu Commun";
        break;
      case TierType.Rare:
        color = Colors.blue;
        text = "Rare";
        break;
      case TierType.Superior:
        color = Colors.purple;
        text = "Légendaire";
        break;
      case TierType.Exotic:
        color = Colors.orange;
        text = "Exotique";
        break;
      default:
    }
    return Tooltip(
      message: text,
      child: Container(
        width: isMobile(context) ? vw(context) * 0.2 : 100,
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: item.value ? yellow : grey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(border: Border.all(color: color), color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
