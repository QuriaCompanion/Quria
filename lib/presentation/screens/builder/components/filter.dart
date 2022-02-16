import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/cubit/filter_cubit.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> _items = [
    'Mobilité',
    'Résistance',
    'Récupération',
    'Discipline',
    'Intelligence',
    'Force'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      child: ReorderableListView(
        padding: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width / 100) * 6,
            right: (MediaQuery.of(context).size.width / 100) * 6),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
            context.read<FilterCubit>().addFilterData(_items);
          });
        },
        children: <Widget>[
          for (int index = 0; index < _items.length; index += 1)
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(5)),
              key: ValueKey(_items[index]),
              child: ReorderableDragStartListener(
                index: index,
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                          child: Text(
                        _items[index],
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                      )),
                      dense: true,
                      isThreeLine: false,
                      tileColor: Colors.black.withOpacity(0.0),
                      selectedTileColor: Colors.black.withOpacity(0.0),
                      selectedColor: Colors.black.withOpacity(0.0),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
