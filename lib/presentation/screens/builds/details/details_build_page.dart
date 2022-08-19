import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger.dart';
import 'package:quria/presentation/screens/builds/details/details_build_desktop_view.dart';
import 'package:quria/presentation/screens/builds/details/details_build_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class DetailsBuildPage extends StatelessWidget {
  const DetailsBuildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return const ScaffoldBurger(
        body: DetailsBuildMobileView(),
      );
    } else {
      return const ScaffoldDesktop(
        currentRoute: routeCreateBuild,
        body: DetailsBuildDesktopView(),
      );
    }
  }
}
