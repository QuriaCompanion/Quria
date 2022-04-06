import 'package:bungie_api/models/destiny_inventory_item_definition.dart';

class ClassItemChoiceHelper {
  final String characterId;
  final String? subclassInstanceId;
  final List<int> statOrder;
  final List<DestinyInventoryItemDefinition> subclassMods;
  final int exoticHash;
  ClassItemChoiceHelper({
    required this.characterId,
    required this.statOrder,
    required this.subclassMods,
    required this.exoticHash,
    this.subclassInstanceId,
  });
}
