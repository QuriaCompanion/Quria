import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/tier_type.dart';

const Map<DestinyItemSubType, String> filtersItemTypeLogo = {
  DestinyItemSubType.AutoRifle: 'assets/icons/weapons/6.af807f3.svg',
  DestinyItemSubType.Shotgun: 'assets/icons/weapons/7.fcc36d5.svg',
  DestinyItemSubType.Machinegun: 'assets/icons/weapons/8.fdcd699.svg',
  DestinyItemSubType.HandCannon: 'assets/icons/weapons/9.1570527.svg',
  DestinyItemSubType.RocketLauncher: 'assets/icons/weapons/10.3f0ae66.svg',
  DestinyItemSubType.FusionRifle: 'assets/icons/weapons/11.26b2362.svg',
  DestinyItemSubType.SniperRifle: 'assets/icons/weapons/12.d331391.svg',
  DestinyItemSubType.PulseRifle: 'assets/icons/weapons/13.fb1bd18.svg',
  DestinyItemSubType.ScoutRifle: 'assets/icons/weapons/14.21493cf.svg',
  DestinyItemSubType.Sidearm: 'assets/icons/weapons/17.ee4303c.svg',
  DestinyItemSubType.Sword: 'assets/icons/weapons/18.sqhdkqs.svg',
  DestinyItemSubType.FusionRifleLine: 'assets/icons/weapons/22.4e16c36.svg',
  DestinyItemSubType.GrenadeLauncher: 'assets/icons/weapons/23.f8ad4de.svg',
  DestinyItemSubType.SubmachineGun: 'assets/icons/weapons/24.2a355e7.svg',
  DestinyItemSubType.TraceRifle: 'assets/icons/weapons/25.qsdsd.svg',
  DestinyItemSubType.Bow: 'assets/icons/weapons/31.ecbab7e.svg',
  DestinyItemSubType.Glaive: 'assets/icons/weapons/33.b246aa9.svg',
};

const Map<DamageType, String> filtersDamageTypeLogo = {
  DamageType.Kinetic: 'assets/icons/damage/kinetic.svg',
  DamageType.Arc: 'assets/icons/damage/arc.svg',
  DamageType.Void: 'assets/icons/damage/void.svg',
  DamageType.Stasis: 'assets/icons/damage/stasis.svg',
  DamageType.Thermal: 'assets/icons/damage/solar.svg',
};

const Map<TierType, String> filtersTierTypeLogo = {
  TierType.Basic: 'assets/icons/weapons/common.svg',
  TierType.Common: 'assets/icons/weapons/uncommon.svg',
  TierType.Rare: 'assets/icons/weapons/rare.svg',
  TierType.Superior: 'assets/icons/weapons/legendary.svg',
  TierType.Exotic: 'assets/icons/weapons/exotic.svg',
};
