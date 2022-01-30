import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String waitingMessage;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double spacing;
  final Color animationColor;
  const Loader({
    Key? key,
    this.waitingMessage = 'Veuillez patienter...',
    this.fontSize = 20,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w500,
    this.animationColor = Colors.white,
    this.spacing = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          waitingMessage,
          style: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: color),
        ),
        SizedBox(
          height: spacing,
        ),
        CircularProgressIndicator(color: animationColor),
      ],
    );
  }
}
