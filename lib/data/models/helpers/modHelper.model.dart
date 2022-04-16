import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';

class ModHelper {
  final String characterId;
  final String? subclassInstanceId;
  final List<int> statOrder;
  final List<DestinyInventoryItemDefinition> subclassMods;
  final int exoticHash;
  final String classItemInstanceId;
  ModHelper({
    required this.characterId,
    required this.statOrder,
    required this.subclassMods,
    required this.exoticHash,
    required this.classItemInstanceId,
    this.subclassInstanceId,
  });
}
