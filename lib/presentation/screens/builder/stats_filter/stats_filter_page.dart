import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/statsFilterHelper.model.dart';
import 'package:quria/data/models/helpers/subclassHelper.model.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/var/routes.dart';

import 'stats_filter_mobile_view.dart';

class StatsFilterPage extends StatefulWidget {
  final StatsFilterHelper data;
  const StatsFilterPage({required this.data, Key? key}) : super(key: key);

  @override
  State<StatsFilterPage> createState() => _StatsFilterPageState();
}

class _StatsFilterPageState extends State<StatsFilterPage> {
  @override
  Widget build(BuildContext context) {
    if (vw(context) < 850) {
      return ScaffoldSteps<SubclassHelper>(
        route: routeSubclass,
        arguments: SubclassHelper(
          exoticHash: widget.data.exoticHash,
          characterId: widget.data.characterId,
          statOrder: [],
        ),
        body: const StatsFilterMobileView(),
      );
    } else {
      return Container();
    }
  }
}
