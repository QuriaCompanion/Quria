import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger.dart';
import 'package:quria/presentation/screens/builds/create/create_build_mobile_view.dart';

class CreateBuildPage extends StatelessWidget {
  const CreateBuildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 1000) {
      return const ScaffoldBurger(
        body: CreateBuildMobileView(),
      );
    } else {
      return const SizedBox();
    }
  }
}
