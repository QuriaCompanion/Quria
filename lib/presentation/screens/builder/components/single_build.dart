// import 'package:bungie_api/models/destiny_item_component.dart';
// import 'package:flutter/material.dart';
// import 'package:quria/constants/styles.dart';
// import 'package:quria/data/models/BuildResponse.model.dart';
// import 'package:quria/data/services/bungie_api/account.service.dart';
// import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
// import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
// import 'package:quria/data/services/bungie_api/profile.service.dart';
// import 'package:quria/data/services/manifest/manifest.service.dart';
// import 'package:quria/firebase/FirestoreHelper.dart';
// import 'package:quria/firebase/firestore_builder.dart';
// import 'package:quria/presentation/components/misc/icon_item.dart';
// import 'package:quria/presentation/components/misc/statistic_display.dart';
// import 'package:quria/presentation/screens/builder/components/extended_builder_info.dart';

// class SingleBuild extends StatelessWidget {
//   final Build buildInfo;
//   final double width;
//   final double spacing;
//   final double padding;
//   final double fontSize;
//   const SingleBuild(
//       {required this.buildInfo,
//       this.padding = 15,
//       this.spacing = 30,
//       this.width = 600,
//       this.fontSize = 25,
//       Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double imageSize = 100;
//     if (vw(context) < 600) {
//       imageSize = width / 6;
//     }
//     List<DestinyItemComponent> items = ProfileService().getItemsByInstanceId([
//       buildInfo.equipement[0].itemInstanceId,
//       buildInfo.equipement[1].itemInstanceId,
//       buildInfo.equipement[2].itemInstanceId,
//       buildInfo.equipement[3].itemInstanceId
//     ]);
//     String characterId = ProfileService().getCharacterIdByClass(ManifestService
//         .manifestParsed
//         .destinyInventoryItemDefinition![items[0].itemHash]!
//         .classType!);
//     items.sort(((a, b) => ManifestService
//                 .manifestParsed
//                 .destinyInventoryItemDefinition![a.itemHash]!
//                 .itemSubType!
//                 .index >
//             ManifestService.manifestParsed
//                 .destinyInventoryItemDefinition![b.itemHash]!.itemSubType!.index
//         ? 1
//         : -1));
//     var values = [
//       buildInfo.stats.statistics[StatsHash.mobility],
//       buildInfo.stats.statistics[StatsHash.resilience],
//       buildInfo.stats.statistics[StatsHash.recovery],
//       buildInfo.stats.statistics[StatsHash.discipline],
//       buildInfo.stats.statistics[StatsHash.intellect],
//       buildInfo.stats.statistics[StatsHash.strength]
//     ];
//     List<Widget> listStats = <Widget>[];
//     for (var i = 0; i < 6; i++) {
//       listStats.add(VerticalStatisticDisplay(
//         value: values[i]!,
//         icon: DestinyData.statsIcon[i],
//         width: (width - (padding * 2)) / 6,
//       ));
//     }
//     List<Widget> listArmor = <Widget>[];
//     for (var i = 0; i < buildInfo.equipement.length; i++) {
//       listArmor.add(Container(
//           decoration: regularShadow,
//           child: ItemIcon(
//               imageSize: imageSize,
//               displayHash: ManifestService
//                   .manifestParsed
//                   .destinyInventoryItemDefinition![
//                       items[i].overrideStyleItemHash ?? items[i].itemHash]!
//                   .hash!)));
//     }
//     return Column(
//       children: [
//         Center(
//           child: Container(
//             decoration: greyTransparentBackground,
//             padding: EdgeInsets.all(padding),
//             width: width,
//             child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Base: ${buildInfo.stats.base}',
//                             style: TextStyle(
//                                 color: Colors.white70, fontSize: fontSize)),
//                         Text('Final: ${buildInfo.stats.max}',
//                             style: TextStyle(
//                                 color: Colors.white70, fontSize: fontSize))
//                       ]),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: padding),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: listStats),
//                   ),
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: listArmor),
//                   ElevatedButton(
//                       onPressed: () async => {
//                             FirestoreHelper().create(
//                                 userId: (await AccountService()
//                                     .getCurrentMembershipId())!,
//                                 helmet: items[0].itemInstanceId!,
//                                 gauntlet: items[1].itemInstanceId!,
//                                 chest: items[2].itemInstanceId!,
//                                 boots: items[3].itemInstanceId!)
//                           },
//                       child: const Text('Enregistrer')),
//                   ElevatedButton(
//                       onPressed: () async {
//                         for (Armor item in buildInfo.equipement) {
//                           try {
//                             await BungieApiService().transferItem(
//                                 item.itemInstanceId, characterId,
//                                 transferToVault: false,
//                                 itemHash: item.hash,
//                                 stackSize: 1);
//                             await BungieApiService()
//                                 .equipItem(item.itemInstanceId, characterId);
//                           } catch (e) {
//                             await BungieApiService()
//                                 .equipItem(item.itemInstanceId, characterId);
//                           }
//                         }
//                       },
//                       child: const Text("Équiper")),
//                   ExtendedBuilderInfo(
//                       padding: padding,
//                       buildInfo: buildInfo,
//                       fontSize: fontSize),
//                 ]),
//           ),
//         ),
//         SizedBox(
//           height: spacing,
//         )
//       ],
//     );
//   }

//   saveBuild(context, items) {
//     String buildName = "";

//     Widget okButton = ElevatedButton(
//       child: const Text("Enregistrer"),
//       onPressed: () {
//         if (buildName.isNotEmpty) {
//           FirestoreBuilder().create(name: buildName, armor: items);
//           Navigator.pop(context);
//         }
//       },
//     );
//     Widget cancelButton = ElevatedButton(
//       child: const Text("Annuler"),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );

//     return showDialog(
//       context: context,
//       builder: (context) => StatefulBuilder(builder: (context, setState) {
//         return AlertDialog(
//           title: const Text("Nom de votre build"),
//           content: TextField(
//             onChanged: (value) {
//               setState(() {
//                 buildName = value;
//               });
//             },
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'build name',
//             ),
//           ),
//           actions: [
//             cancelButton,
//             okButton,
//           ],
//         );
//       }),
//     );
//   }
// }
