import 'package:bungie_api/models/destiny_inventory_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/foundation.dart';

@immutable
class InventoryModel {
  final List<DestinyItemComponent> profileInventory = [];
  final Map<String, DestinyInventoryComponent> characterInventory = {};
  final Map<String, DestinyInventoryComponent> characterEquipment = {};
}
