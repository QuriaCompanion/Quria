// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/components/misc/page_loader.dart';
import 'package:quria/presentation/screens/builder/builder_results/builder_results_desktop_view.dart';
import 'package:quria/presentation/screens/builder/builder_results/builder_results_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class BuilderResultsPage extends StatefulWidget {
  const BuilderResultsPage({
    Key? key,
  }) : super(key: key);

  @override
  BuilderResultsPageState createState() => BuilderResultsPageState();
}

class BuilderResultsPageState extends State<BuilderResultsPage> {
  late Future<List<Build>> _future;
  late BuilderHelper data;
  final manifest = ManifestService();
  @override
  void initState() {
    super.initState();
    data = BuilderService().buildPreparation(context);
    _future = BuilderService().calculateBuilds(
      data: data,
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
                width: vw(context),
                body: BuilderResultsMobileView(
                  buildResults: snapshot.data!,
                ),
              );
            } else {
              return ScaffoldDesktop(
                body: BuilderResultsDesktopView(
                  buildResults: snapshot.data!,
                ),
                currentRoute: routeExotic,
              );
            }
          } else {
            return const PageLoader(
              isBuilderWeb: kIsWeb,
            );
          }
        });
  }
}
