import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class TooltipInfo extends StatelessWidget {
  final String message;
  const TooltipInfo({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: blackLight,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: textBodyBold('i', color: Colors.white)),
      ),
    );
  }
}
