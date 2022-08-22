import 'package:bungie_api/core.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:collection/collection.dart';

import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_instance_component.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/providers/item.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ItemNotifier extends StateNotifier<ItemModel> {
  ItemNotifier() : super(const ItemModel());
  void reset() {
    state = const ItemModel();
  }

  void init(DestinyItemComponentSetOfint64? item) {
    state.instances.addAll(item?.instances?.data ?? {});
    state.stats.addAll(item?.stats?.data ?? {});
    state.sockets.addAll(item?.sockets?.data ?? {});
    state.reusablePlugs.addAll(item?.reusablePlugs?.data ?? {});
    state.talentGrids.addAll(item?.talentGrids?.data ?? {});
    state.plugStates.addAll(item?.plugStates?.data ?? {});
    state.perks.addAll(item?.perks?.data ?? {});
  }

  void setNewSockets(String itemInstanceId, List<DestinyItemSocketState> sockets) {
    state.sockets[itemInstanceId]?.sockets = sockets;
  }
}

final itemProvider = StateNotifierProvider<ItemNotifier, ItemModel>((ref) => ItemNotifier());

final itemReusablePlugsProvider =
    StateProviderFamily<Map<String, List<DestinyItemPlugBase>>, String?>((ref, itemInstanceId) {
  return ref.watch(itemProvider.select((value) => value.reusablePlugs[itemInstanceId]?.plugs ?? {}));
});

final instanceInfoProvider = StateProviderFamily<DestinyItemInstanceComponent?, String?>(
    (ref, String? instanceId) => ref.watch(itemProvider.select((value) => value.instances[instanceId])));

final itemPowerLevelProvider = StateProviderFamily<int?, String?>((ref, String? powerLevelHash) =>
    ref.watch(instanceInfoProvider(powerLevelHash).select((value) => value?.primaryStat?.value)));

final itemTalentGridProvider = StateProviderFamily<DestinyItemTalentGridComponent?, String?>(
    (ref, String? talentGridHash) => ref.watch(itemProvider.select((value) => value.talentGrids[talentGridHash])));

final itemSocketsProvider = StateProviderFamily<List<DestinyItemSocketState>, String?>((ref, String? itemInstanceId) =>
    ref.watch(itemProvider.select((value) => value.sockets[itemInstanceId]?.sockets ?? [])));

final armorSocketsProvider = StateProviderFamily<List<DestinyItemSocketState>, String?>((ref, String? itemInstanceId) =>
    ref.watch(itemProvider.select((value) =>
        value.sockets[itemInstanceId]?.sockets?.where((element) => Conditions.armorSockets(element)).toList() ?? [])));

final itemExoticPerkProvider = StateProviderFamily<DestinyInventoryItemDefinition?, String?>(
  (ref, String? itemInstanceId) => ManifestService.manifestParsed.destinyInventoryItemDefinition[ref
      .watch(
        itemProvider.select((value) => value.sockets[itemInstanceId]?.sockets?.firstWhereOrNull((element) =>
            ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryHash ==
                1744546145 &&
            ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.inventory?.tierType ==
                TierType.Exotic)),
      )
      ?.plugHash],
);

final afinityIconProvider = StateProviderFamily<String?, String?>((ref, instanceId) {
  final int? energyHash = ref.watch(instanceInfoProvider(instanceId).select((value) => value?.energy?.energyTypeHash));
  return ManifestService.manifestParsed.destinyEnergyTypeDefinition[energyHash]?.displayProperties?.icon;
});

final intristicsSocketsProvider = StateProviderFamily<List<DestinyItemSocketState>, String?>(
  (ref, String? itemInstanceId) => ref.watch(
    itemProvider.select(
      (value) =>
          value.sockets[itemInstanceId]?.sockets
              ?.where((element) => Conditions.isIntristicSockets(element.plugHash))
              .toList() ??
          [],
    ),
  ),
);

final itemElementProvider = StateProviderFamily<String?, DestinyItemComponent?>((ref, item) {
  final instanceInfo = ref.watch(instanceInfoProvider(item?.itemInstanceId));
  final itemDef = ManifestService.manifestParsed.destinyInventoryItemDefinition[item?.itemHash];
  return ManifestService
          .manifestParsed.destinyDamageTypeDefinition[itemDef?.defaultDamageTypeHash]?.displayProperties?.icon ??
      ManifestService
          .manifestParsed.destinyEnergyTypeDefinition[instanceInfo?.energy?.energyTypeHash]?.displayProperties?.icon;
});

final itemPrecalculatedStatsProvider = StateProviderFamily<Map<String, DestinyStat>, String?>((ref, itemInstanceId) {
  return ref.watch(itemProvider.select((value) => value.stats[itemInstanceId]?.stats ?? {}));
});
