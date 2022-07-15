// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Item {
  String instanceId;
  int itemHash;
  bool isEquipped;
  List<int> mods;
  int bucketHash;
  Item({
    required this.instanceId,
    required this.itemHash,
    required this.isEquipped,
    required this.mods,
    required this.bucketHash,
  });

  Item copyWith({
    String? instanceId,
    int? itemHash,
    bool? isEquipped,
    List<int>? mods,
    int? bucketHash,
  }) {
    return Item(
      instanceId: instanceId ?? this.instanceId,
      itemHash: itemHash ?? this.itemHash,
      isEquipped: isEquipped ?? this.isEquipped,
      mods: mods ?? this.mods,
      bucketHash: bucketHash ?? this.bucketHash,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'instanceId': instanceId,
      'itemHash': itemHash,
      'isEquipped': isEquipped,
      'mods': mods,
      'bucketHash': bucketHash,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      instanceId: map['instanceId'] as String,
      itemHash: map['itemHash'] as int,
      isEquipped: map['isEquipped'] as bool,
      mods: List<int>.from((map['mods'] as List<dynamic>)),
      bucketHash: map['bucketHash'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(instanceId: $instanceId, itemHash: $itemHash, isEquipped: $isEquipped, mods: $mods, bucketHash: $bucketHash)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.instanceId == instanceId &&
        other.itemHash == itemHash &&
        other.isEquipped == isEquipped &&
        listEquals(other.mods, mods) &&
        other.bucketHash == bucketHash;
  }

  @override
  int get hashCode {
    return instanceId.hashCode ^ itemHash.hashCode ^ isEquipped.hashCode ^ mods.hashCode ^ bucketHash.hashCode;
  }
}
