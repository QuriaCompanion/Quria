import 'dart:convert';

class Perk {
  int itemHash;
  int? valuePve;
  int? valuePvp;
  Perk({
    required this.itemHash,
    this.valuePve,
    this.valuePvp,
  });

  Perk copyWith({
    int? itemHash,
    int? valuePve,
    int? valuePvp,
  }) {
    return Perk(
      itemHash: itemHash ?? this.itemHash,
      valuePve: valuePve ?? this.valuePve,
      valuePvp: valuePvp ?? this.valuePvp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemHash': itemHash,
      'valuePve': valuePve,
      'valuePvp': valuePvp,
    };
  }

  factory Perk.fromMap(Map<int, dynamic> map) {
    return Perk(
      itemHash: map['itemHash'] as int,
      valuePve: map['valuePve'] != null ? map['valuePve'] as int : null,
      valuePvp: map['valuePvp'] != null ? map['valuePvp'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Perk.fromJson(String source) => Perk.fromMap(json.decode(source) as Map<int, dynamic>);

  @override
  String toString() => 'Perk(itemHash: $itemHash, valuePve: $valuePve, valuePvp: $valuePvp)';

  @override
  bool operator ==(covariant Perk other) {
    if (identical(this, other)) return true;

    return other.itemHash == itemHash && other.valuePve == valuePve && other.valuePvp == valuePvp;
  }

  @override
  int get hashCode => itemHash.hashCode ^ valuePve.hashCode ^ valuePvp.hashCode;
}
