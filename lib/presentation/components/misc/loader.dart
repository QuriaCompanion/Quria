import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quria/constants/styles.dart';

class Loader extends StatelessWidget {
  final String? waitingMessage;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double spacing;
  final Color animationColor;
  final Color splashColor;
  final double animationSize;
  const Loader({
    Key? key,
    this.waitingMessage,
    this.fontSize = 20,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w500,
    this.animationColor = Colors.white,
    this.splashColor = black,
    this.spacing = 20,
    this.animationSize = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: splashColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (waitingMessage != null)
            Text(
              waitingMessage!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize, fontWeight: fontWeight, color: color),
            ),
          if (waitingMessage != null)
            SizedBox(
              height: spacing,
            ),
          RepaintBoundary(
              child: Lottie.asset('assets/animations/loader.json',
                  width: animationSize, height: animationSize)),
        ],
      ),
    );
  }
}
