// import 'package:flutter/material.dart';
// import 'package:quria/data/models/BuildResponse.model.dart';

// class ExtendedBuilderMisc extends StatelessWidget {
//   final Misc miscData;
//   final double padding;
//   const ExtendedBuilderMisc(
//       {required this.miscData, this.padding = 15, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: padding),
//       child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           textDirection: TextDirection.ltr,
//           children: [
//             Image.network(miscData.icon),
//             Text(miscData.name, style: const TextStyle(color: Colors.white70)),
//             Text('${miscData.number}',
//                 style: const TextStyle(color: Colors.white70))
//           ]),
//     );
//   }
// }
