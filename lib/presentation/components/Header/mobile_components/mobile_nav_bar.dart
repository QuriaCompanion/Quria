import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/Header/mobile_components/mobile_character_choice.dart';

class MobileNavBarCharacterChoice extends StatefulWidget {
  final Function(int) onCharacterChange;
  final int index;
  final List<DestinyCharacterComponent> characters;
  const MobileNavBarCharacterChoice(
      {required this.onCharacterChange,
      required this.index,
      required this.characters,
      Key? key})
      : super(key: key);

  @override
  State<MobileNavBarCharacterChoice> createState() =>
      _MobileNavBarCharacterChoiceState();
}

class _MobileNavBarCharacterChoiceState
    extends State<MobileNavBarCharacterChoice> {
  bool choosingCharacter = false;
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
            top: (56 - (vw(context) * 0.064)) / 2,
          ),
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }),
      toolbarHeight: choosingCharacter ? 130 : 56,
      backgroundColor: Colors.transparent,
      flexibleSpace: MobileCharacterChoice(
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
          index: widget.index,
          characters: widget.characters),
    );
  }
}
