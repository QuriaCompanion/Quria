import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math' as math;

class RefreshButton extends ConsumerStatefulWidget {
  const RefreshButton({
    Key? key,
  }) : super(key: key);

  @override
  RefreshButtonState createState() => RefreshButtonState();
}

class RefreshButtonState extends ConsumerState<RefreshButton> with AnimationMixin {
  late AnimationController angleController;
  late Animation<double> angle;
  static const duration = Duration(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    angleController = createController()..mirror(duration: duration);

    angle = Tween(begin: 0.0, end: math.pi * 4).animate(angleController);
    angleController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        ProfileService().fetchProfileData(ref);
        await angleController.forward();
        angleController.reset();
      },
      child: SizedBox(
        width: 56,
        child: Transform.rotate(
          angle: angle.value,
          child: const Icon(
            Icons.refresh_sharp,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
