import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/enums/destiny_ammunition_type.dart';
import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_energy_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_presentation_node_definition.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class StatsHash {
  static const int mobility = 2996146975;
  static const int resilience = 392767087;
  static const int recovery = 1943323491;
  static const int intellect = 144602215;
  static const int discipline = 1735777505;
  static const int strength = 4244567218;
  static const int impact = 4043523819;
  static const int range = 1240592695;
  static const int stability = 155624089;
  static const int handling = 943549884;
  static const int reloadSpeed = 4188031367;
  static const int aimAssist = 1345609583;
  static const int blastRadius = 3614673599;
  static const int velocity = 2523465841;
  static const int chargeTime = 2961396640;
  static const int zoom = 3555269338;
  static const int magazine = 3871231066;
  static const int recoil = 2715839340;
  static const int rpm = 4284893193;
  static const int swingSpeed = 2837207746;
  static const int guardResist = 209426660;
  static const int guardEffiency = 2762071195;
  static const int guardEndurance = 3736848092;
  static const int chargeRate = 3022301683;
  static const int ammunition = 925767036;
  static const int shootingSpeed = 447667954;
  static const int precision = 1591432999;
  static const int power = 1935470627;
  static const int shieldDuration = 1842278586;
  static const int airborneEffectiveness = 2714457168;
}

class StatsStringHash {
  static const String mobility = "2996146975";
  static const String resilience = "392767087";
  static const String recovery = "1943323491";
  static const String intellect = "144602215";
  static const String discipline = "1735777505";
  static const String strength = "4244567218";
  static const String impact = "4043523819";
  static const String range = "1240592695";
  static const String stability = "155624089";
  static const String handling = "943549884";
  static const String reloadSpeed = "4188031367";
  static const String aimAssist = "1345609583";
  static const String blastRadius = "3614673599";
  static const String velocity = "2523465841";
  static const String chargeTime = "2961396640";
  static const String zoom = "3555269338";
  static const String magazine = "3871231066";
  static const String recoil = "2715839340";
  static const String rpm = "4284893193";
  static const String swingSpeed = "2837207746";
  static const String guardResist = "209426660";
  static const String guardEffiency = "2762071195";
  static const String guardEndurance = "3736848092";
  static const String chargeRate = "3022301683";
  static const String ammunition = "925767036";
  static const String shootingSpeed = "447667954";
  static const String precision = "1591432999";
  static const String power = "1935470627";
  static const String shieldDuration = "1842278586";
  static const String airborneEffectiveness = "2714457168";
}

enum ArmorStatInt {
  mobility,
  resilience,
  recovery,
  intellect,
  discipline,
  strength,
}

const List<int> sunsetItems = [2471437758, 1862490583, 1862490584, 1862490585];

enum ClassLogo { titan, hunter, warlock }

extension ClassLogoLink on ClassLogo {
  String get link {
    switch (this) {
      case ClassLogo.titan:
        return "https://www.bungie.net/common/destiny2_content/icons/8956751663b4394cd41076f93d2dd0d6.png";
      case ClassLogo.hunter:
        return "https://www.bungie.net/common/destiny2_content/icons/e7324e8c29c5314b8bce166ff167859d.png";
      case ClassLogo.warlock:
        return "https://www.bungie.net/common/destiny2_content/icons/bf7b2848d2f5fbebbf350d418b8ec148.png";
    }
  }
}

extension ArmorStatIntExtension on ArmorStatInt {
  int get value {
    switch (this) {
      case ArmorStatInt.mobility:
        return 0;
      case ArmorStatInt.resilience:
        return 1;
      case ArmorStatInt.recovery:
        return 2;
      case ArmorStatInt.intellect:
        return 3;
      case ArmorStatInt.discipline:
        return 4;
      case ArmorStatInt.strength:
        return 5;
      default:
        return 0;
    }
  }
}

