// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bungie_api/enums/destiny_class.dart';
import 'package:flutter/foundation.dart';

import 'package:quria/data/models/Item.model.dart';

class BuildStored {
  String id;
  String name;
  List<Item> items;
  String bungieName;
  int usedTimes;
  DestinyClass? className;
  DateTime date;
  BuildStored(
    this.id,
    this.name,
    this.items,
    this.bungieName,
    this.usedTimes,
    this.className,
    this.date,
  );

  BuildStored copyWith({
    String? id,
    String? name,
    List<Item>? items,
    String? bungieName,
    int? usedTimes,
    DestinyClass? className,
    DateTime? date,
  }) {
    return BuildStored(
      id ?? this.id,
      name ?? this.name,
      items ?? this.items,
      bungieName ?? this.bungieName,
      usedTimes ?? this.usedTimes,
      className ?? this.className,
      date ?? this.date,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory BuildStored.fromJson(String source) => BuildStored.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BuildStored(id: $id, name: $name, items: $items, bungieName: $bungieName, usedTimes: $usedTimes, className: $className, date: $date)';
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
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        items.hashCode ^
        bungieName.hashCode ^
        usedTimes.hashCode ^
        className.hashCode ^
        date.hashCode;
  }
}
