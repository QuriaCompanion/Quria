import 'dart:developer';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String value;
  final double? width;
  final double? height;
  final Color? txtColor;
  final Color? bgColor;

  const Button(
      {Key? key,
      required this.value,
      required this.width,
      required this.height,
      this.bgColor = Colors.black54,
      this.txtColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.black45)),
      child: Center(
        child: Text(value, style: TextStyle(color: txtColor, fontSize: 20.0)),
      ),
    );
  }
}
