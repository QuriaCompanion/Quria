import 'dart:async';
import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_collectible_state.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_artifact_profile_scoped.dart';
import 'package:bungie_api/models/destiny_character_activities_component.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_character_progression_component.dart';
import 'package:bungie_api/models/destiny_collectible_component.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_instance_component.dart';
import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_item_sockets_component.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:bungie_api/models/destiny_metric_component.dart';
import 'package:bungie_api/models/destiny_objective_progress.dart';
import 'package:bungie_api/models/destiny_presentation_node_component.dart';
import 'package:bungie_api/models/destiny_profile_response.dart';
import 'package:bungie_api/models/destiny_record_component.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:bungie_api/models/destiny_talent_node.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:bungie_api/enums/destiny_component_type.dart';
import 'package:bungie_api/enums/destiny_scope.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

enum LastLoadedFrom { server, cache }

class ProfileComponentGroups {
  static const List<DestinyComponentType> basicProfile = [
    DestinyComponentType.Characters,
    DestinyComponentType.CharacterActivities,
    DestinyComponentType.CharacterProgressions,
    DestinyComponentType.CharacterEquipment,
    DestinyComponentType.CharacterInventories,
    DestinyComponentType.ProfileInventories,
    DestinyComponentType.ProfileCurrencies,
    DestinyComponentType.ProfileProgression,
    DestinyComponentType.ItemInstances,
    DestinyComponentType.ItemStats,
    DestinyComponentType.ItemObjectives,
    DestinyComponentType.ItemTalentGrids,
    DestinyComponentType.ItemSockets,
    DestinyComponentType.ItemPlugStates,
    DestinyComponentType.ItemPlugObjectives,
    DestinyComponentType.ItemReusablePlugs,
  ];

  static const List<DestinyComponentType> inventories = [
    DestinyComponentType.CharacterEquipment,
    DestinyComponentType.CharacterInventories,
    DestinyComponentType.ProfileInventories,
  ];

  static const List<DestinyComponentType> collections = [
    DestinyComponentType.Collectibles,
    DestinyComponentType.PresentationNodes,
  ];

  static const List<DestinyComponentType> triumphs = [
    DestinyComponentType.Records,
    DestinyComponentType.Metrics,
    DestinyComponentType.PresentationNodes,
  ];

  static const List<DestinyComponentType> everything = [
    DestinyComponentType.Characters,
    DestinyComponentType.CharacterActivities,
    DestinyComponentType.CharacterProgressions,
    DestinyComponentType.CharacterEquipment,
    DestinyComponentType.CharacterInventories,
    DestinyComponentType.ProfileInventories,
    DestinyComponentType.ProfileCurrencies,
    DestinyComponentType.ProfileProgression,
    DestinyComponentType.ItemInstances,
    DestinyComponentType.ItemStats,
    DestinyComponentType.ItemObjectives,
    DestinyComponentType.ItemTalentGrids,
    DestinyComponentType.ItemSockets,
    DestinyComponentType.ItemPlugStates,
    DestinyComponentType.ItemPlugObjectives,
    DestinyComponentType.ItemReusablePlugs,
    DestinyComponentType.Collectibles,
    DestinyComponentType.Records,
    DestinyComponentType.Metrics,
    DestinyComponentType.PresentationNodes,
    DestinyComponentType.Profiles,
  ];
}

class ProfileService {
  static final ProfileService _singleton = ProfileService._internal();
  late DateTime lastUpdated;
  factory ProfileService() {
    return _singleton;
  }
  ProfileService._internal();

  static const List<int> profileBuckets = [
    InventoryBucket.modifications,
    InventoryBucket.shaders,
    InventoryBucket.consumables
  ];
  final _api = BungieApiService();

  DestinyProfileResponse? _profile;
  late LastLoadedFrom _lastLoadedFrom;

  bool pauseAutomaticUpdater = false;

  List<DestinyComponentType> updateComponents =
      ProfileComponentGroups.everything;

  Future<DestinyProfileResponse?> fetchProfileData(
      {List<DestinyComponentType>? components, bool skipUpdate = false}) async {
    try {
      DestinyProfileResponse? res = await _updateProfileData(updateComponents);
      _lastLoadedFrom = LastLoadedFrom.server;
      return res;
    } catch (e) {
      if (!skipUpdate) await Future.delayed(const Duration(seconds: 2));
    }
    return _profile;
  }

