import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/builder/build_recap/builder_recap_mobile_view.dart';

class BuilderRecapPage extends StatefulWidget {
  final Build data;
  const BuilderRecapPage({required this.data, Key? key}) : super(key: key);

  @override
  State<BuilderRecapPage> createState() => _BuilderRecapPageState();
}

class _BuilderRecapPageState extends State<BuilderRecapPage> {
  @override
  Widget build(BuildContext context) {
    if (vw(context) < 1000) {
      return ScaffoldBurgerAndBackOption(
          width: vw(context), body: BuilderRecapMobileView(width: vw(context), data: widget.data));
    } else {
      return Container();
    }
  }
}
