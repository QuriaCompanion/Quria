import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';

class FiltersProvider with ChangeNotifier {
  final Map<TierType, bool> _rarity = {
    TierType.Basic: false,
    TierType.Common: false,
    TierType.Rare: false,
    TierType.Superior: false,
    TierType.Exotic: false,
  };
  final Map<DamageType, bool> _element = {
    DamageType.Kinetic: false,
    DamageType.Stasis: false,
    DamageType.Thermal: false,
    DamageType.Arc: false,
    DamageType.Void: false,
  };
  final Map<DestinyItemSubType, bool> _type = {
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
  final Map<int, bool> _archetype = {};
  final Map<int, bool> _perks = {};
  final List<TierType> _rarityFilters = [];
  final List<DamageType> _elementFilters = [];
  final List<DestinyItemSubType> _typeFilters = [];

  List<TierType> get rarityFilters => _rarityFilters;
  List<DamageType> get elementFilters => _elementFilters;
  List<DestinyItemSubType> get typeFilters => _typeFilters;
  Map<TierType, bool> get rarity => _rarity;
  Map<DamageType, bool> get element => _element;
  Map<DestinyItemSubType, bool> get type => _type;
  Map<int, bool> get archetype => _archetype;
  Map<int, bool> get perks => _perks;
  changeFilter<T>(T item, bool value) {
    switch (T) {
      case TierType:
        _rarity[item as TierType] = value;
        if (value) {
          _rarityFilters.add(item);
          _rarityFilters.toSet();
        } else {
          _rarityFilters.remove(item);
        }
        break;
      case DamageType:
        _element[item as DamageType] = value;
        if (value) {
          _elementFilters.add(item);
          _elementFilters.toSet();
        } else {
          _elementFilters.remove(item);
        }
        break;
      case DestinyItemSubType:
        _type[item as DestinyItemSubType] = value;
        if (value) {
          _typeFilters.add(item);
          _typeFilters.toSet();
        } else {
          _typeFilters.remove(item);
        }
        break;
      default:
        break;
    }
    notifyListeners();
  }
}
