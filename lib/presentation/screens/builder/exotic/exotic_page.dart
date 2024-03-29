import 'dart:async';

import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/texts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';
import 'package:quria/presentation/components/misc/page_loader.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_desktop_view.dart';
import 'package:quria/presentation/screens/builder/exotic/exotic_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class ExoticWidget extends StatefulWidget {
  const ExoticWidget({Key? key}) : super(key: key);

  @override
  ExoticWidgetState createState() => ExoticWidgetState();
}

class ExoticWidgetState extends State<ExoticWidget> {
  late DestinyCharacterComponent currentCharacter;
  late Future<List<DestinyInventoryItemDefinition>> _future;
  bool isLoading = true;
  String searchName = "";
  @override
  void initState() {
    super.initState();
    currentCharacter =
        Provider.of<CharactersProvider>(context, listen: false).currentCharacter as DestinyCharacterComponent;
    _future = DisplayService.getExotics(context, currentCharacter.classType!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: ((context, AsyncSnapshot<List<DestinyInventoryItemDefinition>> snapshot) {
        if (snapshot.hasData) isLoading = false;
        if (isLoading) {
          return const PageLoader();
        } else {
          if (isMobile(context)) {
            return Scaffold(
              backgroundColor: black,
              drawer: const Burger(),
              body: ExoticMobileView(
                characterId: currentCharacter.characterId!,
                exotics: snapshot.data!,
                onCharacterChange: (newIndex) {
                  Provider.of<CharactersProvider>(context, listen: false).setCurrentCharacter(newIndex);
                  Navigator.popAndPushNamed(context, routeExotic);
                },
              ),
              floatingActionButton: RoundedButton(
                  text: textBodyBold(
                    AppLocalizations.of(context)!.next,
                    utf8: false,
                    color: black,
                  ),
                  width: 200,
                  height: 56,
                  onPressed: () => Navigator.pushNamed(context, routeFilter)),
            );
          } else {
            return const ScaffoldDesktop(currentRoute: routeExotic, body: BuilderDesktopView());
          }
        }
      }),
    );
  }
}