class Conditions {
  static bool armorSockets(DestinyItemSocketState item) {
    return (item.isVisible!) &&
        ManifestService.manifestParsed.destinyInventoryItemDefinition[item.plugHash]?.plug?.plugCategoryHash !=
            2973005342 &&
        !ManifestService.manifestParsed.destinyInventoryItemDefinition[item.plugHash]!.plug!.plugCategoryIdentifier!
            .contains('masterworks.stat') &&
        ManifestService.manifestParsed.destinyInventoryItemDefinition[item.plugHash]?.itemType !=
            DestinyItemType.Armor &&
        ManifestService.manifestParsed.destinyInventoryItemDefinition[item.plugHash]?.itemSubType !=
            DestinyItemSubType.Ornament &&
        ManifestService.manifestParsed.destinyInventoryItemDefinition[item.plugHash]?.inventory?.tierType !=
            TierType.Exotic;
  }

  static bool cosmeticSockets(int? plugHash) {
    return ManifestService.manifestParsed.destinyInventoryItemDefinition[plugHash]?.itemType == DestinyItemType.Armor ||
        ManifestService.manifestParsed.destinyInventoryItemDefinition[plugHash]?.itemSubType ==
            DestinyItemSubType.Ornament ||
        ManifestService.manifestParsed.destinyInventoryItemDefinition[plugHash]?.itemSubType ==
            DestinyItemSubType.Shader;
  }

  static bool isBuildValid(List<Item> items) {
    final exoticArmor = [];
    for (Item item in items) {
      ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.inventory?.tierType ==
                  TierType.Exotic &&
              InventoryBucket.armorBucketHashes.contains(ManifestService
                  .manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.inventory?.bucketTypeHash)
          ? exoticArmor.add(item)
          : null;
    }
    final exoticWeapon = [];
    for (Item item in items) {
      ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.inventory?.tierType ==
                  TierType.Exotic &&
              InventoryBucket.weaponBucketHashes.contains(ManifestService
                  .manifestParsed.destinyInventoryItemDefinition[item.itemHash]?.inventory?.bucketTypeHash)
          ? exoticWeapon.add(item)
          : null;
    }
    return exoticArmor.length > 1 || exoticWeapon.length > 1;
  }

  static bool perkSockets(int? item) {
    // return true;
    final socketDef = ManifestService.manifestParsed.destinyInventoryItemDefinition[item];
    final socketCategory = socketDef?.itemCategoryHashes;
    if (socketDef?.plug?.plugCategoryIdentifier == "intrinsics" ||
        (socketDef?.plug?.plugCategoryIdentifier != null &&
            socketDef!.plug!.plugCategoryIdentifier!.contains('crafting')) ||
        socketDef == null) return false;
    if (socketCategory?.isEmpty ?? true) return true;
    for (final socket in socketCategory!) {
      if (DestinyData.perkCategoryHash.contains(socket) ||
          socketCategory.length == 1 &&
              !cosmeticSockets(item) &&
              socketDef.displayProperties?.icon != null &&
              // socketDef?.inventory?.tierType == TierType.Superior &&
              socket != 2237038328 &&
              !socketDef.plug!.plugCategoryIdentifier!.contains('masterwork') &&
              socketDef.plug?.plugCategoryIdentifier != "mementos" &&
              socketDef.hash != 1922808508 &&
              socketDef.hash != 4029346515 &&
              socketDef.hash != 659359923) {
        return true;
      }
    }
    return false;
  }

  static bool isEquipped(int? index, int? hash, InspectWeaponStatus? status) {
    switch (index) {
      case 1:
        return status?.firstColumn?.itemHash == hash;
      case 2:
        return status?.secondColumn?.itemHash == hash;
      case 3:
        return status?.thirdColumn?.itemHash == hash;
      case 4:
        return status?.fourthColumn?.itemHash == hash;
      case 5:
        return status?.fifthColumn?.itemHash == hash;
      default:
        return false;
    }
  }
}

class DestinyData {
  static const Map<DamageType, int> damageTypeHashes = {
    DamageType.Kinetic: 3373582085,
    DamageType.Thermal: 1847026933,
    DamageType.Arc: 2303181850,
    DamageType.Void: 3454344768,
  };
  static const Map<DestinyClass, List<int>> subclass = {
    DestinyClass.Warlock: [3291545503, 2849050827, 3481861797, 1751782730],
    DestinyClass.Titan: [613647804, 2842471112, 3105935002, 2958378809],
    DestinyClass.Hunter: [873720784, 2453351420, 3635991036, 1334959255]
  };

