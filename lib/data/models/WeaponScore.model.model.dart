// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quria/data/models/Synergy.model.dart';
import 'package:quria/data/models/perk.model.dart';

class WeaponScore {
  final String itemHash;
  final double ratioPve;
  final double ratioPvp;
  final List<Perk> columnOne;
  final List<Perk> columnTwo;
  final List<Perk> columnThree;
  final List<Perk> columnFour;
  final List<Perk> columnFive;
  final List<Perk> masterwork;
  final List<Synergy> synergies;
  final String? notes;
  final String? author;
  WeaponScore({
    required this.itemHash,
    required this.ratioPve,
    required this.ratioPvp,
    required this.columnOne,
    required this.columnTwo,
    required this.columnThree,
    required this.columnFour,
    required this.columnFive,
    required this.masterwork,
    required this.synergies,
    this.notes,
    this.author,
  });

  WeaponScore copyWith({
    String? itemHash,
    double? ratioPve,
    double? ratioPvp,
    List<Perk>? columnOne,
    List<Perk>? columnTwo,
    List<Perk>? columnThree,
    List<Perk>? columnFour,
    List<Perk>? columnFive,
    List<Perk>? masterwork,
    List<Perk>? mod,
    List<Synergy>? synergies,
    String? notes,
    String? author,
  }) {
    return WeaponScore(
      itemHash: itemHash ?? this.itemHash,
      ratioPve: ratioPve ?? this.ratioPve,
      ratioPvp: ratioPvp ?? this.ratioPvp,
      columnOne: columnOne ?? this.columnOne,
      columnTwo: columnTwo ?? this.columnTwo,
      columnThree: columnThree ?? this.columnThree,
      columnFour: columnFour ?? this.columnFour,
      columnFive: columnFive ?? this.columnFive,
      masterwork: masterwork ?? this.masterwork,
      synergies: synergies ?? this.synergies,
      notes: notes ?? this.notes,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemHash': itemHash,
      'ratioPve': ratioPve,
      'ratioPvp': ratioPvp,
      'columnOne': columnOne.map((x) => x.toMap()).toList(),
      'columnTwo': columnTwo.map((x) => x.toMap()).toList(),
      'columnThree': columnThree.map((x) => x.toMap()).toList(),
      'columnFour': columnFour.map((x) => x.toMap()).toList(),
      'columnFive': columnFive.map((x) => x.toMap()).toList(),
      'masterwork': masterwork.map((x) => x.toMap()).toList(),
      'synergies': synergies.map((x) => x.toMap()).toList(),
      'notes': notes,
      'author': author,
    };
  }

  factory WeaponScore.fromMap(Map<String, dynamic> map) {
    return WeaponScore(
      itemHash: map['itemHash'] as String,
      ratioPve: map['ratioPve'] as double,
      ratioPvp: map['ratioPvp'] as double,
      columnOne: List<Perk>.from(
        map['columnOne']?.map<Perk>((x) => Perk.fromMap(x as Map<String, dynamic>)) ?? [],
      ),
      columnTwo: List<Perk>.from(
        map['columnTwo']?.map<Perk>((x) => Perk.fromMap(x as Map<String, dynamic>)) ?? [],
      ),
      columnThree: List<Perk>.from(
        map['columnThree']?.map<Perk>((x) => Perk.fromMap(x as Map<String, dynamic>)) ?? [],
      ),
      columnFour: List<Perk>.from(
        map['columnFour']?.map<Perk>((x) => Perk.fromMap(x as Map<String, dynamic>)) ?? [],
      ),
      columnFive: List<Perk>.from(
        map['columnFive']?.map<Perk>((x) => Perk.fromMap(x as Map<String, dynamic>)) ?? [],
      ),
      masterwork: List<Perk>.from(
        map['masterwork']?.map<Perk>((x) => Perk.fromMap(x as Map<String, dynamic>)) ?? [],
      ),
      synergies: List<Synergy>.from(
        map['synergies']?.map<Synergy>((x) => Synergy.fromMap(x)) ?? [],
      ),
      notes: map['notes'] != null ? map['notes'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponScore.fromJson(String source) => WeaponScore.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeaponScore(itemHash: $itemHash, ratioPve: $ratioPve, ratioPvp: $ratioPvp, columnOne: $columnOne, columnTwo: $columnTwo, columnThree: $columnThree, columnFour: $columnFour, columnFive: $columnFive, masterwork: $masterwork,  synergies: $synergies, notes: $notes, author: $author)';
  }

  @override
  bool operator ==(covariant WeaponScore other) {
    if (identical(this, other)) return true;

    return other.itemHash == itemHash &&
        other.ratioPve == ratioPve &&
        other.ratioPvp == ratioPvp &&
        listEquals(other.columnOne, columnOne) &&
        listEquals(other.columnTwo, columnTwo) &&
        listEquals(other.columnThree, columnThree) &&
        listEquals(other.columnFour, columnFour) &&
        listEquals(other.columnFive, columnFive) &&
        listEquals(other.masterwork, masterwork) &&
        listEquals(other.synergies, synergies) &&
        other.notes == notes &&
        other.author == author;
  }

  @override
  int get hashCode {
    return itemHash.hashCode ^
        ratioPve.hashCode ^
        ratioPvp.hashCode ^
        columnOne.hashCode ^
        columnTwo.hashCode ^
        columnThree.hashCode ^
        columnFour.hashCode ^
        columnFive.hashCode ^
        masterwork.hashCode ^
        synergies.hashCode ^
        notes.hashCode ^
        author.hashCode;
  }
}
