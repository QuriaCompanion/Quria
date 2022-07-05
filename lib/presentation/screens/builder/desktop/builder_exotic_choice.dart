import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/builder/builder_exotic_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';

class BuilderExoticChoice extends StatefulWidget {
  const BuilderExoticChoice({Key? key}) : super(key: key);

  @override
  State<BuilderExoticChoice> createState() => _BuilderExoticChoiceState();
}

class _BuilderExoticChoiceState extends State<BuilderExoticChoice> {
  late Future<List<DestinyInventoryItemDefinition>> _exotics;

  @override
  void initState() {
    super.initState();
    _exotics = DisplayService.getExotics(
        context, Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.classType!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH1(
          AppLocalizations.of(context)!.builder_exotic_title,
          utf8: false,
        ),
        textBodyHighRegular(
          AppLocalizations.of(context)!.builder_exotic_subtitle,
          utf8: false,
        ),
        FutureBuilder<List<DestinyInventoryItemDefinition>>(
            future: _exotics,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<DestinyInventoryItemDefinition> exotics = snapshot.data!;
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: exotics.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 82,
                      mainAxisExtent: 82,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Provider.of<BuilderExoticProvider>(context, listen: false).setExoticHash(exotics[index]);
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          child: Image(
                            width: 80,
                            height: 80,
                            image: NetworkImage(DestinyData.bungieLink + exotics[index].displayProperties!.icon!),
                          ),
                        ),
                      );
                    });
              }
              return Center(
                  child:
                      Lottie.asset('assets/animations/loader.json', frameRate: FrameRate.max, width: 100, height: 100));
            })
      ],
    );
  }
}