  void startAutomaticUpdater() async {
    if (_lastLoadedFrom == LastLoadedFrom.cache) {
      await fetchProfileData(components: ProfileComponentGroups.everything);
    }
    while (true) {
      var duration = const Duration(seconds: 30);
      await Future.delayed(duration);
      if (pauseAutomaticUpdater != true) {
        try {
          await fetchProfileData(components: updateComponents);
        } catch (e) {
          rethrow;
        }
      }
    }
  }

  Future<DestinyProfileResponse?> _updateProfileData(
      List<DestinyComponentType> components) async {
    DestinyProfileResponse? response;
    response = await _api.getCurrentProfile(components);
    lastUpdated = DateTime.now();

    if (response == null) {
      return _profile;
    }
    if (_profile == null) {
      _profile = response;
      return _profile;
    }

    if (components.contains(DestinyComponentType.VendorReceipts)) {
      _profile!.vendorReceipts = response.vendorReceipts;
    }
    if (components.contains(DestinyComponentType.ProfileInventories)) {
      _profile!.profileInventory = response.profileInventory;
    }
    if (components.contains(DestinyComponentType.ProfileCurrencies)) {
      _profile!.profileCurrencies = response.profileCurrencies;
    }
    if (components.contains(DestinyComponentType.Profiles)) {
      _profile!.profile = response.profile;
    }
    if (components.contains(DestinyComponentType.Kiosks)) {
      _profile!.profileKiosks = response.profileKiosks;
      _profile!.characterKiosks = response.characterKiosks;
    }
    if (components.contains(DestinyComponentType.ItemPlugStates)) {
      _profile!.profilePlugSets = response.profilePlugSets;
      _profile!.characterPlugSets = response.characterPlugSets;
    }
    if (components.contains(DestinyComponentType.ProfileProgression)) {
      _profile!.profileProgression = response.profileProgression;
    }
    if (components.contains(DestinyComponentType.PresentationNodes)) {
      _profile!.profilePresentationNodes = response.profilePresentationNodes;
      _profile!.characterPresentationNodes =
          response.characterPresentationNodes;
    }
    if (components.contains(DestinyComponentType.ItemPerks)) {
      _profile!.profilePresentationNodes = response.profilePresentationNodes;
      _profile!.characterPresentationNodes =
          response.characterPresentationNodes;
    }
    if (components.contains(DestinyComponentType.Records)) {
      _profile!.profileRecords = response.profileRecords;
      _profile!.characterRecords = response.characterRecords;
    }

    if (components.contains(DestinyComponentType.Metrics)) {
      _profile!.metrics = response.metrics;
    }

    if (components.contains(DestinyComponentType.Collectibles)) {
      _profile!.profileCollectibles = response.profileCollectibles;
      _profile!.characterCollectibles = response.characterCollectibles;
    }
    if (components.contains(DestinyComponentType.Characters)) {
      _profile!.characters = response.characters;
    }
    if (components.contains(DestinyComponentType.CharacterActivities)) {
      _profile!.characterActivities = response.characterActivities;
    }
    if (components.contains(DestinyComponentType.CharacterInventories)) {
      _profile!.characterInventories = response.characterInventories;
    }
    if (components.contains(DestinyComponentType.CharacterProgressions)) {
      _profile!.characterProgressions = response.characterProgressions;
    }
    if (components.contains(DestinyComponentType.CharacterRenderData)) {
      _profile!.characterRenderData = response.characterRenderData;
    }
    if (components.contains(DestinyComponentType.CharacterEquipment)) {
      _profile!.characterEquipment = response.characterEquipment;
    }

    if (components.contains(DestinyComponentType.ItemObjectives)) {
      _profile!.characterUninstancedItemComponents =
          response.characterUninstancedItemComponents;
      _profile!.itemComponents = response.itemComponents;
    }

    if (components.contains(DestinyComponentType.ItemInstances)) {
      _profile!.itemComponents = response.itemComponents;
    }
    if (components.contains(DestinyComponentType.CurrencyLookups)) {
      _profile!.characterCurrencyLookups = response.characterCurrencyLookups;
    }

    return _profile;
  }

