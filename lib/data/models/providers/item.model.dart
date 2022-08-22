import 'package:bungie_api/models/destiny_item_instance_component.dart';
import 'package:bungie_api/models/destiny_item_perks_component.dart';
import 'package:bungie_api/models/destiny_item_plug_component.dart';
import 'package:bungie_api/models/destiny_item_reusable_plugs_component.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';
import 'package:bungie_api/models/destiny_item_stats_component.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:flutter/foundation.dart';

@immutable
class ItemModel {
  final Map<String, DestinyItemInstanceComponent> instances;
  final Map<String, DestinyItemStatsComponent> stats;
  final Map<String, DestinyItemSocketsComponent> sockets;
  final Map<String, DestinyItemReusablePlugsComponent> reusablePlugs;
  final Map<String, DestinyItemTalentGridComponent> talentGrids;
  final Map<String, DestinyItemPlugComponent> plugStates;
  final Map<String, DestinyItemPerksComponent> perks;
  const ItemModel({
    this.instances = const {},
    this.stats = const {},
    this.sockets = const {},
    this.reusablePlugs = const {},
    this.talentGrids = const {},
    this.plugStates = const {},
    this.perks = const {},
  });

  ItemModel copyWith({
    Map<String, DestinyItemInstanceComponent>? instances,
    Map<String, DestinyItemStatsComponent>? stats,
    Map<String, DestinyItemSocketsComponent>? sockets,
    Map<String, DestinyItemReusablePlugsComponent>? reusablePlugs,
    Map<String, DestinyItemTalentGridComponent>? talentGrids,
    Map<String, DestinyItemPlugComponent>? plugStates,
    Map<String, DestinyItemPerksComponent>? perks,
  }) {
    return ItemModel(
      instances: instances ?? this.instances,
      stats: stats ?? this.stats,
      sockets: sockets ?? this.sockets,
      reusablePlugs: reusablePlugs ?? this.reusablePlugs,
      talentGrids: talentGrids ?? this.talentGrids,
      plugStates: plugStates ?? this.plugStates,
      perks: perks ?? this.perks,
    );
  }
}
