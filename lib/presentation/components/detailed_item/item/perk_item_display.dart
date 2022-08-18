import 'package:extended_image/extended_image.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PerkItemDisplay extends StatelessWidget {
  final DestinyInventoryItemDefinition perk;
  final bool loading;
  final double iconSize;
  final bool selected;
  const PerkItemDisplay(
      {required this.perk, required this.iconSize, this.loading = false, this.selected = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = iconSize / 2;
    return Stack(alignment: Alignment.center, children: [
      if (loading)
        SleekCircularSlider(
          appearance: CircularSliderAppearance(
              size: iconSize,
              customColors: CustomSliderColors(dotColor: blueEquipped, progressBarColor: blueEquipped),
              spinnerMode: true),
        ),
      CircleAvatar(
        radius: radius * 0.98,
        backgroundColor: grey,
        child: CircleAvatar(
          backgroundColor: const Color(0xFF24262A),
          radius: radius * 0.95,
          child: CircleAvatar(
            radius: radius * 0.8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: radius * 0.75,
              backgroundColor: selected ? blueEquipped : const Color(0xFF505155),
              child: ExtendedImage.network(
                '${DestinyData.bungieLink}${perk.displayProperties!.icon!}?t=123456',
                width: iconSize * 0.5,
                height: iconSize * 0.5,
                timeLimit: const Duration(seconds: 10),
                cache: true,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
                printError: false,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
