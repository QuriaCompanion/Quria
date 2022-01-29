import 'dart:developer';

import 'package:flutter/material.dart';

class WeaponDetailsBis extends StatelessWidget {
  final dynamic charger;
  final dynamic zoom;
  final dynamic strokesMinutes;
  final dynamic retreatDirection;
  const WeaponDetailsBis({
    Key? key,
    required this.charger,
    required this.zoom,
    required this.strokesMinutes,
    required this.retreatDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: Column(
        children: [
          Row(
            children: [
              Text('Chargeur : $charger'),
              const Spacer(),
              Text(' Zoom : $zoom'),
            ],
          ),
          Row(
            children: [
              Text('Coup par minute : $strokesMinutes'),
              const Spacer(),
              Text('Direction du recul : $retreatDirection'),
            ],
          ),
        ],
      ),
    );
  }
}
