import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_base.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/builder/builder_results/builder_results_mobile_view.dart';

class BuilderResultsPage extends StatefulWidget {
  final BuilderPreparation data;
  const BuilderResultsPage({Key? key, required this.data}) : super(key: key);

  @override
  _BuilderResultsPageState createState() => _BuilderResultsPageState();
}

class _BuilderResultsPageState extends State<BuilderResultsPage> {
  late Future<List<Build>> _future;
  final manifest = ManifestService();
  double singleBuildWidth = 600;
  @override
  void initState() {
    super.initState();
    _future = BuilderService().calculateBuilds(
      data: widget.data,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 600) {
      double sidePadding = vw(context) * 0.025;
      singleBuildWidth = vw(context) - sidePadding * 2;
    }
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List<Build>> snapshot) {
          if (snapshot.hasData) {
            if (vw(context) < 850) {
              return ScaffoldBurgerAndBackOption(
                body: BuilderResultsMobileView(
                  buildResults: snapshot.data!,
                  mods: widget.data.armorMods,
                  characterId: widget.data.characterId,
                ),
              );
            } else {
              return Container();
            }
          } else {
            return Container(
              decoration: greyTransparentBackground,
              child: const Loader(
                  waitingMessage:
                      'Veuillez patienter nous recherchons les meilleurs builds pour vous!'),
            );
          }
        });
  }
}
