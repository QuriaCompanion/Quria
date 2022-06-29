import 'package:bungie_api/enums/destiny_ammunition_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';

class CollectionFilter {
  static const Map<String, DestinyItemSubType> kinetic = {
    "Fusil automatique": DestinyItemSubType.AutoRifle,
    "Fusil éclaireur": DestinyItemSubType.ScoutRifle,
    "Fusil impulsion": DestinyItemSubType.PulseRifle,
    "Revolver": DestinyItemSubType.HandCannon,
    "Pistolet-mitrailleur": DestinyItemSubType.SubmachineGun,
    "Pistolet": DestinyItemSubType.Sidearm,
    "Arc": DestinyItemSubType.Bow,
    "Lance-grenade": DestinyItemSubType.GrenadeLauncher,
    "Fusil à pompe": DestinyItemSubType.Shotgun,
    "Fusil de précision": DestinyItemSubType.SniperRifle,
    "Fusil à fusion": DestinyItemSubType.FusionRifle,
  };
  static const Map<String, DestinyItemSubType> energy = {
    "Fusil automatique": DestinyItemSubType.AutoRifle,
    "Fusil éclaireur": DestinyItemSubType.ScoutRifle,
    "Fusil impulsion": DestinyItemSubType.PulseRifle,
    "Revolver": DestinyItemSubType.HandCannon,
    "Pistolet-mitrailleur": DestinyItemSubType.SubmachineGun,
    "Pistolet": DestinyItemSubType.Sidearm,
    "Arc": DestinyItemSubType.Bow,
    "Lance-grenade": DestinyItemSubType.GrenadeLauncher,
    "Fusil à pompe": DestinyItemSubType.Shotgun,
    "Fusil de précision": DestinyItemSubType.SniperRifle,
    "Fusil à fusion": DestinyItemSubType.FusionRifle,
    "Fusil à rayon": DestinyItemSubType.TraceRifle,
    "Glaive": DestinyItemSubType.Glaive,
  };
  static const Map<String, DestinyItemSubType> power = {
    "Mitrailleuse": DestinyItemSubType.Machinegun,
    "Lance roquettes": DestinyItemSubType.RocketLauncher,
    "lance grenade": DestinyItemSubType.GrenadeLauncher,
    "Epée": DestinyItemSubType.Sword,
    "Fusion linéaire": DestinyItemSubType.FusionRifleLine,
  };
  static const Map<DestinyAmmunitionType, Map<String, DestinyItemSubType>> typeFilters = {
    DestinyAmmunitionType.Primary: kinetic,
    DestinyAmmunitionType.Special: energy,
    DestinyAmmunitionType.Heavy: power,
  };
  static const Map<DestinyAmmunitionType, String> ammoTypeLogo = {
    DestinyAmmunitionType.Primary:
        "https://www.bungie.net/common/destiny2_content/icons/dc4bb9bcdd4ae8a83fb9007a51d7d711.png",
    DestinyAmmunitionType.Special:
        "https://www.bungie.net/common/destiny2_content/icons/b6d3805ca8400272b7ee7935b0b75c79.png",
    DestinyAmmunitionType.Heavy:
        "https://www.bungie.net/common/destiny2_content/icons/9fa60d5a99c9ff9cea0fb6dd690f26ec.png",
  };
  static const Map<int, String> bucketLogo = {
    InventoryBucket.kineticWeapons:
        "https://www.bungie.net/common/destiny2_content/icons/dc4bb9bcdd4ae8a83fb9007a51d7d711.png",
    InventoryBucket.energyWeapons:
        "https://www.bungie.net/common/destiny2_content/icons/b6d3805ca8400272b7ee7935b0b75c79.png",
    InventoryBucket.powerWeapons:
        "https://www.bungie.net/common/destiny2_content/icons/9fa60d5a99c9ff9cea0fb6dd690f26ec.png",
  };
}
