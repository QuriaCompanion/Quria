import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/presentation/screens/builder/builder_results/builder_results_mobile_item.dart';

class BuilderResultsMobileView extends StatelessWidget {
  final List<Build> buildResults;
  final List<ModSlots> mods;
  final String characterId;
  const BuilderResultsMobileView(
      {required this.buildResults,
      required this.characterId,
      required this.mods,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(context,
            image: const NetworkImage(
                "https://www.bungie.net/common/destiny2_content/screenshots/2842471112.jpg"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textH1("Builds recommandÃ©s"),
                textBodyRegular(
                    "Voici des builds adaptÃ©s a ce que tu recherches."),
              ],
            )),
        Column(children: [
          for (var buildResult in buildResults)
            Padding(
              padding: EdgeInsets.all(globalPadding(context)),
              child: BuilderResultsMobileItem(
                buildResult: buildResult,
                characterId: characterId,
                mods: mods,
              ),
            ),
        ])
      ],
    );
  }
}
