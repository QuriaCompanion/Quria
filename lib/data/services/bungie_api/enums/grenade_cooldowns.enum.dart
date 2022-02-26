class GrenadeCooldown {
  static const Map<int, Map<int, int>> grenadeMap = {
    98786028: tier1, //flux
    1399217: tier2, //glacier
    3078181438: tier3, //arcbolt
    3811945819: tier3, //lightning
    4256932443: tier3, //incendiary
    1399219: tier3, //coldsnap
    1547656727: tier3, //magnetic
    2265076177: tier3, //suppressor
    328872098: tier4, //skip
    1016030582: tier4, //vortex
    1255073825: tier4, //spike
    2809141585: tier4, //voidwall
    79448980: tier4, //pulse
    3322650917: tier4, //thermite
    1397213608: tier4, //solar
    1514173218: tier4, //scatter
    2909653089: tier5, //swarm
    455260043: tier5, //tripmine
    3844755601: tier5, //flashbang
    3347197644: tier5, //storm
    3232422679: tier5, //axion
    2995804739: tier6, //fusion
    1399216: tier7, //duskfield
    2927723086: tier7, //firebolt
  };

  static const Map<int, int> tier1 = {
    0: 1,
    1: 207,
    2: 189,
    3: 182,
    4: 152,
    5: 130,
    6: 114,
    7: 101,
    8: 91,
    9: 83,
    10: 70
  };
  static const Map<int, int> tier2 = {
    0: 1,
    1: 172,
    2: 158,
    3: 152,
    4: 126,
    5: 108,
    6: 95,
    7: 84,
    8: 76,
    9: 69,
    10: 58
  };
  static const Map<int, int> tier3 = {
    0: 1,
    1: 138,
    2: 126,
    3: 121,
    4: 101,
    5: 87,
    6: 76,
    7: 67,
    8: 61,
    9: 55,
    10: 47
  };
  static const Map<int, int> tier4 = {
    0: 1,
    1: 119,
    2: 109,
    3: 105,
    4: 87,
    5: 75,
    6: 65,
    7: 58,
    8: 52,
    9: 48,
    10: 40
  };
  static const Map<int, int> tier5 = {
    0: 1,
    1: 103,
    2: 95,
    3: 91,
    4: 76,
    5: 65,
    6: 57,
    7: 51,
    8: 45,
    9: 41,
    10: 35
  };
  static const Map<int, int> tier6 = {
    0: 1,
    1: 83,
    2: 76,
    3: 73,
    4: 61,
    5: 52,
    6: 45,
    7: 40,
    8: 36,
    9: 33,
    10: 28
  };
  static const Map<int, int> tier7 = {
    0: 1,
    1: 72,
    2: 66,
    3: 64,
    4: 53,
    5: 45,
    6: 40,
    7: 35,
    8: 32,
    9: 29,
    10: 24
  };
}
