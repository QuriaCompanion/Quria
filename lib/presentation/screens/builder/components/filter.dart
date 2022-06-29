import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/providers/builder/builder_stats_filter_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FilterHelper> filters = Provider.of<BuilderStatsFilterProvider>(context).filters;
    if (filters.isEmpty) {
      filters = [
        FilterHelper(name: AppLocalizations.of(context)!.mobility, icon: "mobility.svg", value: StatsHash.mobility),
        FilterHelper(
            name: AppLocalizations.of(context)!.resilience, icon: "resilience.svg", value: StatsHash.resilience),
        FilterHelper(name: AppLocalizations.of(context)!.recovery, icon: "recovery.svg", value: StatsHash.recovery),
        FilterHelper(
            name: AppLocalizations.of(context)!.discipline, icon: "discipline.svg", value: StatsHash.discipline),
        FilterHelper(name: AppLocalizations.of(context)!.intellect, icon: "intellect.svg", value: StatsHash.intellect),
        FilterHelper(name: AppLocalizations.of(context)!.strength, icon: "strength.svg", value: StatsHash.strength),
      ];
      Provider.of<BuilderStatsFilterProvider>(context, listen: false).init(filters);
    }

    return ReorderableListView(
      padding: EdgeInsets.zero,
      onReorder: (int oldIndex, int newIndex) {
        Provider.of<BuilderStatsFilterProvider>(context, listen: false).setStatsFilter(oldIndex, newIndex);
      },
      children: [
        for (int index = 0; index < filters.length; index++)
          Container(
            key: ValueKey(filters[index].name),
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(color: blackLight, borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.only(bottom: 8),
            clipBehavior: Clip.hardEdge,
            height: 48,
            child: ReorderableDragStartListener(
                index: index,
                child: ListTile(
                  horizontalTitleGap: 0,
                  minVerticalPadding: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  leading: SvgPicture.asset(
                    "assets/icons/${filters[index].icon}",
                    height: 35,
                    color: Colors.white,
                  ),
                  trailing: const Icon(
                    Icons.drag_handle,
                    color: Colors.white,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 0, bottom: 0),
                    child: textBodyBold(
                      filters[index].name,
                      utf8: false,
                    ),
                  ),
                  dense: true,
                  isThreeLine: false,
                  tileColor: blackLight,
                  selectedTileColor: blackLight,
                  selectedColor: blackLight,
                  focusColor: blackLight,
                  hoverColor: black,
                  textColor: black,
                  iconColor: black,
                )),
          ),
      ],
    );
  }
}
