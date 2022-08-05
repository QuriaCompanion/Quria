import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class StatProgressBar extends StatelessWidget {
  final String name;
  final int value;
  final DestinyItemType? type;
  final double width;
  final double padding;
  final double height;
  final int? bonus;
  final int? masterwork;
  const StatProgressBar({
    required this.name,
    required this.value,
    this.width = 600,
    this.type = DestinyItemType.Weapon,
    this.padding = 8,
    this.height = 20,
    this.bonus,
    this.masterwork,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double percentage;
    double bonusPercentage = 0;
    type == DestinyItemType.Weapon ? percentage = value / 100 : percentage = value / 42;
    if (bonus != null) {
      bonusPercentage = type == DestinyItemType.Weapon ? bonus! / 100 : bonus! / 42;
    }
    if (percentage < 0) percentage = 0;
    if (percentage > 1) percentage = 1;
    if (bonusPercentage < 0) bonusPercentage = 0;
    if (bonusPercentage > 1) bonusPercentage = 1;
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      width: width,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(width: width * 0.4 - 25, child: textCaption(name)),
        SizedBox(
          width: 25,
          child: Center(
            child: textCaptionBold(bonus != null ? bonus.toString() : value.toString()),
          ),
        ),
        Stack(
          children: [
            if (percentage < bonusPercentage)
              LinearPercentIndicator(
                percent: bonusPercentage,
                barRadius: Radius.circular(height / 2),
                progressColor: Colors.blue,
                backgroundColor: grey,
                lineHeight: height,
                width: width * 0.5,
              ),
            LinearPercentIndicator(
              percent: percentage,
              barRadius: Radius.circular(height / 2),
              progressColor: bonus != null && percentage > bonusPercentage ? crucible : Colors.white,
              backgroundColor: percentage < bonusPercentage ? Colors.transparent : grey,
              lineHeight: height,
              width: width * 0.5,
            ),
            if (bonus != null && percentage > bonusPercentage)
              LinearPercentIndicator(
                percent: bonusPercentage,
                barRadius: Radius.circular(height / 2),
                progressColor: Colors.white,
                backgroundColor: Colors.transparent,
                lineHeight: height,
                width: width * 0.5,
              ),
          ],
        ),
      ]),
    );
  }
}
