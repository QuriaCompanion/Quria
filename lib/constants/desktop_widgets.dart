import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/desktop_components/modal_button.dart';

Widget desktopHeader(
  BuildContext context, {
  required ImageProvider<Object> image,
  required Widget child,
}) {
  return Container(
    alignment: Alignment.bottomCenter,
    width: vw(context),
    height: vw(context) * 0.2,
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
      height: vw(context) * 0.15,
      child: SizedBox(
        width: vw(context) / 2,
        child: child,
      ),
    ),
  );
}

Widget desktopModal(BuildContext context, {required Widget child}) {
  return Stack(
    children: [
      Center(
        child: SizedBox(
          width: vw(context) * 0.4,
          child: Material(
            type: MaterialType.card,
            color: Colors.transparent,
            child: SingleChildScrollView(child: child),
          ),
        ),
      ),
      Positioned(
        top: vh(context) * 0.2,
        right: vw(context) * 0.2,
        child: Column(children: [
          ModalButton(),
          ModalButton(),
          ModalButton(),
          ModalButton(),
        ]),
      ),
    ],
  );
}
