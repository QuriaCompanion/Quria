import 'package:flutter/foundation.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';

import '../../models/StatWeighing.enum.dart';

class BuilderStatsFilterProvider with ChangeNotifier {
  final List<FilterHelper> _filters = [];
  StatWeighing _statWeighing = StatWeighing.allTiers;

  List<FilterHelper> get filters => _filters;
  StatWeighing get statWeighing => _statWeighing;

  setStatsFilter(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final FilterHelper item = _filters.removeAt(oldIndex);
    _filters.insert(newIndex, item);
    notifyListeners();
  }

  setStatWeighing(StatWeighing statWeighing) {
    _statWeighing = statWeighing;
    notifyListeners();
  }

  init(List<FilterHelper> filters) {
    _filters.addAll(filters);
  }
}
