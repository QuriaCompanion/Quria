import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/screens/profile/components/character_banner_info.dart';
import 'package:quria/presentation/screens/profile/mobile_components/mobile_character_banner.dart';

class MobileCharacterChoice extends StatefulWidget {
  final Function(int) callback;
  final Function choosingCharacter;
  final int index;
  final List<DestinyCharacterComponent> characters;
  const MobileCharacterChoice(
      {required this.callback,
      required this.index,
      required this.characters,
      required this.choosingCharacter,
      Key? key})
      : super(key: key);

  @override
  State<MobileCharacterChoice> createState() => _MobileCharacterChoiceState();
}

class _MobileCharacterChoiceState extends State<MobileCharacterChoice> {
  bool choosingCharacter = false;
  List<int> order = [0, 1, 2];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          width: vw(context),
          child: SizedBox(
            height: 56,
            child: Center(
              child: MobileCharacterBanner(
                  chooseCharacter: () {
                    setState(() {
                      choosingCharacter = !choosingCharacter;
                      widget.choosingCharacter();
                    });
                  },
                  characterIndex: widget.index,
                  characters: widget.characters),
            ),
          ),
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
                  width: vw(context) * 0.064,
                )
              ],
            ),
          ),
        if (choosingCharacter && widget.characters.length > 2)
          SizedBox(
            height: (56 - (vw(context) * 0.064)) / 2,
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
                  width: vw(context) * 0.064,
                )
              ],
            ),
          ),
      ],
    );
  }
}
