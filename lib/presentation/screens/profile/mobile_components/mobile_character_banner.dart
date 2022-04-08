import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/screens/profile/components/character_banner_info.dart';

class MobileCharacterBanner extends StatefulWidget {
  final List<DestinyCharacterComponent> characters;
  final int characterIndex;
  final Function chooseCharacter;
  const MobileCharacterBanner({
    Key? key,
    required this.characters,
    required this.characterIndex,
    required this.chooseCharacter,
  }) : super(key: key);

  @override
  State<MobileCharacterBanner> createState() => _MobileCharacterBannerState();
}

class _MobileCharacterBannerState extends State<MobileCharacterBanner> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.chooseCharacter();
            });
          },
          child: CharacterBannerInfo(
            character: widget.characters[widget.characterIndex],
          ),
        ),
        IconButton(
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_drop_down),
          splashRadius: vw(context) * 0.032,
          iconSize: vw(context) * 0.064,
          color: greyLight,
          onPressed: () {
            setState(() {
              widget.chooseCharacter();
            });
          },
        ),
      ],
    );
  }
}
