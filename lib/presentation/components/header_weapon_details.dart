// import 'dart:developer';

// import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
// import 'package:bungie_api/models/destiny_item_component.dart';
// import 'package:flutter/material.dart';

// class HeaderWeaponDetails extends StatelessWidget {
//   final DestinyInventoryItemDefinition definition;
//   final DestinyItemComponent item;
//   const HeaderWeaponDetails({
//     Key? key,
//     required this.definition,
//     required this.item,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 200,
//       height: 100,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       Image(
//                         image: NetworkImage(typeImg),
//                         width: 20,
//                         height: 20,
//                       ),
//                       Text(name)
//                     ],
//                   ),
//                   Text(typeOfWeapon)
//                 ],
//               ),
//               const Spacer(),
//               Text('$value')
//             ],
//           ),
//           Row(
//             children: [
//               Image(
//                 image: NetworkImage(typeOfAmmoImg),
//                 width: 20,
//                 height: 20,
//               ),
//               Text(typeOfAmmo)
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
