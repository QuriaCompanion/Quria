import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/plug_ui_styles.dart';
import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_instance_component.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class InspectProvider with ChangeNotifier {
  DestinyItemComponent? _item;
  DestinyInventoryItemDefinition? _itemDef;
  DestinyItemComponent? get item => _item;
  DestinyInventoryItemDefinition? get itemDef => _itemDef;

  void setInspectItem({
    DestinyItemComponent? item,
    required DestinyInventoryItemDefinition itemDef,
  }) {
    _item = item;
    _itemDef = itemDef;
    notifyListeners();
  }

  Map<String, DestinyStat> getItemStats(BuildContext context) {
    return Provider.of<ItemProvider>(context).getPrecalculatedStats(_item!.itemInstanceId!) ?? {};
  }

  int? getPowerLevel(BuildContext context) {
    return Provider.of<ItemProvider>(context).getItemPowerLevel(_item!.itemInstanceId!);
  }

  String getImageLink(BuildContext context) {
    return DestinyData.bungieLink + _itemDef!.screenshot!;
  }

  String? getElementIcon(BuildContext context) {
    DestinyItemInstanceComponent? instanceInfo =
        Provider.of<ItemProvider>(context).getInstanceInfo(_item!.itemInstanceId!);
    return ManifestService
            .manifestParsed.destinyDamageTypeDefinition[itemDef?.defaultDamageTypeHash]?.displayProperties?.icon ??
        ManifestService
            .manifestParsed.destinyEnergyTypeDefinition[instanceInfo?.energy?.energyTypeHash]?.displayProperties?.icon;
  }

  Map<String, List<DestinyItemPlugBase>> getPlugs(BuildContext context) {
    return Provider.of<ItemProvider>(context).getItemReusablePlugs(_item!.itemInstanceId!);
  }

  List<DestinyItemSocketState> getIntristicsSockets(BuildContext context) {
    return Provider.of<ItemProvider>(context)
        .getItemSockets(_item!.itemInstanceId!)
        .where((element) =>
            element.plugHash != null &&
                ManifestService
                        .manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.displayProperties?.icon !=
                    null &&
                DestinyData.modCategoryHash.contains(ManifestService
                    .manifestParsed.destinyInventoryItemDefinition[element.plugHash]!.plug!.plugCategoryHash) ||
            ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugStyle ==
                PlugUiStyles.Masterwork ||
            ManifestService
                    .manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier
                    ?.contains('masterworks.stat') ==
                true)
        .toList();
  }

  DestinyInventoryItemDefinition getExoticPerk(BuildContext context) {
    List<DestinyItemSocketState> sockets = getSockets(context);
    return ManifestService.manifestParsed.destinyInventoryItemDefinition[sockets
        .firstWhere((element) =>
            ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryHash ==
                1744546145 &&
            ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.inventory?.tierType ==
                TierType.Exotic)
        .plugHash]!;
  }

  Map<int, DestinyItemSocketState> getArmorSockets(BuildContext context) {
    return getSockets(context)
        .where(
          (element) =>
              (element.isVisible!) &&
              ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryHash !=
                  2973005342 &&
              ManifestService
                      .manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier !=
                  null &&
              !ManifestService
                  .manifestParsed.destinyInventoryItemDefinition[element.plugHash]!.plug!.plugCategoryIdentifier!
                  .contains('masterworks.stat') &&
              ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.itemType !=
                  DestinyItemType.Armor &&
              ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.itemSubType !=
                  DestinyItemSubType.Ornament &&
              ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.inventory?.tierType !=
                  TierType.Exotic,
        )
        .toList()
        .asMap();
  }

  int getRemainingPoints(BuildContext context) {
    final sockets = getSockets(context);
    final armorSockets = getArmorSockets(context);
    return DisplayService.remainingModPoints(
        ManifestService
            .manifestParsed
            .destinyInventoryItemDefinition[sockets
                .firstWhere((element) =>
                    ManifestService
                        .manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier
                        ?.contains('masterworks.stat') ==
                    true)
                .plugHash]!
            .investmentStats![0]
            .value!,
        armorSockets);
  }

  List<DestinyItemSocketState> getCosmeticSockets(BuildContext context) {
    return Provider.of<ItemProvider>(context)
        .getItemSockets(_item!.itemInstanceId!)
        .where(
          (element) =>
              ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.itemType ==
                  DestinyItemType.Armor ||
              ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.itemSubType ==
                  DestinyItemSubType.Ornament ||
              ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.itemSubType ==
                  DestinyItemSubType.Shader,
        )
        .toList();
  }

  List<DestinyItemSocketState> getSockets(BuildContext context) {
    return Provider.of<ItemProvider>(context).getItemSockets(_item!.itemInstanceId!);
  }

  String? getAfinityIcon(BuildContext context) {
    DestinyItemInstanceComponent? instanceInfo =
        Provider.of<ItemProvider>(context).getInstanceInfo(_item!.itemInstanceId!);
    return ManifestService
        .manifestParsed.destinyEnergyTypeDefinition[instanceInfo?.energy?.energyTypeHash]?.displayProperties?.icon;
  }
}
