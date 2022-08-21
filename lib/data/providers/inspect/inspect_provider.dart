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
import 'package:quria/data/models/WeaponScore.model.model.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class InspectProvider with ChangeNotifier {
  DestinyItemComponent? _item;
  DestinyInventoryItemDefinition? _itemDef;
  InspectWeaponStatus? _weaponStatus;
  WeaponScore? _weaponScore;

  DestinyItemComponent? get item => _item;
  DestinyInventoryItemDefinition? get itemDef => _itemDef;
  InspectWeaponStatus? get weaponStatus => _weaponStatus;
  WeaponScore? get weaponScore => _weaponScore;

  void setInspectItem({
    DestinyItemComponent? item,
    required DestinyInventoryItemDefinition itemDef,
  }) {
    _weaponStatus = null;
    _weaponScore = null;
    _item = item;
    _itemDef = itemDef;
    notifyListeners();
  }

  void setInitInspectWeaponStatus(InspectWeaponStatus? status) {
    _weaponStatus = status;
  }

  void setWeaponStatus(InspectWeaponStatus? status) {
    _weaponStatus = status;
    notifyListeners();
  }

  void setWeaponScore(WeaponScore? score) {
    _weaponScore = score;
    notifyListeners();
  }

  Map<int, int> getBonusStats() {
    Map<int, int> bonusStats = {};
    List<DestinyInventoryItemDefinition?> perks = [];
    if (_weaponStatus != null) {
      perks.add(ManifestService.manifestParsed.destinyInventoryItemDefinition[_weaponStatus?.firstColumn?.itemHash]);
      perks.add(ManifestService.manifestParsed.destinyInventoryItemDefinition[_weaponStatus?.secondColumn?.itemHash]);
      perks.add(ManifestService.manifestParsed.destinyInventoryItemDefinition[_weaponStatus?.thirdColumn?.itemHash]);
      perks.add(ManifestService.manifestParsed.destinyInventoryItemDefinition[_weaponStatus?.fourthColumn?.itemHash]);
      perks.add(ManifestService.manifestParsed.destinyInventoryItemDefinition[_weaponStatus?.fifthColumn?.itemHash]);
    }
    for (final perk in perks) {
      if (perk?.investmentStats?.isNotEmpty ?? false) {
        for (final stat in perk!.investmentStats!) {
          final increasing = (bonusStats[stat.statTypeHash] ?? 0) + (stat.value ?? 0);
          bonusStats[stat.statTypeHash!] = increasing;
        }
      }
    }
    return bonusStats;
  }

  Map<String, DestinyStat> getItemStats(BuildContext context) {
    return Provider.of<ItemProvider>(context).getPrecalculatedStats(_item?.itemInstanceId) ?? {};
  }

  int? getPowerLevel(BuildContext context) {
    return Provider.of<ItemProvider>(context).getItemPowerLevel(_item?.itemInstanceId);
  }

  String getImageLink(BuildContext context) {
    // TODO: this image isn't the best choice, but it's the best I can do for now.
    return _itemDef?.screenshot != null
        ? '${DestinyData.bungieLink}${_itemDef!.screenshot!}?t={${BungieApiService.randomUserInt}}123456'
        : "${DestinyData.bungieLink}/common/destiny2_content/screenshots/2345794502.jpg?t={${BungieApiService.randomUserInt}}1589788";
  }

  String? getElementIcon(BuildContext context) {
    DestinyItemInstanceComponent? instanceInfo =
        Provider.of<ItemProvider>(context).getInstanceInfo(_item?.itemInstanceId);
    return ManifestService
            .manifestParsed.destinyDamageTypeDefinition[itemDef?.defaultDamageTypeHash]?.displayProperties?.icon ??
        ManifestService
            .manifestParsed.destinyEnergyTypeDefinition[instanceInfo?.energy?.energyTypeHash]?.displayProperties?.icon;
  }

  Map<String, List<DestinyItemPlugBase>> getPlugs(BuildContext context) {
    return Provider.of<ItemProvider>(context).getItemReusablePlugs(_item?.itemInstanceId);
  }

  List<DestinyItemSocketState> getIntristicsSockets(BuildContext context) {
    return Provider.of<ItemProvider>(context)
        .getItemSockets(_item?.itemInstanceId)
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
        .getItemSockets(_item?.itemInstanceId)
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
    return Provider.of<ItemProvider>(context).getItemSockets(_item?.itemInstanceId);
  }

  String? getAfinityIcon(BuildContext context) {
    DestinyItemInstanceComponent? instanceInfo =
        Provider.of<ItemProvider>(context).getInstanceInfo(_item!.itemInstanceId!);
    return ManifestService
        .manifestParsed.destinyEnergyTypeDefinition[instanceInfo?.energy?.energyTypeHash]?.displayProperties?.icon;
  }
}
