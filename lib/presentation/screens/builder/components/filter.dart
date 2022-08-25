import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';

class FilterWidget extends ConsumerWidget {
  final Color color;
  const FilterWidget({Key? key, this.color = blackLight}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<FilterHelper> filters = ref.watch(builderQuriaProvider).filters;

    return ReorderableListView(
      padding: EdgeInsets.zero,
      onReorder: (int oldIndex, int newIndex) {
        ref.read(builderQuriaProvider.notifier).setStatsFilter(oldIndex, newIndex);
      },
      children: [
        for (int index = 0; index < filters.length; index++)
          Container(
            key: ValueKey(fromIntToName(context, filters[index].value)),
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
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
                      fromIntToName(context, filters[index].value),
                      utf8: false,
                    ),
                  ),
                  dense: true,
                  isThreeLine: false,
                  tileColor: color,
                  selectedTileColor: color,
                  selectedColor: color,
                  focusColor: color,
                  hoverColor: black,
                  textColor: black,
                  iconColor: black,
                )),
          ),
      ],
    );
  }
}
