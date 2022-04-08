import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/builderRecapHelper.model.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_base.dart';
import 'package:quria/presentation/screens/builder/build_recap/builder_recap_mobile_view.dart';

class BuilderRecapPage extends StatefulWidget {
  final BuilderRecapHelper data;
  const BuilderRecapPage({required this.data, Key? key}) : super(key: key);

  @override
  State<BuilderRecapPage> createState() => _BuilderRecapPageState();
}

class _BuilderRecapPageState extends State<BuilderRecapPage> {
  @override
  Widget build(BuildContext context) {
    if (vw(context) < 850) {
      return ScaffoldBase(body: BuilderRecapMobileView(data: widget.data));
    } else {
      return Container();
    }
  }
}
