import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/statsFilterHelper.model.dart';
import 'package:quria/presentation/screens/builder/exotic/mobile_components/exotic_mobile_item.dart';
import 'package:quria/presentation/var/routes.dart';

class ExoticMobileView extends StatelessWidget {
  final List<DestinyInventoryItemDefinition> exotics;
  final String characterId;
  const ExoticMobileView(
      {required this.exotics, required this.characterId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(context,
            image: exoticHeader,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textH1("Choisis un exotique"),
                textBodyRegular(
                    "Il sert de base pour la construction de ton build."),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(
              left: globalPadding(context),
              right: globalPadding(context),
              top: globalPadding(context)),
          child: Column(
            children: [
              for (DestinyInventoryItemDefinition exotic in exotics)
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, routeFilter,
                        arguments: StatsFilterHelper(
                            characterId: characterId,
                            exoticHash: exotic.hash!));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: globalPadding(context)),
                    child: ExoticMobileItem(item: exotic),
                  ),
                ),
              SizedBox(
                height: globalPadding(context) * 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
