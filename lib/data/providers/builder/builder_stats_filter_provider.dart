import 'package:flutter/foundation.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';

class BuilderStatsFilterProvider with ChangeNotifier {
  final List<FilterHelper> _filters = [];

  List<FilterHelper> get filters => _filters;

  setStatsFilter(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final FilterHelper item = _filters.removeAt(oldIndex);
    _filters.insert(newIndex, item);
    notifyListeners();
  }

  init(List<FilterHelper> filters) {
    _filters.addAll(filters);
  }
}
