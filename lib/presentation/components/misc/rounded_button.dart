import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final bool isDisabled;
  final Color disabledColor;
  final Widget text;
  final Color textColor;
  final Color buttonColor;
  final double width;
  final double height;
  const RoundedButton({
    required this.text,
    required this.onPressed,
    this.textColor = black,
    this.buttonColor = Colors.white,
    this.disabledColor = grey,
    this.width = 150,
    this.height = 50,
    this.isDisabled = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : () => onPressed(),
      style: ElevatedButton.styleFrom(
          primary: buttonColor,
          onSurface: buttonColor,
          onPrimary: black,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: text,
    );
  }
}
