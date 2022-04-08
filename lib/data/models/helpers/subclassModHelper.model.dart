import 'package:bungie_api/models/destiny_inventory_item_definition.dart';

class SubclassModHelper {
  final String characterId;
  final String subclassInstanceId;
  final DestinyInventoryItemDefinition subclass;
  final List<int> statOrder;
  final int exoticHash;
  SubclassModHelper({
    required this.characterId,
    required this.subclass,
    required this.subclassInstanceId,
    required this.statOrder,
    required this.exoticHash,
  });
}