  Future<DestinyProfileResponse?> loadProfile() async {
    if (_profile != null) {
      return _profile;
    }
    DestinyProfileResponse? response = await fetchProfileData();
    startAutomaticUpdater();
    _profile = response;
    return response;
  }

  DestinyItemInstanceComponent getInstanceInfo(String instanceId) {
    return _profile!.itemComponents!.instances!.data![instanceId]!;
  }

  DestinyItemTalentGridComponent? getTalentGrid(String instanceId) {
    if (_profile!.itemComponents?.talentGrids?.data?.containsKey(instanceId) ??
        false) {
      return _profile!.itemComponents!.talentGrids!.data![instanceId]!;
    }
    return null;
  }

  List<DestinyItemComponent> getSubclassesForCharacter(String characterId) {
    var character = getCharacterInventory(characterId);
    character.addAll(getCharacterEquipment(characterId));
    return character
        .where((element) =>
            ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition?[element.itemHash]
                ?.equippingBlock
                ?.equipmentSlotTypeHash ==
            3284755031)
        .toSet()
        .toList();
  }

  List<DestinyItemComponent> getItemsForCharacter(
      String characterId, int slotTypeHash) {
    var character = getCharacterInventory(characterId);
    return character
        .where((element) =>
            ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition?[element.itemHash]
                ?.equippingBlock
                ?.equipmentSlotTypeHash ==
            slotTypeHash)
        .toSet()
        .toList();
  }

  DestinyItemComponent getCurrentSubClassForCharacter(String characterId) {
    var character = getCharacterEquipment(characterId);
    return character.firstWhere((element) =>
        ManifestService
            .manifestParsed
            .destinyInventoryItemDefinition?[element.itemHash]
            ?.equippingBlock
            ?.equipmentSlotTypeHash ==
        3284755031);
  }

  int? getCurrentGrenadeHashForCharacter(String characterId) {
    DestinyItemComponent subclass = getCurrentSubClassForCharacter(characterId);

    DestinyItemSocketState? newGrenade =
        getItemSockets(subclass.itemInstanceId!)?.firstWhere((element) =>
            ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition?[element.plugHash]
                ?.plug
                ?.plugCategoryIdentifier
                ?.contains("grenade") ??
            false);
    if (newGrenade != null) {
      return ManifestService.manifestParsed
          .destinyInventoryItemDefinition?[newGrenade.plugHash]?.hash;
    }
    DestinyItemTalentGridComponent? oldSubclass =
        getTalentGrid(subclass.itemInstanceId!);

    DestinyTalentNode? oldGrenade = oldSubclass?.nodes?.firstWhere((element) =>
        element.isActivated == true && element.nodeIndex == 7 ||
        element.nodeIndex == 8 ||
        element.nodeIndex == 9);
    if (oldGrenade != null) {
      return ManifestService
          .manifestParsed
          .destinyTalentGridDefinition?[oldSubclass!.talentGridHash]!
          .nodes?[oldGrenade.nodeIndex!]
          .steps?[0]
          .nodeStepHash;
    }
    return null;
  }

  int? getCurrentMeleeHashForCharacter(String characterId) {
    DestinyItemComponent? subclass =
        getCurrentSubClassForCharacter(characterId);

    DestinyItemSocketState? newMelee = getItemSockets(subclass.itemInstanceId!)
        ?.firstWhere((element) =>
            ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition?[element.plugHash]
                ?.plug
                ?.plugCategoryIdentifier
                ?.contains("melee") ??
            false);
    if (newMelee != null) {
      return ManifestService.manifestParsed
          .destinyInventoryItemDefinition?[newMelee.plugHash]?.hash;
    }
    DestinyItemTalentGridComponent? oldSubclass =
        getTalentGrid(subclass.itemInstanceId!);

    DestinyTalentNode? oldMelee = oldSubclass?.nodes?.firstWhere((element) =>
        element.isActivated == true && element.nodeIndex == 11 ||
        element.nodeIndex == 15 ||
        element.nodeIndex == 21);
    if (oldMelee != null) {
      return ManifestService
          .manifestParsed
          .destinyTalentGridDefinition?[oldSubclass!.talentGridHash]!
          .nodes?[oldMelee.nodeIndex!]
          .steps?[0]
          .nodeStepHash;
    }
    return null;
  }

