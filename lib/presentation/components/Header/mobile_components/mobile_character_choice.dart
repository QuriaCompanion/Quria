import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/presentation/screens/profile/components/character_banner_info.dart';
import 'package:quria/presentation/screens/profile/mobile_components/mobile_character_banner.dart';

class MobileCharacterChoice extends ConsumerWidget {
  final List<DestinyCharacterComponent> characters;
  const MobileCharacterChoice({required this.characters, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final choosingCharacter = ref.watch(choosingCharacterProvider);

    return Column(
      children: [
        MobileCharacterBanner(
            chooseCharacter: () {
              ref.watch(choosingCharacterProvider.notifier).update((state) => state = !state);
            },
            characterIndex: 0,
            character: characters.first),
        if (choosingCharacter && characters.length > 1)
          SizedBox(
            height: globalPadding(context),
          ),
        if (choosingCharacter && characters.length > 1)
          InkWell(
            onTap: () {
              setCurrentCharacter(1, ref);
              ref.watch(choosingCharacterProvider.notifier).update((state) => state = !state);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CharacterBannerInfo(
                  character: characters[1],
                ),
                SizedBox(
                  width: appBarItem(context),
                )
              ],
            ),
          ),
        if (choosingCharacter && characters.length > 2)
          SizedBox(
            height: globalPadding(context),
          ),
        if (choosingCharacter && characters.length > 2)
          InkWell(
            onTap: () {
              setCurrentCharacter(2, ref);
              ref.watch(choosingCharacterProvider.notifier).update((state) => state = !state);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CharacterBannerInfo(
                  character: characters[2],
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
