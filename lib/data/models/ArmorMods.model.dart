import 'package:bungie_api/models/destiny_item_socket_entry_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';

@immutable
class ModSlots {
  final int slotHash;
  final List<DestinyItemSocketEntryDefinition> elementSocketEntries;
  final List<DestinyInventoryItemDefinition?> items;
  const ModSlots({
    required this.slotHash,
    required this.elementSocketEntries,
    required this.items,
  });
  String fromIntToName(BuildContext context, int value) {
    switch (value) {
      case InventoryBucket.helmet:
        return AppLocalizations.of(context)!.helmet;
      case InventoryBucket.gauntlets:
        return AppLocalizations.of(context)!.gauntlets;
      case InventoryBucket.chestArmor:
        return AppLocalizations.of(context)!.chest;
      case InventoryBucket.legArmor:
        return AppLocalizations.of(context)!.legs;
      case InventoryBucket.classArmor:
        return AppLocalizations.of(context)!.class_item;
      default:
        return "wut";
    }
  }
}
