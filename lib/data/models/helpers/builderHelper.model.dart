import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class BuilderHelper {
  List<int> statOrder;
  List<DestinyItemComponent> armors;
  Map<String, DestinyItemSocketsComponent> sockets;
  DestinyInventoryItemDefinition? exotic;
  List<DestinyInventoryItemDefinition> mods = [
    ManifestService.manifestParsed.destinyInventoryItemDefinition![1484685887]!,
    ManifestService.manifestParsed.destinyInventoryItemDefinition![3469412969]!
  ];
  Map<int, DestinyInventoryItemDefinition> manifest;
  BuilderHelper({
    required this.statOrder,
    required this.armors,
    required this.sockets,
    required this.manifest,
    this.exotic,
  });
}

class BuilderPreparation {
  List<int> statOrder;
  int? exoticHash;
  BuilderPreparation({required this.statOrder, this.exoticHash});
}
