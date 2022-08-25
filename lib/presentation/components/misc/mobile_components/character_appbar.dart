import 'dart:ui';

import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/presentation/components/Header/mobile_components/mobile_character_choice.dart';
import 'package:quria/presentation/components/misc/refresh_button.dart';

class CharacterAppbar extends ConsumerWidget {
  final Function(int) onCharacterChange;
  const CharacterAppbar({required this.onCharacterChange, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<DestinyCharacterComponent> characters = ref.watch(charactersProvider);

    return SliverAppBar(
      floating: true,
      actions: <Widget>[Container()],
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
      toolbarHeight: ref.watch(choosingCharacterProvider)
          ? ((globalPadding(context) * 4) + (appBarItem(context)) * 3)
          : (globalPadding(context) * 2) + appBarItem(context),
      backgroundColor: Colors.transparent,
      flexibleSpace: SizedBox(
        width: vw(context),
        height: ref.watch(choosingCharacterProvider)
            ? MediaQuery.of(context).padding.top + (globalPadding(context) * 4) + (appBarItem(context)) * 3
            : appBarHeight(context),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + globalPadding(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 56,
                  ),
                  MobileCharacterChoice(
                    characters: characters,
                  ),
                  const RefreshButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
