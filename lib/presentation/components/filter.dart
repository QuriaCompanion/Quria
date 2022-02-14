import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final List<String> _items = [
      'Mobilité',
      'Résistance',
      'Récupération',
      'Discipline',
      'Intelligence',
      'Force'
    ];

    return Container(
      width: MediaQuery.of(context).size.height * 0.6,
      height: MediaQuery.of(context).size.height * 0.8,
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
          });
        },
        children: <Widget>[
          for (int index = 0; index < _items.length; index += 1)
            ReorderableDragStartListener(
              index: index,
              key: Key(_items[index]),
              child: ListTile(
                title: Center(
                    child: Text(
                  _items[index],
                  style: const TextStyle(fontSize: 25),
                )),
                tileColor: Colors.red,
                dense: true,
                isThreeLine: false,
              ),
            ),
        ],
      ),
    );
  }
}
