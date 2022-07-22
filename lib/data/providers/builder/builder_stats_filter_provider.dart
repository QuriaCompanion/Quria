import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/data/models/StatWeighing.enum.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

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

  setNewStatsFilters(List<FilterHelper> filters) {
    _filters.clear();
    _filters.addAll(filters);
    notifyListeners();
  }

  init(BuildContext context) {
    if (filters.isEmpty) {
      final filters = [
        FilterHelper(name: AppLocalizations.of(context)!.mobility, icon: "mobility.svg", value: StatsHash.mobility),
        FilterHelper(
            name: AppLocalizations.of(context)!.resilience, icon: "resilience.svg", value: StatsHash.resilience),
        FilterHelper(name: AppLocalizations.of(context)!.recovery, icon: "recovery.svg", value: StatsHash.recovery),
        FilterHelper(
            name: AppLocalizations.of(context)!.discipline, icon: "discipline.svg", value: StatsHash.discipline),
        FilterHelper(name: AppLocalizations.of(context)!.intellect, icon: "intellect.svg", value: StatsHash.intellect),
        FilterHelper(name: AppLocalizations.of(context)!.strength, icon: "strength.svg", value: StatsHash.strength),
      ];
      _filters.addAll(filters);
    }
  }

  reset() {
    _filters.clear();
    notifyListeners();
  }
}
