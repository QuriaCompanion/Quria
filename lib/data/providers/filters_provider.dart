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
    DamageType.Arc: false,
    DamageType.Thermal: false,
    DamageType.Void: false,
    DamageType.Stasis: false,
    DamageType.Kinetic: false,
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
  Map<TierType, bool> get rarity => _rarity;
  Map<DamageType, bool> get element => _element;
  Map<DestinyItemSubType, bool> get type => _type;
  Map<int, bool> get archetype => _archetype;
  Map<int, bool> get perks => _perks;

  changeFilter<T>(T item, bool value) {
    switch (T) {
      case TierType:
        _rarity[item as TierType] = value;
        break;
      case DamageType:
        _element[item as DamageType] = value;
        break;
      case DestinyItemSubType:
        _type[item as DestinyItemSubType] = value;
        break;
      default:
        break;
    }
    notifyListeners();
  }
}
