// import 'dart:convert';

// import 'package:bungie_api/models/destiny_item_component.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:quria/data/services/bungie_api/profile.service.dart';
// import 'package:quria/presentation/components/stat_progress_bar.dart';

// class ItemDetailsWidget extends StatelessWidget {
//   final profile = ProfileService();
//   DestinyItemComponent item;
//   ItemDetailsWidget({
//     required this.item,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final sockets = profile.getItemSockets(item.itemInstanceId!);
//     final stats = profile.getPrecalculatedStats(item.itemInstanceId!);
//     return Offstage(
//       offstage: false,
//       child: Align(
//         alignment: Alignment.centerRight,
//         child: Container(
//             width: 800,
//             height: 800,
//             padding: const EdgeInsets.all(20),
//             margin: const EdgeInsets.only(right: 80),
//             decoration: BoxDecoration(
//               color: Colors.black54,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: Container(
//               margin: const EdgeInsets.only(left: 14),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 140,
//                         width: 140,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade700,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.5),
//                                 spreadRadius: 5,
//                                 blurRadius: 7,
//                                 offset: const Offset(
//                                     0, 3), // changes position of shadow
//                               ),
//                             ],
//                           ),
//                           child: Image(
//                             image: NetworkImage('https://www.bungie.net' +
//                                 _manifestParsed[item.itemHash]!
//                                     .displayProperties!
//                                     .icon!),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Intégrer main gear details
//                   SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20.0),
//                         child: Column(
//                           children: const [
//                             // mobility
//                             // if (stats['2996146975']?.value != null)
//                             //   LinearPercentIndicator(
//                             //     percent: stats['2996146975']!.value! / 42,
//                             //     progressColor: Colors.white,
//                             //     lineHeight: 24,
//                             //     width: 350,
//                             //   ),
//                             StatProgressBar(name: 'Mobilité', value: 42),
//                             StatProgressBar(name: 'Résistance', value: 42),
//                             StatProgressBar(name: 'Récupération', value: 42),
//                             StatProgressBar(name: 'Discipline', value: 42),
//                             StatProgressBar(name: 'Intelligence', value: 42),
//                             StatProgressBar(name: 'Force', value: 42),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   // Intégrer weapon details
//                   SizedBox(height: 30),
//                   Container(
//                     margin: const EdgeInsets.only(left: 10),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                             height: 80,
//                             width: 80,
//                             child: Image(
//                               image: NetworkImage('https://www.bungie.net' +
//                                   _manifestParsed[sockets![1].plugHash]!
//                                       .displayProperties!
//                                       .icon!),
//                               fit: BoxFit.fill,
//                             )),
//                         SizedBox(width: 30),
//                         SizedBox(
//                             height: 80,
//                             width: 80,
//                             child: Image(
//                               image: NetworkImage('https://www.bungie.net' +
//                                   _manifestParsed[sockets[2].plugHash]!
//                                       .displayProperties!
//                                       .icon!),
//                               fit: BoxFit.fill,
//                             )),
//                         SizedBox(width: 30),
//                         SizedBox(
//                             height: 80,
//                             width: 80,
//                             child: Image(
//                               image: NetworkImage('https://www.bungie.net' +
//                                   _manifestParsed[sockets[3].plugHash]!
//                                       .displayProperties!
//                                       .icon!),
//                               fit: BoxFit.fill,
//                             )),
//                         SizedBox(width: 15),
//                         SizedBox(
//                             height: 80,
//                             width: 80,
//                             child: Image(
//                               image: NetworkImage('https://www.bungie.net' +
//                                   _manifestParsed[sockets[4].plugHash]!
//                                       .displayProperties!
//                                       .icon!),
//                               fit: BoxFit.fill,
//                             )),
//                       ],
//                     ),
//                   ),

//                   // Créer et intégrer attributs
//                   SizedBox(height: 30),
//                   Container(
//                     margin: const EdgeInsets.only(left: 10),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                             height: 80,
//                             width: 80,
//                             child: Image(
//                               image: NetworkImage('https://www.bungie.net' +
//                                   _manifestParsed[sockets[0].plugHash]!
//                                       .displayProperties!
//                                       .icon!),
//                               fit: BoxFit.fill,
//                             )),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         SizedBox(
//                           width: 600,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 utf8.decode(
//                                     _manifestParsed[sockets[0].plugHash]!
//                                         .displayProperties!
//                                         .name!
//                                         .runes
//                                         .toList()),
//                                 style: TextStyle(
//                                     fontSize: 20, color: Colors.white),
//                                 textAlign: TextAlign.left,
//                               ),
//                               SizedBox(height: 6),
//                               Text(
//                                 utf8.decode(
//                                     _manifestParsed[sockets[0].plugHash]!
//                                         .displayProperties!
//                                         .description!
//                                         .runes
//                                         .toList()),
//                                 style: TextStyle(
//                                     fontSize: 20, color: Colors.white),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }
