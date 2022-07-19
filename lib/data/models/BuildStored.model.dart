// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bungie_api/enums/destiny_class.dart';
import 'package:flutter/foundation.dart';

import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/models/Preset.model.dart';

class BuildStored {
  String id;
  String name;
  List<Item> items;
  String bungieName;
  int usedTimes;
  DestinyClass? className;
  DateTime date;
  Preset preset;
  BuildStored(
    this.id,
    this.name,
    this.items,
    this.bungieName,
    this.usedTimes,
    this.className,
    this.date,
    this.preset,
  );

  BuildStored copyWith({
    String? id,
    String? name,
    List<Item>? items,
    String? bungieName,
    int? usedTimes,
    DestinyClass? className,
    DateTime? date,
    Preset? preset,
  }) {
    return BuildStored(
      id ?? this.id,
      name ?? this.name,
      items ?? this.items,
      bungieName ?? this.bungieName,
      usedTimes ?? this.usedTimes,
      className ?? this.className,
      date ?? this.date,
      preset ?? this.preset,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'items': items.map((x) => x.toMap()).toList(),
      'bungieName': bungieName,
      'usedTimes': usedTimes,
      'className': className?.value,
      'date': date.millisecondsSinceEpoch,
      'preset': preset.toMap(),
    };
  }

  factory BuildStored.fromMap(Map<String, dynamic> map) {
    return BuildStored(
      map['id'] as String,
      map['name'] as String,
      List<Item>.from(
        (map['items']).map<Item>(
          (x) => Item.fromJson(x),
        ),
      ),
      map['bungieName'] as String,
      map['usedTimes'] as int,
      decodeDestinyClass(map['className']) ?? DestinyClass.Unknown,
      DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      Preset.fromJson(map['preset'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory BuildStored.fromJson(String source) => BuildStored.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BuildStored(id: $id, name: $name, items: $items, bungieName: $bungieName, usedTimes: $usedTimes, className: $className, date: $date, preset: $preset)';
  }

  @override
  bool operator ==(covariant BuildStored other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.items, items) &&
        other.bungieName == bungieName &&
        other.usedTimes == usedTimes &&
        other.className == className &&
        other.date == date &&
        other.preset == preset;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        items.hashCode ^
        bungieName.hashCode ^
        usedTimes.hashCode ^
        className.hashCode ^
        date.hashCode ^
        preset.hashCode;
  }
}
