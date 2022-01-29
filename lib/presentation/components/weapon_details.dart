import 'dart:developer';

import 'package:flutter/material.dart';

class WeaponDetails extends StatelessWidget {
  final dynamic charger;
  final dynamic zoom;
  final dynamic strokesMinutes;
  final dynamic retreatDirection;
  const WeaponDetails({
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
              Text(' Zoom : $zoom'),
            ],
          ),
          Row(
            children: [
              Text('Coup par minute : $strokesMinutes'),
              Text('Direction du recul : $retreatDirection'),
            ],
          ),
        ],
      ),
    );
  }
}
