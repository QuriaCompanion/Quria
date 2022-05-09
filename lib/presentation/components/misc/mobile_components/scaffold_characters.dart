import 'dart:ui';

import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/Header/mobile_components/mobile_character_choice.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';

class ScaffoldCharacters extends StatefulWidget {
  final Function(int) onCharacterChange;
  final List<DestinyCharacterComponent> characters;
  final Widget body;
  const ScaffoldCharacters(
      {required this.onCharacterChange,
      required this.characters,
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
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top +
                      globalPadding(context),
                ),
                child: SizedBox(
                  width: appBarItem(context),
                  height: appBarItem(context),
                  child: SvgPicture.asset(
                    "assets/icons/Menu.svg",
                    color: Colors.white,
                  ),
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
                  characters: widget.characters,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: blackBackground,
        child: SingleChildScrollView(
          child: widget.body,
        ),
      ),
    );
  }
}
