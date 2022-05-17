import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/providers/builder/builder_stats_filter_provider.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FilterHelper> filters =
        Provider.of<BuilderStatsFilterProvider>(context).filters;

    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        Provider.of<BuilderStatsFilterProvider>(context, listen: false)
            .setStatsFilter(oldIndex, newIndex);
      },
      children: [
        for (int index = 0; index < filters.length; index++)
          Container(
            key: ValueKey(filters[index].name),
            height: 35 + globalPadding(context),
            padding: EdgeInsets.symmetric(vertical: globalPadding(context) / 2),
            decoration: BoxDecoration(
                color: blackLight, borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.only(bottom: 8),
            clipBehavior: Clip.hardEdge,
            child: ReorderableDragStartListener(
                index: index,
                child: ListTile(
                  horizontalTitleGap: 0,
                  minVerticalPadding: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                    padding: const EdgeInsets.only(left: 8),
                    child: textBodyBold(
                      filters[index].name,
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
