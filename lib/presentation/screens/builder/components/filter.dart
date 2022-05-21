import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';

class FilterWidget extends StatefulWidget {
  final double width;
  final List<FilterHelper> items;
  final Function(List<FilterHelper>) onFilterChanged;
  const FilterWidget({
    required this.width,
    required this.onFilterChanged,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  FilterWidgetState createState() => FilterWidgetState();
}

class FilterWidgetState extends State<FilterWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: EdgeInsets.zero,
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex--;
          }
          final FilterHelper item = widget.items.removeAt(oldIndex);
          widget.items.insert(newIndex, item);
          widget.onFilterChanged(widget.items);
        });
      },
      children: [
        for (int index = 0; index < widget.items.length; index++)
          Container(
            key: ValueKey(widget.items[index].name),
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                color: blackLight, borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.only(bottom: 8),
            clipBehavior: Clip.hardEdge,
            height: 48,
            child: ReorderableDragStartListener(
                index: index,
                child: ListTile(
                  horizontalTitleGap: 0,
                  minVerticalPadding: 0,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  leading: SvgPicture.asset(
                    "assets/icons/${widget.items[index].icon}",
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
                      widget.items[index].name,
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
