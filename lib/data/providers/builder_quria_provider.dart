import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/StatWeighing.enum.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/models/providers/builder_custom.model.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class BuilderQuriaNotifier extends StateNotifier<BuilderQuriaModel> {
  BuilderQuriaNotifier() : super(BuilderQuriaModel());
  void init() {
    state = state.copyWith(mods: defaultMods);
  }

  void reset() {
    state = state.copyWith(
      classItem: null,
      exotic: null,
      subclass: null,
      subclassId: null,
      statWeighing: StatWeighing.allTiers,
      considerMasterwork: true,
      includeSunset: true,
      mods: defaultMods,
      subclassMods: [],
    );
  }

  void setClassItem(
    DestinyItemComponent? classItem,
  ) {
    state = state.copyWith(
      classItem: classItem,
    );
  }

  void setSubclassMods(
    List<DestinyInventoryItemDefinition> subclassMods,
  ) {
    state.subclassMods.replaceRange(0, state.subclassMods.length, subclassMods);
  }

  void setConsiderMasterwork(bool considerMasterwork) {
    state = state.copyWith(
      considerMasterwork: considerMasterwork,
    );
  }

  void setRemoveSunset(bool removeSunset) {
    state = state.copyWith(
      includeSunset: removeSunset,
    );
  }

  void setExotic(DestinyInventoryItemDefinition? exotic) {
    state = state.copyWith(
      exotic: exotic,
    );
  }

  void setStatsFilter(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final FilterHelper item = state.filters.removeAt(oldIndex);
    state.filters.insert(newIndex, item);
  }

  void setStatWeighing(StatWeighing statWeighing) {
    state = state.copyWith(
      statWeighing: statWeighing,
    );
  }

  void setMods(
    List<ModSlots> mods,
  ) {
    state = state.copyWith(
      mods: mods,
    );
  }

  void setNewStatsFilters(List<FilterHelper> filters) {
    state.filters.clear();
    state.filters.addAll(filters);
  }

  void setSubclass(
    String? subclassId,
    DestinyInventoryItemDefinition? subclass,
  ) {
    state = state.copyWith(
      subclassId: subclassId,
      subclass: subclass,
    );
  }
}

final builderQuriaProvider =
    StateNotifierProvider<BuilderQuriaNotifier, BuilderQuriaModel>((ref) => BuilderQuriaNotifier());

final defaultMods = [
  ModSlots(
      slotHash: InventoryBucket.helmet,
      elementSocketEntries:
          ManifestService.manifestParsed.destinyInventoryItemDefinition[3473581026]!.sockets!.socketEntries!,
      items: [
        null,
        ManifestService.manifestParsed.destinyInventoryItemDefinition[807186981],
        ManifestService.manifestParsed.destinyInventoryItemDefinition[807186981],
        ManifestService.manifestParsed.destinyInventoryItemDefinition[2493100093],
      ]),
  // gauntlets
  ModSlots(
      slotHash: InventoryBucket.gauntlets,
      elementSocketEntries:
          ManifestService.manifestParsed.destinyInventoryItemDefinition[2771648715]!.sockets!.socketEntries!,
      items: [
        null,
        ManifestService.manifestParsed.destinyInventoryItemDefinition[1844045567],
        ManifestService.manifestParsed.destinyInventoryItemDefinition[1844045567],
        ManifestService.manifestParsed.destinyInventoryItemDefinition[2493100093],
      ]),
  // chest
  ModSlots(
      slotHash: InventoryBucket.chestArmor,
      elementSocketEntries:
          ManifestService.manifestParsed.destinyInventoryItemDefinition[549825413]!.sockets!.socketEntries!,
      items: [
        null,
        ManifestService.manifestParsed.destinyInventoryItemDefinition[1659393211],
        ManifestService.manifestParsed.destinyInventoryItemDefinition[1659393211],
        ManifestService.manifestParsed.destinyInventoryItemDefinition[2493100093],
      ]),
  // legs
  ModSlots(
      slotHash: InventoryBucket.legArmor,
      elementSocketEntries:
          ManifestService.manifestParsed.destinyInventoryItemDefinition[4287863773]!.sockets!.socketEntries!,
      items: [
        null,
        ManifestService.manifestParsed.destinyInventoryItemDefinition[573150099],
        ManifestService.manifestParsed.destinyInventoryItemDefinition[573150099],
        ManifestService.manifestParsed.destinyInventoryItemDefinition[2493100093],
      ]),
  // class items
  ModSlots(
      slotHash: InventoryBucket.classArmor,
      elementSocketEntries:
          ManifestService.manifestParsed.destinyInventoryItemDefinition[3500810712]!.sockets!.socketEntries!,
      items: [
        null,
        ManifestService.manifestParsed.destinyInventoryItemDefinition[1137289077],
        ManifestService.manifestParsed.destinyInventoryItemDefinition[1137289077],
        ManifestService.manifestParsed.destinyInventoryItemDefinition[2493100093],
      ]),
];