  int? getCurrentSuperHashForCharacter(String characterId) {
    DestinyItemComponent? subclass =
        getCurrentSubClassForCharacter(characterId);

    DestinyItemSocketState? newSuper = getItemSockets(subclass.itemInstanceId!)
        ?.firstWhere((element) =>
            ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition?[element.plugHash]
                ?.plug
                ?.plugCategoryIdentifier
                ?.contains("super") ??
            false);

    if (newSuper != null) {
      return ManifestService.manifestParsed
          .destinyInventoryItemDefinition?[newSuper.plugHash]?.hash;
    }
    DestinyItemTalentGridComponent? oldSubclass =
        getTalentGrid(subclass.itemInstanceId!);

    DestinyTalentNode? oldSuper = oldSubclass?.nodes?.firstWhere((element) =>
        element.isActivated == true && element.nodeIndex == 10 ||
        element.nodeIndex == 20);
    if (oldSuper != null) {
      return ManifestService
          .manifestParsed
          .destinyTalentGridDefinition?[oldSubclass!.talentGridHash]!
          .nodes?[oldSuper.nodeIndex!]
          .steps?[0]
          .nodeStepHash;
    }
    return null;
  }

  Map<String, DestinyItemSocketsComponent> getAllSockets() {
    return _profile!.itemComponents!.sockets!.data!;
  }

  List<DestinyItemSocketState>? getItemSockets(String itemInstanceId) {
    try {
      return _profile!.itemComponents!.sockets!.data![itemInstanceId]?.sockets;
    } catch (e) {
      rethrow;
    }
  }

  Map<String, List<DestinyItemPlugBase>>? getItemReusablePlugs(
      String itemInstanceId) {
    try {
      return _profile!
          .itemComponents?.reusablePlugs?.data?[itemInstanceId]?.plugs;
    } catch (e) {
      rethrow;
    }
  }

  Map<String, List<DestinyObjectiveProgress>>? getPlugObjectives(
      String itemInstanceId) {
    try {
      return _profile!.itemComponents?.plugObjectives?.data![itemInstanceId]
          ?.objectivesPerPlug;
    } catch (e) {
      rethrow;
    }
  }

  String getDropLocation(int hash) {
    return ManifestService
            .manifestParsed.destinyCollectibleDefinition![hash]?.sourceString ??
        "Source inconnu";
  }

  List<List<DestinyInventoryItemDefinition>> getItemPerksAsItemDef(
      Map<String, List<DestinyItemPlugBase>>? plugs,
      List<DestinyItemSocketState>? sockets) {
    List<List<DestinyInventoryItemDefinition>> perks = [];
    for (DestinyItemSocketState socket in sockets!) {
      if (plugs != null) {
        for (List<DestinyItemPlugBase> plug in plugs.values) {
          if (plug.any((element) => element.plugItemHash == socket.plugHash) &&
              DestinyData.perkCategoryHash.contains(ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition?[socket.plugHash]!
                  .plug!
                  .plugCategoryHash!)) {
            List<DestinyInventoryItemDefinition> plugDefitions = [];
            for (DestinyItemPlugBase plug in plug) {
              plugDefitions.add(ManifestService.manifestParsed
                  .destinyInventoryItemDefinition![plug.plugItemHash]!);
            }
            perks.add(plugDefitions);
          }
        }
      }
      if (ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition?[socket.plugHash]
                  ?.displayProperties
                  ?.icon !=
              null &&
          DestinyData.perkCategoryHash.contains(ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition?[socket.plugHash]!
              .plug!
              .plugCategoryHash!) &&
          !perks.any((element) => element.contains(ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition![socket.plugHash]!))) {
        perks.add([
          ManifestService
              .manifestParsed.destinyInventoryItemDefinition![socket.plugHash]!
        ]);
      }
    }
    return perks;
  }

