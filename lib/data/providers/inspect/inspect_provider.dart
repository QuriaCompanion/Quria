import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/WeaponScore.model.model.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/models/providers/inspect_item.model.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class InspectNotifier extends StateNotifier<InspectItemModel?> {
  InspectNotifier() : super(null);

  void setInspectItem({
    DestinyItemComponent? item,
    required DestinyInventoryItemDefinition itemDef,
  }) {
    state = InspectItemModel(
      itemDef: itemDef,
      item: item,
    );
  }

  void setWeaponStatus(InspectWeaponStatus? status) {
    state = state?.copyWith(weaponStatus: status);
  }

  void setWeaponScore(WeaponScore? score) {
    state = state?.copyWith(weaponScore: score);
  }
}

enum InspectWeaponInfo {
  statistics,
  recommendations,
}

final subtabInspectProvider = StateProvider<InspectWeaponInfo>((ref) => InspectWeaponInfo.statistics);

final inspectProvider = StateNotifierProvider<InspectNotifier, InspectItemModel?>(((ref) => InspectNotifier()));

final inspectBonusStatProvider = StateProvider<Map<int, int>>((ref) {
  Map<int, int> bonusStats = {};
  List<DestinyInventoryItemDefinition?> perks = [];
  final InspectWeaponStatus? weaponStatus = ref.watch(inspectProvider.select((state) => state?.weaponStatus));
  if (weaponStatus != null) {
    perks.add(ManifestService.manifestParsed.destinyInventoryItemDefinition[weaponStatus.firstColumn?.itemHash]);
    perks.add(ManifestService.manifestParsed.destinyInventoryItemDefinition[weaponStatus.secondColumn?.itemHash]);
    perks.add(ManifestService.manifestParsed.destinyInventoryItemDefinition[weaponStatus.thirdColumn?.itemHash]);
    perks.add(ManifestService.manifestParsed.destinyInventoryItemDefinition[weaponStatus.fourthColumn?.itemHash]);
    perks.add(ManifestService.manifestParsed.destinyInventoryItemDefinition[weaponStatus.fifthColumn?.itemHash]);
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
});

final inspectImageLink = StateProvider<String?>((ref) {
  final DestinyInventoryItemDefinition? itemDef = ref.watch(inspectProvider.select((state) => state?.itemDef));
  return itemDef?.screenshot != null
      ? '${DestinyData.bungieLink}${itemDef!.screenshot!}?t=${BungieApiService.randomUserInt}'
      : "${DestinyData.bungieLink}/common/destiny2_content/screenshots/2345794502.jpg?t={${BungieApiService.randomUserInt}}";
});

final inspectRemainingPointsProvider = StateProvider<int>((ref) {
  final instanceId = ref.watch(inspectProvider.select((state) => state?.item?.itemInstanceId));
  if (instanceId == null) return 0;
  final sockets = ref.watch(itemSocketsProvider(instanceId));
  final armorSockets = ref.watch(armorSocketsProvider(instanceId));
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
});
