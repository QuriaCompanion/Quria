import 'dart:async';

import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';
import 'package:quria/presentation/screens/builder/exotic/exotic_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class ExoticWidget extends StatefulWidget {
  const ExoticWidget({Key? key}) : super(key: key);

  @override
  ExoticWidgetState createState() => ExoticWidgetState();
}

class ExoticWidgetState extends State<ExoticWidget> {
  final DisplayService display = DisplayService();
  late Future<List<DestinyInventoryItemDefinition>> _future;
  bool isLoading = true;
  String searchName = "";
  @override
  void initState() {
    super.initState();
    final currentCharacter =
        ProfileService().getCharacters()[DisplayService.characterIndex];
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
          return Container(
              height: vh(context),
              width: vw(context),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: splashBackground)),
              child: Loader(
                splashColor: Colors.transparent,
                animationSize: vw(context) * 0.5,
              ));
        } else {
          if (vw(context) < 1000) {
            return Scaffold(
              backgroundColor: black,
              drawer: const Burger(),
              body: ExoticMobileView(
                characterId:
                    characters[DisplayService.characterIndex].characterId!,
                exotics: snapshot.data!,
                onCharacterChange: (newIndex) {
                  DisplayService.characterIndex = newIndex;
                  Navigator.popAndPushNamed(context, routeExotic);
                },
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
