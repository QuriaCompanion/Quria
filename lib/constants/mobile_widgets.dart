import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

Widget mobileHeader(
  BuildContext context, {
  required ImageProvider<Object> image,
  required Widget child,
  double? width,
}) {
  width ??= vw(context);
  return Container(
    alignment: Alignment.bottomCenter,
    width: width,
    height: width * 0.9,
    decoration: BoxDecoration(
        image: DecorationImage(
            alignment: Alignment.topRight, fit: BoxFit.cover, image: image)),
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
        height: width / 3.17,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
            child: SizedBox(
                width: width - globalPadding(context) * 2, child: child))),
  );
}

Widget mobileSection(
  BuildContext context, {
  required String title,
  required Widget child,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: globalPadding(context)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH2(title, utf8: false),
        const Divider(
          color: blackLight,
          height: 22,
          thickness: 1,
        ),
        child
      ],
    ),
  );
}

Widget mobileSectionInverted(
  BuildContext context, {
  bool utf8 = true,
  required String title,
  required Widget child,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: globalPadding(context)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH2(title, utf8: utf8),
        SizedBox(
          height: globalPadding(context) / 2,
        ),
        child,
        const Divider(
          color: blackLight,
          height: 22,
          thickness: 1,
        ),
      ],
    ),
  );
}

Widget mobileCard(
  BuildContext context, {
  required Widget child,
}) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: globalPadding(context)) * 0.875,
      decoration: const BoxDecoration(
          color: blackLight,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      width: double.infinity,
      child: child);
}

Widget pictureBordered({required ImageProvider image, double size = 44}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 1,
      ),
    ),
    child: Image(image: image),
  );
}
