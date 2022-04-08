import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class QuickAction extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  const QuickAction(
      {required this.icon, required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: SizedBox(
        height: vw(context) * 0.2,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: -math.pi / 4,
                    child: Container(
                      height: (vw(context) * 0.12) - 5,
                      width: (vw(context) * 0.12) - 5,
                      decoration: const BoxDecoration(
                        color: blackLight,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: -math.pi / 4,
                    child: Container(
                      height: vw(context) * 0.12,
                      width: vw(context) * 0.12,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                    ),
                  ),
                  SvgPicture.asset(
                    icon,
                    height: vw(context) * 0.06,
                    width: vw(context) * 0.06,
                    color: Colors.white,
                  ),
                ],
              ),
              textBodyMedium(title),
            ]),
      ),
    );
  }
}
