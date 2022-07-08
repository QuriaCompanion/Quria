import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
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
            return Container(
                height: vh(context),
                width: vw(context),
                decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: splashBackground)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Loader(
                        splashColor: Colors.transparent,
                        animationSize: 300,
                      ),
                      textH1("Hey I am a lazy ghost so I don't turn around while you wait for your builds",
                          utf8: false),
                      textH1("but don't worry one day I'll turn like a big boy", utf8: false)
                    ],
                  ),
                ));
          }
        });
  }
}
