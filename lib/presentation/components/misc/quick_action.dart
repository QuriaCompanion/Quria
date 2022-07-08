import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class QuickAction extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  final double width;
  const QuickAction({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width * 0.2,
      child: InkWell(
        onTap: () => onTap(),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: -math.pi / 4,
                child: Container(
                  height: (width * 0.12) - 5,
                  width: (width * 0.12) - 5,
                  decoration: const BoxDecoration(
                    color: blackLight,
                  ),
                ),
              ),
              Transform.rotate(
                angle: -math.pi / 4,
                child: Container(
                  height: width * 0.12,
                  width: width * 0.12,
                  decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                ),
              ),
              SvgPicture.asset(
                icon,
                height: width * 0.06,
                width: width * 0.06,
                color: Colors.white,
              ),
            ],
          ),
          textBodyMedium(title, utf8: false),
        ]),
      ),
    );
  }
}
