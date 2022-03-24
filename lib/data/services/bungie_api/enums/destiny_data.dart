import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/enums/destiny_ammunition_type.dart';
import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_energy_type.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_presentation_node_definition.dart';
import 'package:flutter/material.dart';
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
}

enum armorStatInt {
  mobility,
  resilience,
  recovery,
  intellect,
  discipline,
  strength,
}
enum classLogo { titan, hunter, warlock }

extension ClassLogoLink on classLogo {
  String get link {
    switch (this) {
      case classLogo.titan:
        return "https://www.bungie.net/common/destiny2_content/icons/8956751663b4394cd41076f93d2dd0d6.png";
      case classLogo.hunter:
        return "https://www.bungie.net/common/destiny2_content/icons/e7324e8c29c5314b8bce166ff167859d.png";
      case classLogo.warlock:
        return "https://www.bungie.net/common/destiny2_content/icons/bf7b2848d2f5fbebbf350d418b8ec148.png";
      default:
        return "0";
    }
  }
}

extension ArmorStatIntExtension on armorStatInt {
  int get value {
    switch (this) {
      case armorStatInt.mobility:
        return 0;
      case armorStatInt.resilience:
        return 1;
      case armorStatInt.recovery:
        return 2;
      case armorStatInt.intellect:
        return 3;
      case armorStatInt.discipline:
        return 4;
      case armorStatInt.strength:
        return 5;
      default:
        return 0;
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

  static const List<int> perkCategoryHash = [
    2619833294,
    2833605196,
    1757026848,
    7906839,
    1806783418,
    164955586,
    1202604782,
    2718120384,
    577918720,
    3886533313,
    3962145884
  ];

  static const List<int> modCategoryHash = [
    510594033,
    974142739,
    1744546145,
  ];

  static const String bungieLink = "https://www.bungie.net";
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
      StatsStringHash.aimAssist
    ],
    //shotgun
    DestinyItemSubType.Shotgun: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
    ],
    // machinegun
    DestinyItemSubType.Machinegun: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
    ],
    //hand cannon
    DestinyItemSubType.HandCannon: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
    ],
    //rocket launcher
    DestinyItemSubType.RocketLauncher: [
      StatsStringHash.blastRadius,
      StatsStringHash.velocity,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
    ],
    //fusion rifle
    DestinyItemSubType.FusionRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
    ],
    //sniper rifle
    DestinyItemSubType.SniperRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
    ],
    //pulse rifle
    DestinyItemSubType.PulseRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
    ],
    //scout rifle
    DestinyItemSubType.ScoutRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
    ],
    // sidearm
    DestinyItemSubType.Sidearm: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
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
      StatsStringHash.aimAssist
    ],
    // grenade launcher
    DestinyItemSubType.GrenadeLauncher: [
      StatsStringHash.blastRadius,
      StatsStringHash.velocity,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
    ],
    // submachine gun
    DestinyItemSubType.SubmachineGun: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
    ],
    // trace rifle
    DestinyItemSubType.TraceRifle: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.stability,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
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
      StatsStringHash.aimAssist
    ],
    // Glaive
    DestinyItemSubType.Glaive: [
      StatsStringHash.impact,
      StatsStringHash.range,
      StatsStringHash.shieldDuration,
      StatsStringHash.handling,
      StatsStringHash.reloadSpeed,
      StatsStringHash.aimAssist
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
      StatsHash.aimAssist
    ],
    //shotgun
    DestinyItemSubType.Shotgun: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    // machinegun
    DestinyItemSubType.Machinegun: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    //hand cannon
    DestinyItemSubType.HandCannon: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    //rocket launcher
    DestinyItemSubType.RocketLauncher: [
      StatsHash.blastRadius,
      StatsHash.velocity,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    //fusion rifle
    DestinyItemSubType.FusionRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    //sniper rifle
    DestinyItemSubType.SniperRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    //pulse rifle
    DestinyItemSubType.PulseRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    //scout rifle
    DestinyItemSubType.ScoutRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    // sidearm
    DestinyItemSubType.Sidearm: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
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
      StatsHash.aimAssist
    ],
    // grenade launcher
    DestinyItemSubType.GrenadeLauncher: [
      StatsHash.blastRadius,
      StatsHash.velocity,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    // submachine gun
    DestinyItemSubType.SubmachineGun: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    // trace rifle
    DestinyItemSubType.TraceRifle: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    // helmet armor
    DestinyItemSubType.HelmetArmor: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength
    ],
    // gauntlets armor
    DestinyItemSubType.GauntletsArmor: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength
    ],
    // chest armor
    DestinyItemSubType.ChestArmor: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength
    ],
    // leg armor
    DestinyItemSubType.LegArmor: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength
    ],
    // class armor
    DestinyItemSubType.ClassArmor: [
      StatsHash.mobility,
      StatsHash.resilience,
      StatsHash.recovery,
      StatsHash.discipline,
      StatsHash.intellect,
      StatsHash.strength
    ],
    // bow
    DestinyItemSubType.Bow: [
      StatsHash.impact,
      StatsHash.precision,
      StatsHash.stability,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
    ],
    // Glaive
    DestinyItemSubType.Glaive: [
      StatsHash.impact,
      StatsHash.range,
      StatsHash.shieldDuration,
      StatsHash.handling,
      StatsHash.reloadSpeed,
      StatsHash.aimAssist
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
  static Map<DestinyAmmunitionType, DestinyPresentationNodeDefinition>
      ammoInfoByType = {
    DestinyAmmunitionType.Primary:
        ManifestService.manifestParsed.destinyPresentationNodeDefinition![
            ammoTypeHashes[DestinyAmmunitionType.Primary]]!,
    DestinyAmmunitionType.Special:
        ManifestService.manifestParsed.destinyPresentationNodeDefinition![
            ammoTypeHashes[DestinyAmmunitionType.Special]]!,
    DestinyAmmunitionType.Heavy:
        ManifestService.manifestParsed.destinyPresentationNodeDefinition![
            ammoTypeHashes[DestinyAmmunitionType.Heavy]]!,
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

// const Map<String, List<DestinySandboxPerkDefinition>> subclassMainPerks = {
//   //titan solar
//   "titan_solar_firstpath": [
//     ManifestService.manifestParsed.DestinyNodeStepSummaryDefinition[]
//   ],
//   "titan_solar_secondpath": 2401205106,
//   "titan_solar_thirdpath": 461974996,
//   //titan arc
//   "titan_arc_firstpath": 3720167252,
//   "titan_arc_secondpath": 3326771373,
//   "titan_arc_thirdpath": 2918527423,
//   //titan void
//   "titan_void_firstpath": 3170765412,
//   "titan_void_secondpath": 3112248479,
//   "titan_void_thirdpath": 3471252175,
//   //titan stasis
//   "titan_stasis": 1720064609,

//   //hunter solar
//   "hunter_solar_firstpath": 3165122177,
//   "hunter_solar_secondpath": 2041340886,
//   "hunter_solar_thirdpath": 2265198010,
//   //hunter arc
//   "hunter_arc_firstpath": 914737202,
//   "hunter_arc_secondpath": 2236497009,
//   "hunter_arc_thirdpath": 1302127157,
//   //hunter void
//   "hunter_void_firstpath": 423378447,
//   "hunter_void_secondpath": 4099200371,
//   "hunter_void_thirdpath": 3566763565,
//   //hunter stasis
//   "hunter_stasis": 2115357203,

//   //warlock solar
//   "warlock_solar_firstpath": 1887222240,
//   "warlock_solar_secondpath": 1267155257,
//   "warlock_solar_thirdpath": 4050937691,
//   //warlock arc
//   "warlock_arc_firstpath": 3972661583,
//   "warlock_arc_secondpath": 3368836162,
//   "warlock_arc_thirdpath": 4087094734,
//   //warlock void
//   "warlock_void_firstpath": 195170165,
//   "warlock_void_secondpath": 3247948194,
//   "warlock_void_thirdpath": 3959434990,
//   //warlock stasis
//   "warlock_stasis": 1507879500,
// };

enum CurrencyConversionType { inventoryItem, currency }

class CurrencyConversion {
  static const Map<int, CurrencyConversion> purchaseables = {
    924468777: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 1305274547), //Phaseglass
    3721881826: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 950899352), //Dusklight
    1420498062: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 49145143), //Simulation Seeds
    1812969468: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 3853748946), //Enhancement Cores
    4153440841: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 2014411539), //Alkane Dust
    1845310989: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 3487922223), //Datalattice
    2536947844: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 31293053), //Seraphite
    3245502278: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 1177810185), //Etheric Spiral
    778553120: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 592227263), //Baryon Bough
    1923884703: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 3592324052), //Helium Filaments
    4106973372: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 293622383), //Spinmetal
    1760701414: CurrencyConversion(
        CurrencyConversionType.inventoryItem, 1485756901), //Glacial Starwort
    2654422615: CurrencyConversion(
        CurrencyConversionType.currency, 1022552290), //Legendary Shards
    3664001560: CurrencyConversion(
        CurrencyConversionType.currency, 3159615086), //Glimmer
  };

  final CurrencyConversionType type;
  final int hash;

  const CurrencyConversion(this.type, this.hash);
}