  Map<String, DestinyStat>? getPrecalculatedStats(String itemInstanceId) {
    if (_profile!.itemComponents?.stats?.data?.containsKey(itemInstanceId) ??
        false) {
      return _profile!.itemComponents?.stats?.data![itemInstanceId]?.stats;
    }
    return null;
  }

  List<DestinyObjectiveProgress>? getItemObjectives(
      String itemInstanceId, String characterId, int hash) {
    try {
      var objectives = _profile!
          .itemComponents!.objectives?.data?[itemInstanceId]?.objectives;
      if (objectives != null) return objectives;
    } catch (e) {
      rethrow;
    }
    try {
      var objectives = _profile!.characterProgressions?.data?[characterId]
          ?.uninstancedItemObjectives?["$hash"];
      return objectives;
    } catch (e) {
      rethrow;
    }
  }

  Map<String, DestinyPresentationNodeComponent>? getProfilePresentationNodes() {
    return _profile!.profilePresentationNodes?.data?.nodes;
  }

  List<DestinyItemPlug>? getCharacterPlugSets(
      String characterId, int plugSetHash) {
    var plugs = _profile!.characterPlugSets?.data?[characterId]?.plugs;
    if (plugs?.containsKey("$plugSetHash") ?? false) {
      return plugs?["$plugSetHash"];
    }
    return null;
  }

  List<DestinyItemPlug>? getProfilePlugSets(int plugSetHash) {
    var plugs = _profile!.profilePlugSets?.data?.plugs;
    if (plugs?.containsKey("$plugSetHash") ?? false) {
      return plugs?["$plugSetHash"];
    }
    return null;
  }

  List<DestinyItemPlug> getPlugSets(int plugSetHash) {
    List<DestinyItemPlug> plugs = [];
    plugs.addAll(getProfilePlugSets(plugSetHash) ?? []);
    var characters = getCharacters();
    for (var c in characters) {
      plugs.addAll(getCharacterPlugSets(c.characterId!, plugSetHash) ?? []);
    }
    return plugs;
  }

  Map<String, DestinyPresentationNodeComponent>? getCharacterPresentationNodes(
      String characterId) {
    if (_profile!.characterPresentationNodes?.data == null) return null;
    return _profile!.characterPresentationNodes?.data?[characterId]?.nodes;
  }

  List<DestinyCharacterComponent> getCharacters() {
    if (_profile == null) return [];
    List<DestinyCharacterComponent> list =
        _profile!.characters!.data!.values.toList();

    list.sort((charA, charB) {
      DateTime dateA = DateTime.parse(charA.dateLastPlayed!);
      DateTime dateB = DateTime.parse(charB.dateLastPlayed!);
      return dateB.compareTo(dateA);
    });
    return list;
  }

  String getCharacterIdByClass(DestinyClass classType) {
    DestinyCharacterComponent character = _profile!.characters!.data!.values
        .toList()
        .firstWhere((element) => element.classType == classType);
    return character.characterId!;
  }

  DestinyCharacterComponent? getCharacter(String characterId) {
    return _profile!.characters?.data![characterId];
  }

  Iterable<DestinyItemComponent> getArmors(String charcterId) {
    return _profile!.characterEquipment!.data![charcterId]!.items!.where(
        (element) =>
            ManifestService.manifestParsed
                .destinyInventoryItemDefinition![element.itemHash]!.itemType ==
            DestinyItemType.Armor);
  }

  DestinyCharacterActivitiesComponent? getCharacterActivities(
      String characterId) {
    return _profile!.characterActivities?.data![characterId];
  }

  List<DestinyItemComponent> getCharacterEquipment(String characterId) {
    if (_profile!.characterEquipment?.data == null) return [];
    return _profile!.characterEquipment?.data?[characterId]?.items ?? [];
  }

  List<DestinyItemComponent> getCharacterInventory(String characterId) {
    if (_profile!.characterInventories?.data == null) return [];
    return _profile!.characterInventories?.data?[characterId]?.items ?? [];
  }

  List<DestinyItemComponent> getProfileInventory() {
    return _profile!.profileInventory?.data?.items ?? [];
  }

  List<DestinyItemComponent> getProfileCurrencies() {
    return _profile!.profileCurrencies!.data!.items!;
  }

