import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/models/StatWeighing.enum.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/data/providers/builder/builder_class_item_provider.dart';
import 'package:quria/data/providers/builder/builder_exotic_provider.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_stats_filter_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/builder/builder_results/builder_results_mobile_view.dart';

class BuilderResultsPage extends StatefulWidget {
  const BuilderResultsPage({
    Key? key,
  }) : super(key: key);

  @override
  BuilderResultsPageState createState() => BuilderResultsPageState();
}

class BuilderResultsPageState extends State<BuilderResultsPage> {
  late Future<List<Build>> _future;
  late List<DestinyInventoryItemDefinition> subclassMods;
  late List<ModSlots> armorMods;
  late String characterId;
  late String? subclassId;
  final manifest = ManifestService();
  @override
  void initState() {
    super.initState();
    characterId = Provider.of<CharactersProvider>(context, listen: false)
        .currentCharacter!
        .characterId!;
    subclassId =
        Provider.of<BuilderSubclassProvider>(context, listen: false).subclassId;
    subclassMods =
        Provider.of<BuilderSubclassModsProvider>(context, listen: false)
            .subclassMods;
    armorMods = Provider.of<BuilderModsProvider>(context, listen: false).mods;

    List<int> statOrder =
        Provider.of<BuilderStatsFilterProvider>(context, listen: false)
            .filters
            .map((e) => e.value)
            .toList();
    StatWeighing statWeighing =
        Provider.of<BuilderStatsFilterProvider>(context, listen: false)
            .statWeighing;
    bool considerMasterwork =
        Provider.of<BuilderCustomInfoProvider>(context, listen: false)
            .considerMasterwork;
    bool removeSunset =
        Provider.of<BuilderCustomInfoProvider>(context, listen: false)
            .removeSunset;

    int? exoticHash =
        Provider.of<BuilderExoticProvider>(context, listen: false).exoticHash;
    String classItemInstanceId =
        Provider.of<BuilderCustomInfoProvider>(context, listen: false)
            .classItemInstanceId;

    _future = BuilderService().calculateBuilds(
      data: BuilderPreparation(
        characterId: characterId,
        subclassMods: subclassMods,
        statOrder: statOrder,
        exoticHash: exoticHash,
        armorMods: armorMods,
        statWeighing: statWeighing,
        considerMasterwork: considerMasterwork,
        removeSunset: removeSunset,
        classItemInstanceId: classItemInstanceId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List<Build>> snapshot) {
          if (snapshot.hasData) {
            if (vw(context) < 1000) {
              return ScaffoldBurgerAndBackOption(
                body: BuilderResultsMobileView(
                  buildResults: snapshot.data!,
                  mods: armorMods,
                  characterId: characterId,
                  subclassId: subclassId,
                  subclassMods: subclassMods,
                ),
              );
            } else {
              return Container();
            }
          } else {
            return Container(
                height: vh(context),
                width: vw(context),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: splashBackground)),
                child: Loader(
                  splashColor: Colors.transparent,
                  animationSize: vw(context) * 0.5,
                ));
          }
        });
  }
}
