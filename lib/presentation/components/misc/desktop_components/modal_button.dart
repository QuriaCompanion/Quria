import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:quria/constants/styles.dart';

class ModalButton extends StatefulWidget {
  const ModalButton({Key? key}) : super(key: key);

  @override
  State<ModalButton> createState() => _ModalButtonState();
}

class _ModalButtonState extends State<ModalButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.rotate(
            angle: -math.pi / 4,
            child: Container(
              height: (MediaQuery.of(context).size.width * 0.12) - 5,
              width: (MediaQuery.of(context).size.width * 0.12) - 5,
              decoration: const BoxDecoration(
                color: blackLight,
              ),
            )),
        Transform.rotate(
            angle: -math.pi / 4,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.12,
              width: MediaQuery.of(context).size.width * 0.12,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
            )),
        SvgPicture.asset(
          'assets/icons/icon_plus.svg',
          height: MediaQuery.of(context).size.width * 0.06,
          width: MediaQuery.of(context).size.width * 0.06,
          color: Colors.white,
        )
      ],
    );
  }
}
