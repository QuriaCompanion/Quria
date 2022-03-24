import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quria/constants/texts.dart';

class StatProgressBar extends StatelessWidget {
  final String name;
  final int value;
  final DestinyItemType? type;
  final double width;
  final double fontSize;
  final double padding;
  final double height;
  const StatProgressBar({
    Key? key,
    required this.name,
    required this.value,
    required this.fontSize,
    this.width = 600,
    this.type = DestinyItemType.Weapon,
    this.padding = 8,
    this.height = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final double percentage;
    type == DestinyItemType.Weapon
        ? percentage = value / 100
        : percentage = value / 42;
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      width: width,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        textCaption(name),
        SizedBox(
            width: 25, child: Center(child: textCaptionBold(value.toString()))),
        LinearPercentIndicator(
          percent: percentage,
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Colors.white,
          backgroundColor: Colors.white.withOpacity(0.5),
          lineHeight: height,
          width: width * 0.5,
        ),
      ]),
    );
  }
}