  static const List<int> perkCategoryHash = [
    3708671066,
    3085181971,
    1709863189,
    1334054322,
    3072652064,
    4184407433,
    3055157023,
    2076918099,
    3836367751,
    2411768833,
    3866509906,
    444756050,
    3360831066,
    2840834688,
    2779167812
  ];

  static const List<int> modCategoryHash = [
    510594033,
    974142739,
    1744546145,
  ];

  static List<List<int>> mods = [
    [
      481675395,
      807186981,
      807186981,
      2493100093,
    ],
    [
      481675395,
      1844045567,
      1844045567,
      2493100093,
    ],
    [
      481675395,
      1659393211,
      1659393211,
      2493100093,
    ],
    [
      481675395,
      573150099,
      573150099,
      2493100093,
    ],
    [
      481675395,
      1137289077,
      1137289077,
      2493100093,
    ]
  ];
  static const String bungieLink = "https://www.bungie.net";
  static const String exoticArmorLogo = "/common/destiny2_content/icons/d89699e6307ac5d2a306cf054978e251.png";
  static const String modsLogo = "/common/destiny2_content/icons/53fa0b010b6b5e4b6bf9b8367d2980e0.png";
  static const String classItemLogo = "/common/destiny2_content/icons/3cfff0f2aa68784762f553eb7997e909.png";

  static const Map<TierType, int> tierTypeHashes = {
    TierType.Basic: 3340296461,
    TierType.Common: 2395677314,
    TierType.Rare: 2127292149,
    TierType.Superior: 4008398120,
    TierType.Exotic: 2759499571,
  };

  static const Map<DestinyClass, int> classTypeHashes = {
    DestinyClass.Titan: 3655393761,
    DestinyClass.Hunter: 671679327,
    DestinyClass.Warlock: 2271682572,
  };

  static const Map<DestinyAmmunitionType, int> ammoTypeHashes = {
    DestinyAmmunitionType.Primary: 1731162900,
    DestinyAmmunitionType.Special: 638914517,
    DestinyAmmunitionType.Heavy: 3686962409,
  };

  static const Map<DestinyItemType, int> itemTypeHashes = {
    DestinyItemType.Subclass: 0,
    DestinyItemType.Weapon: 1,
    DestinyItemType.Armor: 20,
    DestinyItemType.Quest: 53,
    DestinyItemType.QuestStep: 16,
    DestinyItemType.Bounty: 1784235469,
    DestinyItemType.Ghost: 39,
    DestinyItemType.Vehicle: 43,
    DestinyItemType.Ship: 42,
    DestinyItemType.Emblem: 19,
    DestinyItemType.Aura: 57,
    DestinyItemType.ClanBanner: 874645359,
    DestinyItemType.Emote: 44,
    DestinyItemType.Mod: 59,
    DestinyItemType.Engram: 34,
    DestinyItemType.Consumable: 35,
    DestinyItemType.Currency: 18,
    DestinyItemType.Dummy: 3109687656,
    DestinyItemType.Package: 268598612,
  };

