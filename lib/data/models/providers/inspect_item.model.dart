import 'package:flutter/foundation.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:quria/data/models/WeaponScore.model.model.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';

@immutable
class InspectItemModel {
  const InspectItemModel({
    required this.itemDef,
    this.weaponStatus,
    this.item,
    this.weaponScore,
  });

  final DestinyInventoryItemDefinition itemDef;
  final DestinyItemComponent? item;
  final InspectWeaponStatus? weaponStatus;
  final WeaponScore? weaponScore;

  InspectItemModel copyWith({
    DestinyInventoryItemDefinition? itemDef,
    DestinyItemComponent? item,
    InspectWeaponStatus? weaponStatus,
    WeaponScore? weaponScore,
  }) {
    return InspectItemModel(
      itemDef: itemDef ?? this.itemDef,
      item: item ?? this.item,
      weaponStatus: weaponStatus ?? this.weaponStatus,
      weaponScore: weaponScore ?? this.weaponScore,
    );
  }
}
