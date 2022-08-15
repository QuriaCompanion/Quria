// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Synergy {
  final int perkOne;
  final int perkTwo;
  final int valuePvp;
  final int valuePve;
  Synergy({
    required this.perkOne,
    required this.perkTwo,
    required this.valuePvp,
    required this.valuePve,
  });

  Synergy copyWith({
    int? perkOne,
    int? perkTwo,
    int? valuePvp,
    int? valuePve,
  }) {
    return Synergy(
      perkOne: perkOne ?? this.perkOne,
      perkTwo: perkTwo ?? this.perkTwo,
      valuePvp: valuePvp ?? this.valuePvp,
      valuePve: valuePve ?? this.valuePve,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'perkOne': perkOne,
      'perkTwo': perkTwo,
      'valuePvp': valuePvp,
      'valuePve': valuePve,
    };
  }

  factory Synergy.fromMap(Map<String, dynamic> map) {
    return Synergy(
      perkOne: map['perkOne'] as int,
      perkTwo: map['perkTwo'] as int,
      valuePvp: map['valuePvp'] as int,
      valuePve: map['valuePve'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Synergy.fromJson(String source) => Synergy.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Synergy(perkOne: $perkOne, perkTwo: $perkTwo, valuePvp: $valuePvp, valuePve: $valuePve)';
  }

  @override
  bool operator ==(covariant Synergy other) {
    if (identical(this, other)) return true;

    return other.perkOne == perkOne &&
        other.perkTwo == perkTwo &&
        other.valuePvp == valuePvp &&
        other.valuePve == valuePve;
  }

  @override
  int get hashCode {
    return perkOne.hashCode ^ perkTwo.hashCode ^ valuePvp.hashCode ^ valuePve.hashCode;
  }
}
