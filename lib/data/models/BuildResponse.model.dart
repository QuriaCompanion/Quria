import 'package:bungie_api/models/destiny_inventory_item_definition.dart';

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
  Map<int, int> ordering;
  Map<int, int> statistics;

  Stats(
      {required this.base,
      required this.max,
      required this.ordering,
      required this.statistics});
}

class Armor {
  int hash;
  String itemInstanceId;
  int type;

  DestinyInventoryItemDefinition? mods;
  Armor(
      {required this.hash,
      required this.itemInstanceId,
      required this.type,
      this.mods});
}
