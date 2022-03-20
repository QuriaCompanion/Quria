class MeleeCooldown {
  static const Map<int, Map<int, int>> meleeMap = {
    2028772231: tier1, //shiver strike
    2543177538: tier1, //penumbral blast
    1341767667: tier1, //withering blade
    1492934406: tier1, //ball lightning
    2805396803: tier2, //weighted knife
    4293830764: tier3, //frontal assault
    1073805481: tier4, //tempest strike
    313617030: tier4, //disorienting blow
    2242504056: tier4, //Proximity Explosive Knife
    1893159641: tier4, //Celestial fire
    4220332374: tier4, //Shield throw
    1139822081: tier5, //snare bomb
    4220332375: tier5, //Shield bash
    71216177: tier5, //balistic slam
    4099943028: tier5, //seismic strike
    3928207649: tier5, //hammer strike
    829145869: tier5, //throwing hammer
    3297679786: tier5, //rising storm
    487158888: tier5, //chain lightning
    682840449: tier5, //guiding flame
    966868917: tier5, //igniting touch
    2299867342: tier5, //Pocket Singularity
    1265726813: tier6, // knife trick
    1236431642: tier6, //mortar blast
    1690891826: tier8, //combination blow
  };

  static const Map<int, int> tier1 = {
    0: 0,
    1: 128,
    2: 117,
    3: 113,
    4: 94,
    5: 81,
    6: 70,
    7: 63,
    8: 56,
    9: 51,
    10: 43
  };
  static const Map<int, int> tier2 = {
    0: 0,
    1: 123,
    2: 113,
    3: 109,
    4: 91,
    5: 78,
    6: 68,
    7: 60,
    8: 54,
    9: 49,
    10: 42
  };
  static const Map<int, int> tier3 = {
    0: 0,
    1: 121,
    2: 111,
    3: 106,
    4: 88,
    5: 76,
    6: 66,
    7: 59,
    8: 53,
    9: 48,
    10: 41,
  };
  static const Map<int, int> tier4 = {
    0: 0,
    1: 114,
    2: 104,
    3: 100,
    4: 84,
    5: 72,
    6: 63,
    7: 56,
    8: 50,
    9: 46,
    10: 39
  };
  static const Map<int, int> tier5 = {
    0: 0,
    1: 103,
    2: 94,
    3: 90,
    4: 75,
    5: 64,
    6: 56,
    7: 50,
    8: 45,
    9: 41,
    10: 35
  };
  static const Map<int, int> tier6 = {
    0: 0,
    1: 93,
    2: 85,
    3: 82,
    4: 68,
    5: 59,
    6: 51,
    7: 46,
    8: 41,
    9: 37,
    10: 32
  };
  static const Map<int, int> tier7 = {
    0: 0,
    1: 85,
    2: 78,
    3: 75,
    4: 63,
    5: 54,
    6: 47,
    7: 42,
    8: 38,
    9: 34,
    10: 29
  };
  static const Map<int, int> tier8 = {
    0: 0,
    1: 17,
    2: 16,
    3: 15,
    4: 13,
    5: 11,
    6: 9,
    7: 8,
    8: 8,
    9: 7,
    10: 6
  };
}
