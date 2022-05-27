import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/models/helpers/statsFilterHelper.model.dart';
import 'package:quria/data/models/helpers/subclassHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
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
  List<FilterHelper> filters = [];
  @override
  Widget build(BuildContext context) {
    if (filters.isEmpty) {
      filters = [
        FilterHelper(
            name: AppLocalizations.of(context)!.mobility,
            icon: "mobility.svg",
            value: StatsHash.mobility),
        FilterHelper(
            name: AppLocalizations.of(context)!.resilience,
            icon: "resilience.svg",
            value: StatsHash.resilience),
        FilterHelper(
            name: AppLocalizations.of(context)!.recovery,
            icon: "recovery.svg",
            value: StatsHash.recovery),
        FilterHelper(
            name: AppLocalizations.of(context)!.discipline,
            icon: "discipline.svg",
            value: StatsHash.discipline),
        FilterHelper(
            name: AppLocalizations.of(context)!.intellect,
            icon: "intellect.svg",
            value: StatsHash.intellect),
        FilterHelper(
            name: AppLocalizations.of(context)!.strength,
            icon: "strength.svg",
            value: StatsHash.strength),
      ];
    }
    if (vw(context) < 1000) {
      return ScaffoldSteps<SubclassHelper>(
        route: routeSubclass,
        arguments: SubclassHelper(
            exoticHash: widget.data.exoticHash,
            characterId: widget.data.characterId,
            statOrder: filters.map((e) => e.value).toList()),
        body: StatsFilterMobileView(
          filters: filters,
          onFilterChanged: (list) {
            setState(() {
              filters = list;
            });
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
