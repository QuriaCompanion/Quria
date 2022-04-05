import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;
  final double width;
  final double height;
  const RoundedButton(
      {required this.text,
      required this.onPressed,
      this.textColor = black,
      this.buttonColor = Colors.white,
      this.width = 150,
      this.height = 50,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: textBodyMedium(text, color: textColor),
      style: ElevatedButton.styleFrom(
          primary: buttonColor,
          fixedSize: Size(width, height),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    );
  }
}