  static const Map<DestinyItemSubType, int> itemSubtypeHashes = {
    DestinyItemSubType.AutoRifle: 5,
    DestinyItemSubType.Shotgun: 11,
    DestinyItemSubType.Machinegun: 12,
    DestinyItemSubType.HandCannon: 6,
    DestinyItemSubType.RocketLauncher: 13,
    DestinyItemSubType.FusionRifle: 9,
    DestinyItemSubType.SniperRifle: 10,
    DestinyItemSubType.PulseRifle: 7,
    DestinyItemSubType.ScoutRifle: 8,
    DestinyItemSubType.Sidearm: 14,
    DestinyItemSubType.Sword: 54,
    DestinyItemSubType.Mask: 55,
    DestinyItemSubType.Shader: 41,
    DestinyItemSubType.FusionRifleLine: 1504945536,
    DestinyItemSubType.GrenadeLauncher: 153950757,
    DestinyItemSubType.SubmachineGun: 3954685534,
    DestinyItemSubType.TraceRifle: 2489664120,
    DestinyItemSubType.HelmetArmor: 45,
    DestinyItemSubType.GauntletsArmor: 46,
    DestinyItemSubType.ChestArmor: 47,
    DestinyItemSubType.LegArmor: 48,
    DestinyItemSubType.ClassArmor: 49,
    DestinyItemSubType.Bow: 3317538576,
  };
  static const Map<DestinyItemSubType, List> linearStringStatBySubType = {
    //Auto rifle
    DestinyItemSubType.AutoRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    //shotgun
    DestinyItemSubType.Shotgun: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    // machinegun
    DestinyItemSubType.Machinegun: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    //hand cannon
    DestinyItemSubType.HandCannon: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    //rocket launcher
    DestinyItemSubType.RocketLauncher: [
      StatsStringHash.blastRadius,
      StatsStringHash.velocity,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    //fusion rifle
    DestinyItemSubType.FusionRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    //sniper rifle
    DestinyItemSubType.SniperRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    //pulse rifle
    DestinyItemSubType.PulseRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    //scout rifle
    DestinyItemSubType.ScoutRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    // sidearm
    DestinyItemSubType.Sidearm: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    // sword
    DestinyItemSubType.Sword: [
      StatsStringHash.swingSpeed,
      StatsStringHash.impact,
      StatsStringHash.guardEffiency,
      StatsStringHash.guardResist,
      StatsStringHash.chargeRate,
      StatsStringHash.guardEndurance,
    ],
    //mask
    DestinyItemSubType.Mask: [
      StatsStringHash.mobility,
      StatsStringHash.resilience,
      StatsStringHash.recovery,
      StatsStringHash.discipline,
      StatsStringHash.intellect,
      StatsStringHash.strength
    ],
    // linear fusion rifle
    DestinyItemSubType.FusionRifleLine: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    // grenade launcher
    DestinyItemSubType.GrenadeLauncher: [
      StatsStringHash.blastRadius,
      StatsStringHash.velocity,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    // submachine gun
    DestinyItemSubType.SubmachineGun: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    // trace rifle
    DestinyItemSubType.TraceRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    // helmet armor
    DestinyItemSubType.HelmetArmor: [
      StatsStringHash.mobility,
      StatsStringHash.resilience,
      StatsStringHash.recovery,
      StatsStringHash.discipline,
      StatsStringHash.intellect,
      StatsStringHash.strength
    ],
    // gauntlets armor
    DestinyItemSubType.GauntletsArmor: [
      StatsStringHash.mobility,
      StatsStringHash.resilience,
      StatsStringHash.recovery,
      StatsStringHash.discipline,
      StatsStringHash.intellect,
      StatsStringHash.strength
    ],
    // chest armor
    DestinyItemSubType.ChestArmor: [
      StatsStringHash.mobility,
      StatsStringHash.resilience,
      StatsStringHash.recovery,
      StatsStringHash.discipline,
      StatsStringHash.intellect,
      StatsStringHash.strength
    ],
    // leg armor
    DestinyItemSubType.LegArmor: [
      StatsStringHash.mobility,
      StatsStringHash.resilience,
      StatsStringHash.recovery,
      StatsStringHash.discipline,
      StatsStringHash.intellect,
      StatsStringHash.strength
    ],
    // class armor
    DestinyItemSubType.ClassArmor: [
      StatsStringHash.mobility,
      StatsStringHash.resilience,
      StatsStringHash.recovery,
      StatsStringHash.discipline,
      StatsStringHash.intellect,
      StatsStringHash.strength
    ],
    // bow
    DestinyItemSubType.Bow: [
      StatsStringHash.impact,
      StatsStringHash.precision,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
    // Glaive
    DestinyItemSubType.Glaive: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.shieldDuration,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist,
      StatsStringHash.airborneEffectiveness
    ],
  };

  static const Map<DestinyItemSubType, List> linearStatBySubType = {
    //Auto rifle
    DestinyItemSubType.AutoRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    //shotgun
    DestinyItemSubType.Shotgun: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    // machinegun
    DestinyItemSubType.Machinegun: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    //hand cannon
    DestinyItemSubType.HandCannon: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    //rocket launcher
    DestinyItemSubType.RocketLauncher: [
      StatsHash.blastRadius,
      StatsHash.velocity,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    //fusion rifle
    DestinyItemSubType.FusionRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    //sniper rifle
    DestinyItemSubType.SniperRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    //pulse rifle
    DestinyItemSubType.PulseRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    //scout rifle
    DestinyItemSubType.ScoutRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    // sidearm
    DestinyItemSubType.Sidearm: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    // sword
    DestinyItemSubType.Sword: [
      StatsHash.swingSpeed,
      StatsHash.impact,
      StatsHash.guardEffiency,
      StatsHash.guardResist,
      StatsHash.chargeRate,
      StatsHash.guardEndurance,
    ],
    //mask
    DestinyItemSubType.Mask: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength
    ],
    // linear fusion rifle
    DestinyItemSubType.FusionRifleLine: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    // grenade launcher
    DestinyItemSubType.GrenadeLauncher: [
      StatsHash.blastRadius,
      StatsHash.velocity,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    // submachine gun
    DestinyItemSubType.SubmachineGun: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    // trace rifle
    DestinyItemSubType.TraceRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    // helmet armor
    DestinyItemSubType.HelmetArmor: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength,
    ],
    // gauntlets armor
    DestinyItemSubType.GauntletsArmor: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength,
    ],
    // chest armor
    DestinyItemSubType.ChestArmor: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength,
    ],
    // leg armor
    DestinyItemSubType.LegArmor: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength,
    ],
    // class armor
    DestinyItemSubType.ClassArmor: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength,
    ],
    // bow
    DestinyItemSubType.Bow: [
      StatsHash.impact,
      StatsHash.precision,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
    // Glaive
    DestinyItemSubType.Glaive: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.shieldDuration,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist,
      StatsHash.airborneEffectiveness
    ],
  };

  static const Color positiveFeedback = Color.fromRGBO(67, 205, 57, 1);
  static const Color negativeFeedback = Color.fromRGBO(204, 58, 56, 1);
  static const Color masterworkColor = Color.fromRGBO(235, 196, 98, 1);

  static const Color trackingOnColor = Color(0xFF43A047);
  static const Color trackingOffColor = Color(0xFF2E7D32);

  static const Color perkColor = Color.fromRGBO(94, 153, 192, 1);

  static const Color objectiveProgress = Color.fromRGBO(90, 163, 102, 1);

  static const List<int> noBarStats = [
    4284893193, // Rounds Per Minute
    3871231066, // Magazine
    2961396640, // Charge Time
    1931675084, //Inventory Size
  ];

  static const List<String> armorStats = [
    "2996146975", // Mobility
    "392767087", // Resilience
    "1943323491", // recovery
    "1735777505", // discipline
    "144602215", // Intellect
    "4244567218", // Strength
  ];
  static const List<String> statsIcon = [
    "/common/destiny2_content/icons/e26e0e93a9daf4fdd21bf64eb9246340.png", // Mobility
    "/common/destiny2_content/icons/202ecc1c6febeb6b97dafc856e863140.png", // Resilience
    "/common/destiny2_content/icons/128eee4ee7fc127851ab32eac6ca91cf.png", // recovery
    "/common/destiny2_content/icons/ca62128071dc254fe75891211b98b237.png", // discipline
    "/common/destiny2_content/icons/59732534ce7060dba681d1ba84c055a6.png", // Intellect
    "/common/destiny2_content/icons/c7eefc8abbaa586eeab79e962a79d6ad.png", // Strength
  ];

  static const List<int> hiddenStats = [
    1345609583, // Aim Assistance
    2715839340, // Recoil Direction
    3555269338, // Zoom
  ];

  static const List<int> socketCategoryPerkHashes = [
    319279448, // sparrow perks
    1576735337, //clan banner perks
    1683579090, // clan perks
    2278110604, // vehicle perks
    2518356196, //armor perks
    3301318876, //ghost shell perks
    3898156960, // clan perks (again?)
    4241085061, //weapon perks
  ];

  static const socketCategoryIntrinsicPerkHashes = [
    3154740035, //armor perks
    3956125808, //weapon perks
  ];

  static const List<int> socketCategoryTierHashes = [
    760375309, // armor tier
  ];

  static const List<int> socketCategoryModHashes = [
    279738248, // emblem customization
    590099826, // armor mods
    1093090108, // emotes
    2622243744, // nightfall modifiers
    2685412949, //weapon mods
    3379164649, //ghost shell mods
    3954618873, // clan staves
    4243480345, //vehicle mods
    4265082475, //vehicle mods
  ];

  static const List<int> socketCategoryCosmeticModHashes = [
    1926152773, // armor cosmetics
    2048875504, // weapon mods
  ];
  static Map<DestinyAmmunitionType, DestinyPresentationNodeDefinition> ammoInfoByType = {
    DestinyAmmunitionType.Primary: ManifestService
        .manifestParsed.destinyPresentationNodeDefinition[ammoTypeHashes[DestinyAmmunitionType.Primary]]!,
    DestinyAmmunitionType.Special: ManifestService
        .manifestParsed.destinyPresentationNodeDefinition[ammoTypeHashes[DestinyAmmunitionType.Special]]!,
    DestinyAmmunitionType.Heavy:
        ManifestService.manifestParsed.destinyPresentationNodeDefinition[ammoTypeHashes[DestinyAmmunitionType.Heavy]]!,
  };

  static Color getAmmoTypeColor(DestinyAmmunitionType type) {
    switch (type) {
      case DestinyAmmunitionType.Special:
        return const Color.fromARGB(255, 116, 247, 146);
      case DestinyAmmunitionType.Heavy:
        return const Color.fromARGB(255, 179, 127, 251);

      default:
        return Colors.white;
    }
  }

  static Color getDamageTypeColor(DamageType damageType) {
    switch (damageType) {
      case DamageType.Arc:
        return const Color.fromARGB(255, 118, 186, 230);
      case DamageType.Thermal:
        return const Color.fromARGB(255, 243, 98, 39);
      case DamageType.Void:
        return const Color.fromARGB(255, 64, 34, 101);
      case DamageType.Stasis:
        return const Color.fromARGB(255, 77, 136, 255);

      default:
        return Colors.white;
    }
  }

  static Color getEnergyTypeColor(DestinyEnergyType energyType) {
    switch (energyType) {
      case DestinyEnergyType.Arc:
        return const Color.fromARGB(255, 118, 186, 230);
      case DestinyEnergyType.Thermal:
        return const Color.fromARGB(255, 243, 98, 39);
      case DestinyEnergyType.Void:
        return const Color.fromARGB(255, 64, 34, 101);

      default:
        return Colors.blueGrey.shade700;
    }
  }

  static Color getEnergyTypeLightColor(DestinyEnergyType damageType) {
    switch (damageType) {
      case DestinyEnergyType.Arc:
        return const Color.fromARGB(255, 130, 200, 253);
      case DestinyEnergyType.Thermal:
        return const Color.fromARGB(255, 255, 156, 74);
      case DestinyEnergyType.Void:
        return const Color.fromARGB(255, 177, 120, 248);

      default:
        return Colors.grey.shade300;
    }
  }

  static int? getEnergyTypeCostHash(DestinyEnergyType damageType) {
    switch (damageType) {
      case DestinyEnergyType.Arc:
        return 3779394102;
      case DestinyEnergyType.Thermal:
        return 3344745325;
      case DestinyEnergyType.Void:
        return 2399985800;

      default:
        return null;
    }
  }

  static Color getDamageTypeTextColor(DamageType damageType) {
    switch (damageType) {
      case DamageType.Arc:
        return const Color.fromARGB(255, 130, 200, 253);
      case DamageType.Thermal:
        return const Color.fromARGB(255, 255, 156, 74);
      case DamageType.Void:
        return const Color.fromARGB(255, 177, 120, 248);
      case DamageType.Stasis:
        return const Color.fromARGB(255, 77, 136, 255);
      default:
        return Colors.white;
    }
  }

  static Color getTierColor(TierType tierType) {
    switch (tierType) {
      case TierType.Basic:
        return const Color.fromARGB(255, 195, 188, 180);
      case TierType.Common:
        return const Color.fromARGB(255, 48, 107, 61);
      case TierType.Rare:
        return const Color.fromARGB(255, 80, 118, 163);
      case TierType.Superior:
        return const Color.fromARGB(255, 82, 47, 101);
      case TierType.Exotic:
        return const Color.fromARGB(255, 206, 174, 51);

      case TierType.Unknown:
      case TierType.Currency:
      case TierType.ProtectedInvalidEnumValue:
        return const Color.fromARGB(255, 195, 188, 180);
    }
  }

  static Color getTierTextColor(TierType tierType) {
    switch (tierType) {
      case TierType.Basic:
      case TierType.Unknown:
      case TierType.Currency:
      case TierType.ProtectedInvalidEnumValue:
        return Colors.grey.shade800;

      default:
        return Colors.white;
    }
  }

  static Map<int, int> superNodeToSandbox = {
    //burning maul
    1323416107: 2401205106,
    //hammer of sol
    1722642322: 3881209933,
    //fist of havoc
    1757742244: 113667234,
    //thundercrash
    2795355746: 3326771373,
    //daybreak
    4102085486: 1136882502,
    //Well of radiance
    935376049: 1267155257,
    //Stormtrance
    178252917: 3972661583,
    // chaos reach
    3882393894: 3368836162,
    //golden gun
    675014898: 3205500087,
    //blade barrage
    1590824323: 2041340886,
    //arc staff
    2936898795: 674606208
  };
}

