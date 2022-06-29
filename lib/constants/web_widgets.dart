import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

Widget webHeader(BuildContext context, {required ImageProvider<Object> image, required Widget child}) {
  return Container(
    alignment: Alignment.bottomCenter,
    width: vw(context),
    height: 300,
    decoration: BoxDecoration(image: DecorationImage(alignment: Alignment.topCenter, fit: BoxFit.cover, image: image)),
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
        alignment: Alignment.bottomCenter,
        height: 300,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(width: vw(context) - globalPadding(context) * 2, child: child))),
  );
}
