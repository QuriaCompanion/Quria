// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

// class StatProgressBar extends StatelessWidget {
//   final String name;
//   final int value;
//   final int scale;
//   final double width;
//   final double font;

//   const StatProgressBar(
//       {Key? key,
//       required this.name,
//       required this.value,
//       this.width = 350,
//       this.scale = 100,
//       this.font = 12})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//       Text(
//         '$name : $value',
//         style: TextStyle(fontSize: font, color: Colors.white),
//       ),
//       LinearPercentIndicator(
//         percent: value / scale,
//         progressColor: Colors.white,
//         lineHeight: 24,
//         width: width,
//       ),
//     ]);
//   }
// }
