import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:quria/constants/styles.dart';

class ModalButton extends StatefulWidget {
  final void Function() callback;
  final String icon;
  final String? text;
  const ModalButton({
    required this.callback,
    required this.icon,
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  State<ModalButton> createState() => _ModalButtonState();
}

class _ModalButtonState extends State<ModalButton>
    with TickerProviderStateMixin {
  bool _isHover = false;
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  late Animation<double> animation;
  setHover(int degres) {
    final angle = degres * math.pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  @override
  void initState() {
    super.initState();
    setHover(45);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.callback();
      },
      onHover: (_) {
        _isHover ? controller.forward(from: 0) : controller.reverse(from: 1);
        setHover(180);
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
                height: (vw(context) * 0.06) - 10,
                width: (vw(context) * 0.06) - 10,
                decoration: const BoxDecoration(
                  color: blackLight,
                ),
              )),
          Transform.rotate(
              angle: animation.value,
              child: Container(
                height: vw(context) * 0.06,
                width: vw(context) * 0.06,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
              )),
          SvgPicture.asset(
            widget.icon,
            height: vw(context) * 0.02,
            width: vw(context) * 0.03,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
