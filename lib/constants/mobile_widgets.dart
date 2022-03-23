import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

Widget mobileHeader(BuildContext context,
    {required String imageLink, required Widget child}) {
  return Container(
    alignment: Alignment.bottomCenter,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.width * 0.9,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitHeight, image: NetworkImage(imageLink))),
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
        height: MediaQuery.of(context).size.width / 3.17,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * globalPadding),
            child: child)),
  );
}
