import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/screens/profile/components/character_banner_info.dart';

class MobileCharacterBanner extends StatelessWidget {
  final DestinyCharacterComponent character;
  final int characterIndex;
  final Function chooseCharacter;
  const MobileCharacterBanner({
    Key? key,
    required this.character,
    required this.characterIndex,
    required this.chooseCharacter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            chooseCharacter();
          },
          child: CharacterBannerInfo(
            character: character,
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
            chooseCharacter();
          },
        ),
      ],
    );
  }
}
