import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/texts.dart';

class StatNoBar extends StatelessWidget {
  final String name;
  final int value;
  final DestinyItemType? type;
  final double width;
  final double fontSize;
  final double padding;
  final double height;
  const StatNoBar({
    required this.name,
    required this.value,
    required this.fontSize,
    this.width = 600,
    this.type = DestinyItemType.Weapon,
    this.padding = 8,
    this.height = 20,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      width: width,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(width: width * 0.4 - 25, child: textCaption(name)),
        SizedBox(
            width: 25, child: Center(child: textCaptionBold(value.toString()))),
        SizedBox(
          width: width * 0.5,
        ),
      ]),
    );
  }
}
