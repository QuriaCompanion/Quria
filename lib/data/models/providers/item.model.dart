import 'package:bungie_api/models/destiny_item_instance_component.dart';
import 'package:bungie_api/models/destiny_item_perks_component.dart';
import 'package:bungie_api/models/destiny_item_plug_component.dart';
import 'package:bungie_api/models/destiny_item_reusable_plugs_component.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';
import 'package:bungie_api/models/destiny_item_stats_component.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';

class ItemModel {
  final Map<String, DestinyItemInstanceComponent> instances = {};
  final Map<String, DestinyItemStatsComponent> stats = {};
  final Map<String, DestinyItemSocketsComponent> sockets = {};
  final Map<String, DestinyItemReusablePlugsComponent> reusablePlugs = {};
  final Map<String, DestinyItemTalentGridComponent> talentGrids = {};
  final Map<String, DestinyItemPlugComponent> plugStates = {};
  final Map<String, DestinyItemPerksComponent> perks = {};
  ItemModel();
}
