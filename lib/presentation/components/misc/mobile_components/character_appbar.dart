import 'dart:ui';

import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/presentation/components/Header/mobile_components/mobile_character_choice.dart';

class CharacterAppbar extends StatefulWidget {
  final Function(int) onCharacterChange;
  const CharacterAppbar({required this.onCharacterChange, Key? key}) : super(key: key);

  @override
  State<CharacterAppbar> createState() => _CharacterAppbarState();
}

class _CharacterAppbarState extends State<CharacterAppbar> {
  late List<DestinyCharacterComponent> characters;
  @override
  initState() {
    super.initState();
    characters = Provider.of<CharactersProvider>(context, listen: false).characters;
  }

  bool choosingCharacter = false;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leading: Builder(
        builder: (context) {
          return InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + globalPadding(context),
              ),
              child: SizedBox(
                width: appBarItem(context),
                height: appBarItem(context),
                child: SvgPicture.asset("assets/icons/Menu.svg", color: Colors.white),
              ),
            ),
          );
        },
      ),
      toolbarHeight: choosingCharacter
          ? ((globalPadding(context) * 4) + (appBarItem(context)) * 3)
          : (globalPadding(context) * 2) + appBarItem(context),
      backgroundColor: Colors.transparent,
      flexibleSpace: SizedBox(
        width: vw(context),
        height: choosingCharacter
            ? MediaQuery.of(context).padding.top + (globalPadding(context) * 4) + (appBarItem(context)) * 3
            : appBarHeight(context),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + globalPadding(context)),
              child: MobileCharacterChoice(
                callback: (newIndex) {
                  setState(() {
                    widget.onCharacterChange(newIndex);
                    choosingCharacter = !choosingCharacter;
                  });
                },
                choosingCharacter: () {
                  setState(() {
                    choosingCharacter = !choosingCharacter;
                  });
                },
                characters: characters,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