  DestinyCharacterProgressionComponent getCharacterProgression(
      String characterId) {
    return _profile!.characterProgressions!.data![characterId]!;
  }

  Map<String, DestinyCollectibleComponent> getProfileCollectibles() {
    return _profile!.profileCollectibles!.data!.collectibles!;
  }

  Map<String, DestinyCollectibleComponent> getCharacterCollectibles(
      String characterId) {
    return _profile!.characterCollectibles!.data![characterId]!.collectibles!;
  }

  bool isCollectibleUnlocked(int hash, DestinyScope scope) {
    String hashStr = "$hash";
    Map<String, DestinyCollectibleComponent>? collectibles =
        _profile?.profileCollectibles?.data?.collectibles;
    if (collectibles == null) {
      return true;
    }
    if (scope == DestinyScope.Profile) {
      DestinyCollectibleComponent? collectible =
          _profile!.profileCollectibles?.data?.collectibles![hashStr];
      if (collectible != null) {
        return !(collectible.state ?? DestinyCollectibleState.NotAcquired)
            .contains(DestinyCollectibleState.NotAcquired);
      }
    }

    return _profile!.characterCollectibles?.data?.values.any((data) {
          DestinyCollectibleState state = data.collectibles?[hashStr]?.state ??
              DestinyCollectibleState.NotAcquired;
          return !state.contains(DestinyCollectibleState.NotAcquired);
        }) ??
        false;
  }

  DestinyRecordComponent? getRecord(int hash, DestinyScope scope) {
    String hashStr = "$hash";
    if (scope == DestinyScope.Profile) {
      if (_profile!.profileRecords?.data == null) {
        return null;
      }
      return _profile!.profileRecords!.data!.records![hashStr];
    }
    var charRecords = _profile!.characterRecords?.data;
    if (charRecords == null) {
      return null;
    }
    for (var char in charRecords.values) {
      if (char.records!.containsKey(hashStr)) {
        return char.records![hashStr];
      }
    }
    return null;
  }

  DestinyMetricComponent? getMetric(int hash) {
    String hashStr = "$hash";
    if (_profile!.metrics?.data?.metrics?.containsKey(hashStr) != true) {
      return null;
    }
    return _profile?.metrics?.data?.metrics?[hashStr];
  }

  List<DestinyItemComponent> getItemsByInstanceId(List<String?> ids) {
    ids = ids.where((id) => id != null).toList();
    List<DestinyItemComponent> items = [];
    List<DestinyItemComponent> profileInventory =
        _profile!.profileInventory!.data!.items!;
    items.addAll(
        profileInventory.where((item) => ids.contains(item.itemInstanceId)));
    _profile!.characterEquipment!.data!.forEach((id, equipment) {
      items.addAll(
          equipment.items!.where((item) => ids.contains(item.itemInstanceId)));
    });
    _profile!.characterInventories!.data!.forEach((id, equipment) {
      items.addAll(
          equipment.items!.where((item) => ids.contains(item.itemInstanceId)));
    });
    return items;
  }

  String getItemOwner(String itemInstanceId) {
    String? owner;
    _profile!.characterEquipment!.data!.forEach((charId, inventory) {
      bool has =
          inventory.items!.any((item) => item.itemInstanceId == itemInstanceId);
      if (has) {
        owner = charId;
      }
    });
    if (owner != null) return owner!;
    _profile!.characterInventories!.data!.forEach((charId, inventory) {
      bool has =
          inventory.items!.any((item) => item.itemInstanceId == itemInstanceId);
      if (has) {
        owner = charId;
      }
    });
    return owner!;
  }

  DestinyArtifactProfileScoped getArtifactProgression() {
    return _profile!.profileProgression!.data!.seasonalArtifact!;
  }

  List<DestinyItemComponent> getAllItems() {
    List<DestinyItemComponent> allItems = [];
    Iterable<String>? charIds =
        getCharacters().map((char) => char.characterId!);
    for (var charId in charIds) {
      allItems.addAll(getCharacterEquipment(charId).map((item) => item));
      allItems.addAll(getCharacterInventory(charId).map((item) => item));
    }
    allItems.addAll(getProfileInventory().map((item) => item));
    return allItems;
  }

