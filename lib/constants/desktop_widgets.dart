import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

Widget desktopHeader(BuildContext context,
    {required ImageProvider<Object> image, required Widget child}) {
  return Container(
    alignment: Alignment.bottomCenter,
    width: vw(context),
    height: 240,
    decoration: BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.topRight,
        fit: BoxFit.cover,
        image: image,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            black.withOpacity(0),
            black.withOpacity(1),
          ],
        ),
      ),
      alignment: Alignment.bottomLeft,
      height: 120,
      child: SizedBox(
        width: vw(context) / 2,
        child: child,
      ),
    ),
  );
}
