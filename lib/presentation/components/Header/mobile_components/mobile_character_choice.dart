import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/screens/profile/components/character_banner_info.dart';
import 'package:quria/presentation/screens/profile/mobile_components/mobile_character_banner.dart';

class MobileCharacterChoice extends StatefulWidget {
  final Function(int) callback;
  final Function choosingCharacter;
  final List<DestinyCharacterComponent> characters;
  const MobileCharacterChoice(
      {required this.callback,
      required this.characters,
      required this.choosingCharacter,
      Key? key})
      : super(key: key);

  @override
  State<MobileCharacterChoice> createState() => _MobileCharacterChoiceState();
}

class _MobileCharacterChoiceState extends State<MobileCharacterChoice> {
  bool choosingCharacter = false;

  @override
  Widget build(BuildContext context) {
    List order = [];
    if (DisplayService.characterIndex == 0) {
      order = [DisplayService.characterIndex, 1, 2];
    } else if (DisplayService.characterIndex == 1) {
      order = [DisplayService.characterIndex, 0, 2];
    } else if (DisplayService.characterIndex == 2) {
      order = [DisplayService.characterIndex, 0, 1];
    }
    return Column(
      children: [
        MobileCharacterBanner(
            chooseCharacter: () {
              setState(() {
                choosingCharacter = !choosingCharacter;
                widget.choosingCharacter();
              });
            },
            characterIndex: DisplayService.characterIndex,
            characters: widget.characters),
        if (choosingCharacter && widget.characters.length > 1)
          SizedBox(
            height: globalPadding(context),
          ),
        if (choosingCharacter && widget.characters.length > 1)
          InkWell(
            onTap: () {
              widget.callback(order[1]);
              setState(() {
                order = [order[1], order[0], order[2]];
                choosingCharacter = false;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CharacterBannerInfo(
                  character: widget.characters[order[1]],
                ),
                SizedBox(
                  width: appBarItem(context),
                )
              ],
            ),
          ),
        if (choosingCharacter && widget.characters.length > 2)
          SizedBox(
            height: globalPadding(context),
          ),
        if (choosingCharacter && widget.characters.length > 2)
          InkWell(
            onTap: () {
              widget.callback(order[2]);
              setState(() {
                order = [order[2], order[0], order[1]];
                choosingCharacter = false;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CharacterBannerInfo(
                  character: widget.characters[order[2]],
                ),
                SizedBox(
                  width: appBarItem(context),
                )
              ],
            ),
          ),
      ],
    );
  }
}