class SubclassTalentGridInfo {
  DamageType damageType;
  int mainPerkHash;
  int grenadePerkHash;
  int jumpPerkHash;
  int classSkillPerkHash;

  SubclassTalentGridInfo(
      {required this.damageType,
      required this.mainPerkHash,
      required this.grenadePerkHash,
      required this.jumpPerkHash,
      required this.classSkillPerkHash});
}

enum CurrencyConversionType { inventoryItem, currency }

class CurrencyConversion {
  static const Map<int, CurrencyConversion> purchaseables = {
    924468777: CurrencyConversion(CurrencyConversionType.inventoryItem, 1305274547), //Phaseglass
    3721881826: CurrencyConversion(CurrencyConversionType.inventoryItem, 950899352), //Dusklight
    1420498062: CurrencyConversion(CurrencyConversionType.inventoryItem, 49145143), //Simulation Seeds
    1812969468: CurrencyConversion(CurrencyConversionType.inventoryItem, 3853748946), //Enhancement Cores
    4153440841: CurrencyConversion(CurrencyConversionType.inventoryItem, 2014411539), //Alkane Dust
    1845310989: CurrencyConversion(CurrencyConversionType.inventoryItem, 3487922223), //Datalattice
    2536947844: CurrencyConversion(CurrencyConversionType.inventoryItem, 31293053), //Seraphite
    3245502278: CurrencyConversion(CurrencyConversionType.inventoryItem, 1177810185), //Etheric Spiral
    778553120: CurrencyConversion(CurrencyConversionType.inventoryItem, 592227263), //Baryon Bough
    1923884703: CurrencyConversion(CurrencyConversionType.inventoryItem, 3592324052), //Helium Filaments
    4106973372: CurrencyConversion(CurrencyConversionType.inventoryItem, 293622383), //Spinmetal
    1760701414: CurrencyConversion(CurrencyConversionType.inventoryItem, 1485756901), //Glacial Starwort
    2654422615: CurrencyConversion(CurrencyConversionType.currency, 1022552290), //Legendary Shards
    3664001560: CurrencyConversion(CurrencyConversionType.currency, 3159615086), //Glimmer
  };

  final CurrencyConversionType type;
  final int hash;

  const CurrencyConversion(this.type, this.hash);
}
