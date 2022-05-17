import 'package:flutter/foundation.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class BuilderStatsFilterProvider with ChangeNotifier {
  final List<FilterHelper> _filters = [
    FilterHelper(
      name: "MobiltÃ©",
      icon: "mobility.svg",
      value: StatsHash.mobility,
    ),
    FilterHelper(
      name: "RÃ©sistance",
      icon: "resilience.svg",
      value: StatsHash.resilience,
    ),
    FilterHelper(
      name: "RÃ©cuperation",
      icon: "recovery.svg",
      value: StatsHash.recovery,
    ),
    FilterHelper(
      name: "Discipline",
      icon: "discipline.svg",
      value: StatsHash.discipline,
    ),
    FilterHelper(
      name: "Intelligence",
      icon: "intellect.svg",
      value: StatsHash.intellect,
    ),
    FilterHelper(
      name: "Force",
      icon: "strength.svg",
      value: StatsHash.strength,
    ),
  ];

  List<FilterHelper> get filters => _filters;

  setStatsFilter(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final FilterHelper item = _filters.removeAt(oldIndex);
    _filters.insert(newIndex, item);
    notifyListeners();
  }
}
