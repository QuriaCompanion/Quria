// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bungie_api/models/destiny_item_component.dart';

import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/StatWeighing.enum.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class BuilderQuriaModel {
  final List<FilterHelper> filters;
  final StatWeighing statWeighing;
  final bool considerMasterwork;
  final bool includeSunset;
  final DestinyInventoryItemDefinition? exotic;
  final DestinyItemComponent? classItem;
  final List<ModSlots> mods;
  final List<DestinyInventoryItemDefinition> subclassMods;
  final String? subclassId;
  final DestinyInventoryItemDefinition? subclass;

  BuilderQuriaModel({
    this.exotic,
    this.classItem,
    this.subclassId,
    this.subclass,
    this.subclassMods = const [],
    this.mods = const [],
    this.statWeighing = StatWeighing.allTiers,
    this.filters = const [
      FilterHelper(icon: "mobility.svg", value: StatsHash.mobility),
      FilterHelper(icon: "resilience.svg", value: StatsHash.resilience),
      FilterHelper(icon: "recovery.svg", value: StatsHash.recovery),
      FilterHelper(icon: "discipline.svg", value: StatsHash.discipline),
      FilterHelper(icon: "intellect.svg", value: StatsHash.intellect),
      FilterHelper(icon: "strength.svg", value: StatsHash.strength),
    ],
    this.considerMasterwork = true,
    this.includeSunset = true,
  });

  BuilderQuriaModel copyWith({
    List<FilterHelper>? filters,
    StatWeighing? statWeighing,
    bool? considerMasterwork,
    bool? includeSunset,
    DestinyInventoryItemDefinition? exotic,
    DestinyItemComponent? classItem,
    List<ModSlots>? mods,
    List<DestinyInventoryItemDefinition>? subclassMods,
    String? subclassId,
    DestinyInventoryItemDefinition? subclass,
  }) {
    return BuilderQuriaModel(
      filters: filters ?? this.filters,
      statWeighing: statWeighing ?? this.statWeighing,
      considerMasterwork: considerMasterwork ?? this.considerMasterwork,
      includeSunset: includeSunset ?? this.includeSunset,
      exotic: exotic ?? this.exotic,
      classItem: classItem ?? this.classItem,
      mods: mods ?? this.mods,
      subclassMods: subclassMods ?? this.subclassMods,
      subclassId: subclassId ?? this.subclassId,
      subclass: subclass ?? this.subclass,
    );
  }
}
