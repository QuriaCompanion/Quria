import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/screens/builder/exotic/mobile_components/exotic_mobile_item.dart';

class ExoticMobileView extends StatelessWidget {
  final List<DestinyInventoryItemDefinition> exotics;
  const ExoticMobileView({required this.exotics, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(context,
            imageLink: "",
            child: Column(
              children: [
                textH1("Choisis un exotique"),
                textBodyRegular(
                    "Il sert de base pour la construction de ton build"),
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
                Padding(
                  padding: EdgeInsets.only(bottom: globalPadding(context)),
                  child: ExoticMobileItem(item: exotic),
                )
            ],
          ),
        )
      ],
    );
  }
}
