import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class MobileNavItem extends StatelessWidget {
  final bool selected;
  final String value;
  final double width;

  const MobileNavItem(
      {required this.value, this.width = 175, this.selected = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: selected ? blackLight : black,
          borderRadius: BorderRadius.circular(99)),
      child: Center(
        child: textBodyBold(value, utf8: false),
      ),
    );
  }
}
