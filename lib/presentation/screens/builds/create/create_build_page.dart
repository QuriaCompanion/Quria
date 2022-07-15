import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger.dart';
import 'package:quria/presentation/screens/builds/create/create_build_desktop_view.dart';
import 'package:quria/presentation/screens/builds/create/create_build_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class CreateBuildPage extends StatelessWidget {
  const CreateBuildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 1000) {
      return const ScaffoldBurger(
        body: CreateBuildMobileView(),
      );
    } else {
      return const ScaffoldDesktop(
        currentRoute: routeCreateBuild,
        body: CreateBuildDesktopView(),
      );
    }
  }
}
