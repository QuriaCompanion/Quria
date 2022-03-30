import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/models/helpers/subclassHelper.moderl.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/subclass/subclass_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class SubclassPage extends StatefulWidget {
  final SubclassHelper data;
  const SubclassPage({required this.data, Key? key}) : super(key: key);

  @override
  State<SubclassPage> createState() => _SubclassPageState();
}

class _SubclassPageState extends State<SubclassPage> {
  @override
  Widget build(BuildContext context) {
    if (vw(context) < 850) {
      return ScaffoldSteps<List<FilterHelper>>(
        route: routeSubclass,
        arguments: [],
        body: SubclassMobileView(),
      );
    } else {
      return Container();
    }
  }
}
