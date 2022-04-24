import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/statsFilterHelper.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/character_appbar.dart';
import 'package:quria/presentation/screens/builder/exotic/mobile_components/exotic_mobile_item.dart';
import 'package:quria/presentation/var/routes.dart';

class ExoticMobileView extends StatefulWidget {
  final List<DestinyInventoryItemDefinition> exotics;
  final String characterId;
  const ExoticMobileView(
      {required this.exotics, required this.characterId, Key? key})
      : super(key: key);

  @override
  State<ExoticMobileView> createState() => _ExoticMobileViewState();
}

class _ExoticMobileViewState extends State<ExoticMobileView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CharacterAppbar(
          onCharacterChange: (newIndex) {
            setState(() {
              DisplayService.characterIndex = newIndex;
            });
          },
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return mobileHeader(context,
                  image: exoticHeader,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textH1("Choisis un Ã©xotique"),
                      textBodyRegular(
                          "Il sert de base pour la construction de ton build."),
                    ],
                  ));
            },
            childCount: 1,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, routeFilter,
                        arguments: StatsFilterHelper(
                            characterId: widget.characterId,
                            exoticHash: widget.exotics[index].hash!));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: globalPadding(context)),
                    child: ExoticMobileItem(item: widget.exotics[index]),
                  ),
                );
              },
              childCount: widget.exotics.length,
            ),
          ),
        )
      ],
    );
  }
}
