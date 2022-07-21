// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Preset {
  final List<int> statOrder;
  final int? exoticHash;
  final int? subclassHash;
  final Map<String, List<int>> armorMods;
  final List<int> subclassMods;
  Preset({
    required this.statOrder,
    this.exoticHash,
    this.subclassHash,
    required this.armorMods,
    required this.subclassMods,
  });

  Preset copyWith({
    List<int>? statOrder,
    int? exoticHash,
    int? subclassHash,
    Map<String, List<int>>? armorMods,
    List<int>? subclassMods,
  }) {
    return Preset(
      statOrder: statOrder ?? this.statOrder,
      exoticHash: exoticHash ?? this.exoticHash,
      subclassHash: subclassHash ?? this.subclassHash,
      armorMods: armorMods ?? this.armorMods,
      subclassMods: subclassMods ?? this.subclassMods,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statOrder': statOrder,
      'exoticHash': exoticHash,
      'subclassHash': subclassHash,
      'armorMods': armorMods,
      'subclassMods': subclassMods,
    };
  }

  factory Preset.fromMap(Map<String, dynamic> map) {
    return Preset(
      statOrder: List<int>.from((map['statOrder'])),
      exoticHash: map['exoticHash'] != null ? map['exoticHash'] as int : null,
      subclassHash: map['subclassHash'] != null ? map['subclassHash'] as int : null,
      armorMods: Map<String, List<dynamic>>.from(map['armorMods']).map(
        (k, v) => MapEntry(
          k,
          (v).cast<int>(),
        ),
      ),
      subclassMods: List<int>.from(map['subclassMods']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Preset.fromJson(String source) => Preset.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Preset(statOrder: $statOrder, exoticHash: $exoticHash, subclassHash: $subclassHash, armorMods: $armorMods, subclassMods: $subclassMods)';
  }

  @override
  bool operator ==(covariant Preset other) {
    if (identical(this, other)) return true;

    return listEquals(other.statOrder, statOrder) &&
        other.exoticHash == exoticHash &&
        other.subclassHash == subclassHash &&
        mapEquals(other.armorMods, armorMods) &&
        listEquals(other.subclassMods, subclassMods);
  }

  @override
  int get hashCode {
    return statOrder.hashCode ^
        exoticHash.hashCode ^
        subclassHash.hashCode ^
        armorMods.hashCode ^
        subclassMods.hashCode;
  }
}
