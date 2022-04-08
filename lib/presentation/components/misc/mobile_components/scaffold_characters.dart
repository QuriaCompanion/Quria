import 'dart:ui';

import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/Header/mobile_components/mobile_character_choice.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';

class ScaffoldCharacters extends StatefulWidget {
  final Function(int) onCharacterChange;
  final List<DestinyCharacterComponent> characters;
  final int selectedCharacterIndex;
  final Widget body;
  const ScaffoldCharacters(
      {required this.onCharacterChange,
      required this.characters,
      required this.selectedCharacterIndex,
      required this.body,
      Key? key})
      : super(key: key);

  @override
  State<ScaffoldCharacters> createState() => _ScaffoldCharactersState();
}

class _ScaffoldCharactersState extends State<ScaffoldCharacters> {
  bool choosingCharacter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Burger(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + globalPadding(context),
            ),
            icon: Icon(
              Icons.menu,
              size: vw(context) * 0.064,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        toolbarHeight: choosingCharacter
            ? MediaQuery.of(context).padding.top +
                (globalPadding(context) * 4) +
                (appBarItem(context)) * 3
            : appBarHeight(context),
        backgroundColor: Colors.transparent,
        flexibleSpace: SizedBox(
          width: vw(context),
          height: choosingCharacter
              ? MediaQuery.of(context).padding.top +
                  (globalPadding(context) * 4) +
                  (appBarItem(context)) * 3
              : appBarHeight(context),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top +
                        globalPadding(context)),
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
                    index: widget.selectedCharacterIndex,
                    characters: widget.characters),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: ghostBackground,
        child: SingleChildScrollView(
          child: widget.body,
        ),
      ),
    );
  }
}
