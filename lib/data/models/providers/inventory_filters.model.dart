// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/foundation.dart';

@immutable
class InventoryFiltersModel {
  final DestinyItemType itemType;
  final Map<TierType, bool> rarity;
  final Map<DamageType, bool> element;
  final Map<DestinyItemSubType, bool> type;
  final Map<int, bool> archetype;
  final Map<int, bool> perks;
  final List<TierType> rarityFilters;
  final List<DamageType> elementFilters;
  final List<DestinyItemSubType> typeFilters;

  const InventoryFiltersModel({
    this.itemType = DestinyItemType.Weapon,
    this.rarity = const {},
    this.element = const {},
    this.type = const {},
    this.archetype = const {},
    this.perks = const {},
    this.rarityFilters = const [],
    this.elementFilters = const [],
    this.typeFilters = const [],
  });

  InventoryFiltersModel copyWith({
    DestinyItemType? itemType,
    Map<TierType, bool>? rarity,
    Map<DamageType, bool>? element,
    Map<DestinyItemSubType, bool>? type,
    Map<int, bool>? archetype,
    Map<int, bool>? perks,
    List<TierType>? rarityFilters,
    List<DamageType>? elementFilters,
    List<DestinyItemSubType>? typeFilters,
  }) {
    return InventoryFiltersModel(
      itemType: itemType ?? this.itemType,
      rarity: rarity ?? this.rarity,
      element: element ?? this.element,
      type: type ?? this.type,
      archetype: archetype ?? this.archetype,
      perks: perks ?? this.perks,
      rarityFilters: rarityFilters ?? this.rarityFilters,
      elementFilters: elementFilters ?? this.elementFilters,
      typeFilters: typeFilters ?? this.typeFilters,
    );
  }
}
