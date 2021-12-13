class BuildResponse {
  late final List<Build> builds;
  BuildResponse({required this.builds});
  BuildResponse.fromJson(Map<String, dynamic> json)
      : builds =
            (json['builds'] as List).map((e) => Build.fromJson(e)).toList();

  Map<String, dynamic> toJson() =>
      {'builds': builds.map((e) => e.toJson()).toList()};
}

class Build {
  late Stats stats;
  late List<Mod> mod;
  List<Material>? material;
  late List<Armor> equipement;
  Build({
    required this.stats,
    required this.mod,
    this.material,
    required this.equipement,
  });

  Build.fromJson(Map<String, dynamic> json) {
    stats = Stats.fromJson(json['stats']);

    mod = <Mod>[];
    json['mods'].forEach((v) {
      mod.add(Mod.fromJson(v));
    });
    material = <Material>[];
    json['materials'].forEach((v) {
      material!.add(Material.fromJson(v));
    });
    equipement = <Armor>[];
    json['equipment'].forEach((v) {
      equipement.add(Armor.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stats'] = stats.toJson();
    data['mods'] = mod.map((v) => v.toJson()).toList();
    if (material != null) {
      data['materials'] = material!.map((v) => v.toJson()).toList();
    }
    data['equipment'] = equipement.map((v) => v.toJson()).toList();
    return data;
  }
}

class Stats {
  late int base;
  late int max;
  late int mobility;
  late int resilience;
  late int recovery;
  late int discipline;
  late int intellect;
  late int strength;

  Stats(
      {required this.base,
      required this.max,
      required this.mobility,
      required this.resilience,
      required this.recovery,
      required this.discipline,
      required this.intellect,
      required this.strength});

  Stats.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    max = json['max'];
    mobility = json['mobility'];
    resilience = json['resilience'];
    recovery = json['recovery'];
    discipline = json['discipline'];
    intellect = json['intellect'];
    strength = json['strength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = base;
    data['max'] = max;
    data['mobility'] = mobility;
    data['resilience'] = resilience;
    data['recovery'] = recovery;
    data['discipline'] = discipline;
    data['intellect'] = intellect;
    data['strength'] = strength;
    return data;
  }
}

class Mod {
  late String name;
  late String icon;
  late int number;

  Mod({required this.name, required this.icon, required this.number});

  Mod.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['number'] = number;
    return data;
  }
}

class Material {
  late String name;
  late String icon;
  late int number;

  Material({required this.name, required this.icon, required this.number});

  Material.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['number'] = number;
    return data;
  }
}

class Armor {
  late String name;
  late String icon;
  late String element;
  late String type;
  late Stats stats;

  Armor(
      {required this.name,
      required this.icon,
      required this.element,
      required this.type,
      required this.stats});

  Armor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    element = json['element'];
    type = json['type'];
    stats = Stats.fromJson(json['stats']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['element'] = element;
    data['type'] = type;
    data['stats'] = stats.toJson();
    return data;
  }
}
