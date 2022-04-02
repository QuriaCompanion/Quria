import 'dart:async';

import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_characters.dart';
import 'package:quria/presentation/screens/builder/exotic/exotic_mobile_view.dart';

class ExoticWidget extends StatefulWidget {
  const ExoticWidget({Key? key}) : super(key: key);

  @override
  _ExoticWidgetState createState() => _ExoticWidgetState();
}

class _ExoticWidgetState extends State<ExoticWidget> {
  final DisplayService display = DisplayService();
  late Future<List<DestinyInventoryItemDefinition>> _future;
  bool isLoading = true;
  int selectedCharacterIndex = 0;
  String searchName = "";
  @override
  void initState() {
    super.initState();
    final currentCharacter = ProfileService().getCharacters()[0];
    _future = display.getExotics(currentCharacter.classType!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: ((context,
          AsyncSnapshot<List<DestinyInventoryItemDefinition>> snapshot) {
        List<DestinyCharacterComponent> characters =
            ProfileService().getCharacters();
        if (snapshot.hasData) isLoading = false;
        if (isLoading) {
          return const Loader();
        } else {
          if (vw(context) < 850) {
            return ScaffoldCharacters(
              characters: characters,
              selectedCharacterIndex: selectedCharacterIndex,
              onCharacterChange: (int index) {
                setState(() {
                  selectedCharacterIndex = index;
                  _future = display.getExotics(characters[index].classType!);
                });
              },
              body: ExoticMobileView(
                characterId: characters[selectedCharacterIndex].characterId!,
                exotics: snapshot.data!,
              ),
            );
          } else {
            return Container();
          }
        }
      }),
    );
  }
}


// class ExoticWebView extends StatelessWidget {
//   const ExoticWebView({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.only(
//             top: globalPadding(context),
//             left: globalPadding(context),
//             right: globalPadding(context)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Veuillez choisir un exotique",
//               textAlign: TextAlign.left,
//               style: TextStyle(color: Colors.white, fontSize: titleFontSize),
//             ),
//             SizedBox(height: padding),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 30,
//                   child: Text(subtitle,
//                       style: TextStyle(
//                           color: Colors.white, fontSize: textFontSize)),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.7,
//                   child: VerticalDivider(
//                     color: Colors.white,
//                     thickness: 1.5,
//                     width: padding * 2,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 60,
//                   child: Column(
//                     children: [
//                       CharacterChoice(
//                           callback: (classType) {
//                             setState(() {
//                               isLoading = true;
//                               _future = display.getExotics(classType);
//                               isLoading = false;
//                             });
//                           },
//                           width: vw(context) - padding * 2),
//                       FutureBuilder(
//                           future: _future,
//                           builder: (context,
//                               AsyncSnapshot<
//                                       List<DestinyInventoryItemDefinition>>
//                                   snapshot) {
//                             if (snapshot.hasData) {
//                               list = <Widget>[];
//                               for (var i = 0; i < snapshot.data!.length; i++) {
//                                 list.add(Padding(
//                                   padding: EdgeInsets.all(itemPadding / 2),
//                                   child: InkWell(
//                                       onTap: () => {
//                                             Navigator.pushNamed(
//                                                 context, routeFilter,
//                                                 arguments:
//                                                     snapshot.data![i].hash)
//                                           },
//                                       child: NamedItem(
//                                           width: itemSize,
//                                           value: snapshot.data![i])),
//                                 ));
//                               }
//                               return Wrap(
//                                 alignment: WrapAlignment.center,
//                                 children: list,
//                               );
//                             } else {
//                               return const Loader();
//                             }
//                           }),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }