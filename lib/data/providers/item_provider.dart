import 'package:bungie_api/core.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_instance_component.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';
import 'package:bungie_api/models/destiny_item_stats_component.dart';
import 'package:bungie_api/models/destiny_item_reusable_plugs_component.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:bungie_api/models/destiny_item_plug_component.dart';
import 'package:bungie_api/models/destiny_item_perks_component.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/foundation.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ItemProvider with ChangeNotifier {
  Map<String, DestinyItemInstanceComponent> _instances = {};
  Map<String, DestinyItemStatsComponent> _stats = {};
  Map<String, DestinyItemSocketsComponent> _sockets = {};
  Map<String, DestinyItemReusablePlugsComponent> _reusablePlugs = {};
  Map<String, DestinyItemTalentGridComponent> _talentGrids = {};
  Map<String, DestinyItemPlugComponent> _plugStates = {};
  Map<String, DestinyItemPerksComponent> _perks = {};

  Map<String, DestinyItemInstanceComponent> get instances => _instances;
  Map<String, DestinyItemStatsComponent> get stats => _stats;
  Map<String, DestinyItemSocketsComponent> get sockets => _sockets;
  Map<String, DestinyItemReusablePlugsComponent> get reusablePlugs => _reusablePlugs;
  Map<String, DestinyItemTalentGridComponent> get talentGrids => _talentGrids;
  Map<String, DestinyItemPlugComponent> get plugStates => _plugStates;
  Map<String, DestinyItemPerksComponent> get perks => _perks;

  void init(DestinyItemComponentSetOfint64? item) {
    _instances = item?.instances?.data ?? {};
    _stats = item?.stats?.data ?? {};
    _sockets = item?.sockets?.data ?? {};
    _reusablePlugs = item?.reusablePlugs?.data ?? {};
    _talentGrids = item?.talentGrids?.data ?? {};
    _plugStates = item?.plugStates?.data ?? {};
    _perks = item?.perks?.data ?? {};
    notifyListeners();
  }

  void reset() {
    _instances = {};
    _stats = {};
    _sockets = {};
    _reusablePlugs = {};
    _talentGrids = {};
    _plugStates = {};
    _perks = {};
    notifyListeners();
  }

  void setNewSockets(String itemInstanceId, List<DestinyItemSocketState> sockets) {
    _sockets[itemInstanceId]?.sockets = sockets;
    notifyListeners();
  }

  DestinyItemInstanceComponent? getInstanceInfo(String? instanceId) {
    return _instances[instanceId];
  }

  Map<String, List<DestinyItemPlugBase>> getItemReusablePlugs(String? itemInstanceId) {
    return _reusablePlugs[itemInstanceId]?.plugs ?? {};
  }

  DestinyItemTalentGridComponent? getTalentGrid(String instanceId) {
    if (_talentGrids.containsKey(instanceId)) {
      return _talentGrids[instanceId]!;
    }
    return null;
  }

  int? getItemPowerLevel(String? instanceId) {
    final instanceInfo = getInstanceInfo(instanceId);
    return instanceInfo?.primaryStat?.value;
  }

  List<DestinyItemSocketState> getItemSockets(String? itemInstanceId) {
    return _sockets[itemInstanceId]?.sockets ?? [];
  }

  String? getItemElement(DestinyItemComponent item) {
    final itemDef = ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash];
    final instanceInfo = getInstanceInfo(item.itemInstanceId);
    return ManifestService
            .manifestParsed.destinyDamageTypeDefinition[itemDef?.defaultDamageTypeHash]?.displayProperties?.icon ??
        ManifestService
            .manifestParsed.destinyEnergyTypeDefinition[instanceInfo?.energy?.energyTypeHash]?.displayProperties?.icon;
  }

  Map<String, DestinyStat>? getPrecalculatedStats(String? itemInstanceId) {
    if (_stats.containsKey(itemInstanceId)) {
      return _stats[itemInstanceId]?.stats;
    }
    return null;
  }
}
