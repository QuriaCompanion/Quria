// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';

class InventoryFiltersModel {
  final DestinyItemType itemType;
  final Map<TierType, bool> rarity = {
    TierType.Basic: false,
    TierType.Common: false,
    TierType.Rare: false,
    TierType.Superior: false,
    TierType.Exotic: false,
  };
  final Map<DamageType, bool> element = {
    DamageType.Kinetic: false,
    DamageType.Stasis: false,
    DamageType.Thermal: false,
    DamageType.Arc: false,
    DamageType.Void: false,
  };
  final Map<DestinyItemSubType, bool> type = {
    DestinyItemSubType.AutoRifle: false,
    DestinyItemSubType.Shotgun: false,
    DestinyItemSubType.Machinegun: false,
    DestinyItemSubType.HandCannon: false,
    DestinyItemSubType.RocketLauncher: false,
    DestinyItemSubType.FusionRifle: false,
    DestinyItemSubType.SniperRifle: false,
    DestinyItemSubType.PulseRifle: false,
    DestinyItemSubType.ScoutRifle: false,
    DestinyItemSubType.Sidearm: false,
    DestinyItemSubType.Sword: false,
    DestinyItemSubType.FusionRifleLine: false,
    DestinyItemSubType.GrenadeLauncher: false,
    DestinyItemSubType.SubmachineGun: false,
    DestinyItemSubType.TraceRifle: false,
    DestinyItemSubType.Bow: false,
    DestinyItemSubType.Glaive: false,
  };
  final Map<int, bool> archetype = {};
  final Map<int, bool> perks = {};
  final List<TierType> rarityFilters = [];
  final List<DamageType> elementFilters = [];
  final List<DestinyItemSubType> typeFilters = [];

  InventoryFiltersModel({
    this.itemType = DestinyItemType.Weapon,
  });

  InventoryFiltersModel copyWith({
    DestinyItemType? itemType,
  }) {
    return InventoryFiltersModel(
      itemType: itemType ?? this.itemType,
    );
  }
}