  List<DestinyItemComponent> getAllArmorForClass(DestinyClass classType,
      {DestinyItemSubType? itemSubType}) {
    List<DestinyItemComponent> allItems = [];
    Iterable<String>? charIds =
        getCharacters().map((char) => char.characterId!);
    for (var charId in charIds) {
      allItems.addAll(getCharacterEquipment(charId)
          .where((element) =>
              ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition?[element.itemHash]
                      ?.classType ==
                  classType &&
              ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition?[element.itemHash]
                      ?.itemType ==
                  DestinyItemType.Armor &&
              (itemSubType == null ||
                  ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition?[element.itemHash]
                          ?.itemSubType ==
                      itemSubType))
          .map((item) => item));
      allItems.addAll(getCharacterInventory(charId)
          .where((element) =>
              ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition?[element.itemHash]
                      ?.classType ==
                  classType &&
              ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition?[element.itemHash]
                      ?.itemType ==
                  DestinyItemType.Armor &&
              (itemSubType == null ||
                  ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition?[element.itemHash]
                          ?.itemSubType ==
                      itemSubType))
          .map((item) => item));
    }
    allItems.addAll(getProfileInventory()
        .where((element) =>
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.itemHash]
                    ?.classType ==
                classType &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition?[element.itemHash]
                    ?.itemType ==
                DestinyItemType.Armor &&
            (itemSubType == null ||
                ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition?[element.itemHash]
                        ?.itemSubType ==
                    itemSubType))
        .map((item) => item));

    return allItems;
  }
}

// Future<SubclassTalentGridInfo> getSubclassTalentGridInfo(
//     DestinyItemComponent item) async {
//   var def = ManifestService
//       .manifestParsed.destinyInventoryItemDefinition![item.itemHash];
//   var talentGrid = ProfileService().getTalentGrid(item.itemInstanceId!);
//   var talentGridDef = ManifestService
//       .manifestParsed.destinyTalentGridDefinition![talentGrid!.talentGridHash];
//   var talentgridCategory =
//       extractTalentGridNodeCategory(talentGridDef!, talentGrid);
//   var mainPerk = getSubclassMainPerk(def!, talentgridCategory);

//   // return SubclassTalentGridInfo(
//   //   mainPerkHash: mainPerk,
//   //   damageType: def.talentGrid!.hudDamageType!,
//   // );
// }

// int getSubclassMainPerk(DestinyInventoryItemDefinition def,
//     DestinyTalentNodeCategory talentgridCategory) {
//   var str = "";

//   switch (def.classType) {
//     case DestinyClass.Titan:
//       str += "titan";
//       break;
//     case DestinyClass.Hunter:
//       str += "hunter";
//       break;
//     case DestinyClass.Warlock:
//       str += "warlock";
//       break;
//     default:
//       break;
//   }
//   switch (def?.talentGrid?.hudDamageType) {
//     case DamageType.Arc:
//       str += "_arc";
//       break;
//     case DamageType.Thermal:
//       str += "_solar";
//       break;
//     case DamageType.Void:
//       str += "_void";
//       break;
//     case DamageType.Stasis:
//       str += "_stasis";
//       break;
//     default:
//       break;
//   }
//   if ((talentgridCategory.identifier?.length ?? 0) > 0) {
//     str += "_${talentgridCategory.identifier}";
//   }

//   return subclassMainPerks[str]!;
// }

// DestinyTalentNodeCategory extractTalentGridNodeCategory(
//     DestinyTalentGridDefinition talentGridDef,
//     DestinyItemTalentGridComponent talentGrid) {
//   Iterable<int> activatedNodes = talentGrid?.nodes
//       ?.where((node) => node.isActivated)
//       ?.map((node) => node.nodeIndex);
//   Iterable<DestinyTalentNodeCategory> selectedSkills =
//       talentGridDef?.nodeCategories?.where((category) {
//     var overlapping = category.nodeHashes
//         .where((nodeHash) => activatedNodes?.contains(nodeHash) ?? false);
//     return overlapping.length > 0;
//   })?.toList();
//   DestinyTalentNodeCategory subclassPath = selectedSkills
//       ?.firstWhere((nodeDef) => nodeDef.isLoreDriven, orElse: () => null);
//   return subclassPath;
// }
