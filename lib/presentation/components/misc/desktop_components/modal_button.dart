import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:quria/constants/styles.dart';
import 'package:simple_animations/simple_animations.dart';

class ModalButton extends StatefulWidget {
  final void Function() callback;
  final String icon;
  final double? width;
  const ModalButton({
    required this.callback,
    required this.icon,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<ModalButton> createState() => _ModalButtonState();
}

class _ModalButtonState extends State<ModalButton> with AnimationMixin {
  bool _isHover = false;
  late AnimationController angleController;
  late AnimationController colorController;
  late Animation<double> angle;
  late Animation<Color?> color;
  static const duration = Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    angleController = createController()..mirror(duration: duration);
    colorController = createController()..mirror(duration: duration);

    angle = Tween(begin: -math.pi / 4, end: math.pi / 4).animate(angleController);
    color = ColorTween(begin: Colors.white, end: yellow).animate(colorController);
    angleController.stop();
    colorController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.callback();
      },
      onHover: (_) {
        if (_isHover) {
          angleController.reverse();
          colorController.reverse();
        } else {
          angleController.forward();
          colorController.forward();
        }
        setState(() {
          _isHover = !_isHover;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                height: widget.width != null ? widget.width! - 10 : (vw(context) * 0.04) - 10,
                width: widget.width != null ? widget.width! - 10 : (vw(context) * 0.04) - 10,
                decoration: BoxDecoration(
                  color: color.value ?? Colors.white,
                ),
              )),
          Transform.rotate(
              angle: angle.value,
              child: Container(
                height: widget.width ?? vw(context) * 0.04,
                width: widget.width ?? vw(context) * 0.04,
                decoration: BoxDecoration(
                  border: Border.all(color: color.value ?? Colors.white),
                ),
              )),
          SvgPicture.asset(
            widget.icon,
            height: widget.width != null ? widget.width! / 2 : vw(context) * 0.015,
            width: widget.width != null ? widget.width! / 2 : vw(context) * 0.015,
            color: black,
          ),
        ],
      ),
    );
  }
}
