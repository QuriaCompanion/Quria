import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class BuildResponse {
  final List<Build> builds;
  BuildResponse({required this.builds});
}

class Build {
  Stats stats;
  List<Armor> equipement;
  Build({
    required this.stats,
    required this.equipement,
  });
}

class Stats {
  int base;
  int max;
  int statToFilterBy;
  Map<int, int> ordering;
  Map<int, int> statistics;

  Stats({
    required this.base,
    required this.max,
    required this.ordering,
    required this.statistics,
    required this.statToFilterBy,
  });
}

class Armor {
  int hash;
  String itemInstanceId;
  int displayHash;
  int type;

  DestinyInventoryItemDefinition? mod;
  Armor({
    required this.hash,
    required this.itemInstanceId,
    required this.displayHash,
    required this.type,
    this.mod,
  });
}
