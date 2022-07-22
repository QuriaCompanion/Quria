import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_desktop_view.dart';
import 'package:quria/presentation/var/routes.dart';

import 'stats_filter_mobile_view.dart';

class StatsFilterPage extends StatefulWidget {
  const StatsFilterPage({Key? key}) : super(key: key);

  @override
  State<StatsFilterPage> createState() => _StatsFilterPageState();
}

class _StatsFilterPageState extends State<StatsFilterPage> {
  @override
  Widget build(BuildContext context) {
    if (vw(context) < 1000) {
      return const ScaffoldSteps(
        route: routeSubclass,
        body: StatsFilterMobileView(),
        previousRoute: routeExotic,
      );
    } else {
      return const ScaffoldDesktop(currentRoute: routeExotic, body: BuilderDesktopView());
    }
  }
}
