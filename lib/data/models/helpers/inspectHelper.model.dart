// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quria/data/models/perk.model.dart';

class InspectWeaponStatus {
  Perk? firstColumn;
  Perk? secondColumn;
  Perk? thirdColumn;
  Perk? fourthColumn;
  Perk? fifthColumn;
  Perk? masterwork;
  Perk? mod;
  InspectWeaponStatus({
    this.firstColumn,
    this.secondColumn,
    this.thirdColumn,
    this.fourthColumn,
    this.fifthColumn,
    this.masterwork,
    this.mod,
  });

  InspectWeaponStatus copyWith({
    Perk? firstColumn,
    Perk? secondColumn,
    Perk? thirdColumn,
    Perk? fourthColumn,
    Perk? fifthColumn,
    Perk? masterwork,
    Perk? mod,
  }) {
    return InspectWeaponStatus(
      firstColumn: firstColumn ?? this.firstColumn,
      secondColumn: secondColumn ?? this.secondColumn,
      thirdColumn: thirdColumn ?? this.thirdColumn,
      fourthColumn: fourthColumn ?? this.fourthColumn,
      fifthColumn: fifthColumn ?? this.fifthColumn,
      masterwork: masterwork ?? this.masterwork,
      mod: mod ?? this.mod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstColumn': firstColumn?.toMap(),
      'secondColumn': secondColumn?.toMap(),
      'thirdColumn': thirdColumn?.toMap(),
      'fourthColumn': fourthColumn?.toMap(),
      'fifthColumn': fifthColumn?.toMap(),
      'masterwork': masterwork?.toMap(),
      'mod': mod?.toMap(),
    };
  }

  factory InspectWeaponStatus.fromMap(Map<String, dynamic> map) {
    return InspectWeaponStatus(
      firstColumn: map['firstColumn'] != null ? Perk.fromMap(map['firstColumn'] as Map<String, dynamic>) : null,
      secondColumn: map['secondColumn'] != null ? Perk.fromMap(map['secondColumn'] as Map<String, dynamic>) : null,
      thirdColumn: map['thirdColumn'] != null ? Perk.fromMap(map['thirdColumn'] as Map<String, dynamic>) : null,
      fourthColumn: map['fourthColumn'] != null ? Perk.fromMap(map['fourthColumn'] as Map<String, dynamic>) : null,
      fifthColumn: map['fifthColumn'] != null ? Perk.fromMap(map['fifthColumn'] as Map<String, dynamic>) : null,
      masterwork: map['masterwork'] != null ? Perk.fromMap(map['masterwork'] as Map<String, dynamic>) : null,
      mod: map['mod'] != null ? Perk.fromMap(map['mod'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InspectWeaponStatus.fromJson(String source) =>
      InspectWeaponStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InspectWeaponStatus(firstColumn: $firstColumn, secondColumn: $secondColumn, thirdColumn: $thirdColumn, fourthColumn: $fourthColumn, fifthColumn: $fifthColumn, masterwork: $masterwork, mod: $mod)';
  }

  @override
  bool operator ==(covariant InspectWeaponStatus other) {
    if (identical(this, other)) return true;

    return other.firstColumn == firstColumn &&
        other.secondColumn == secondColumn &&
        other.thirdColumn == thirdColumn &&
        other.fourthColumn == fourthColumn &&
        other.fifthColumn == fifthColumn &&
        other.masterwork == masterwork &&
        other.mod == mod;
  }

  @override
  int get hashCode {
    return firstColumn.hashCode ^
        secondColumn.hashCode ^
        thirdColumn.hashCode ^
        fourthColumn.hashCode ^
        fifthColumn.hashCode ^
        masterwork.hashCode ^
        mod.hashCode;
  }
}
