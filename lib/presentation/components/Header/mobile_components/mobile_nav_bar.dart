import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/presentation/components/Header/mobile_components/mobile_character_choice.dart';

class MobileNavBarCharacterChoice extends ConsumerWidget {
  final Function(int) onCharacterChange;
  final int index;
  final List<DestinyCharacterComponent> characters;
  const MobileNavBarCharacterChoice(
      {required this.onCharacterChange, required this.index, required this.characters, Key? key})
      : super(key: key);

  @override
  AppBar build(BuildContext context, WidgetRef ref) {
    return AppBar(
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
                child: SvgPicture.asset(
                  "assets/icons/Menu.svg",
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
      toolbarHeight: ref.watch(choosingCharacterProvider) ? 130 : 56,
      backgroundColor: Colors.transparent,
      flexibleSpace: MobileCharacterChoice(characters: characters),
    );
  }
}
