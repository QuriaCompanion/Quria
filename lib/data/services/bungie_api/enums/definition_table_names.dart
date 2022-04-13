import 'package:bungie_api/models/destiny_activity_definition.dart';
import 'package:bungie_api/models/destiny_activity_graph_definition.dart';
import 'package:bungie_api/models/destiny_activity_mode_definition.dart';
import 'package:bungie_api/models/destiny_activity_modifier_definition.dart';
import 'package:bungie_api/models/destiny_activity_type_definition.dart';
import 'package:bungie_api/models/destiny_artifact_definition.dart';
import 'package:bungie_api/models/destiny_breaker_type_definition.dart';
import 'package:bungie_api/models/destiny_checklist_definition.dart';
import 'package:bungie_api/models/destiny_destination_definition.dart';
import 'package:bungie_api/models/destiny_faction_definition.dart';
import 'package:bungie_api/models/destiny_gender_definition.dart';
import 'package:bungie_api/models/destiny_historical_stats_definition.dart';
import 'package:bungie_api/models/destiny_inventory_bucket_definition.dart';
import 'package:bungie_api/models/destiny_item_category_definition.dart';
import 'package:bungie_api/models/destiny_item_tier_type_definition.dart';
import 'package:bungie_api/models/destiny_location_definition.dart';
import 'package:bungie_api/models/destiny_lore_definition.dart';
import 'package:bungie_api/models/destiny_material_requirement_set_definition.dart';
import 'package:bungie_api/models/destiny_metric_definition.dart';
import 'package:bungie_api/models/destiny_milestone_definition.dart';
import 'package:bungie_api/models/destiny_milestone_reward_entry_definition.dart';
import 'package:bungie_api/models/destiny_objective_definition.dart';
import 'package:bungie_api/models/destiny_place_definition.dart';
import 'package:bungie_api/models/destiny_power_cap_definition.dart';
import 'package:bungie_api/models/destiny_progression_definition.dart';
import 'package:bungie_api/models/destiny_progression_level_requirement_definition.dart';
import 'package:bungie_api/models/destiny_progression_mapping_definition.dart';
import 'package:bungie_api/models/destiny_race_definition.dart';
import 'package:bungie_api/models/destiny_record_definition.dart';
import 'package:bungie_api/models/destiny_report_reason_category_definition.dart';
import 'package:bungie_api/models/destiny_reward_source_definition.dart';
import 'package:bungie_api/models/destiny_season_definition.dart';
import 'package:bungie_api/models/destiny_season_pass_definition.dart';
import 'package:bungie_api/models/destiny_socket_category_definition.dart';
import 'package:bungie_api/models/destiny_socket_type_definition.dart';
import 'package:bungie_api/models/destiny_stat_group_definition.dart';
import 'package:bungie_api/models/destiny_trait_category_definition.dart';
import 'package:bungie_api/models/destiny_trait_definition.dart';
import 'package:bungie_api/models/destiny_unlock_definition.dart';
import 'package:bungie_api/models/destiny_unlock_value_definition.dart';
import 'package:bungie_api/models/destiny_vendor_definition.dart';
import 'package:bungie_api/models/destiny_vendor_group_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_energy_type_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_sandbox_perk_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_stat_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_talent_grid_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_collectible_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_presentation_node_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_equipment_slot_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_plug_set_definition.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_class_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_damage_type_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';

@JsonSerializable()
class DefinitionTableNames {
  @JsonKey(name: 'DestinyPlaceDefinition')
  List<DestinyPlaceDefinition>? destinyPlaceDefinition;
  @JsonKey(name: 'DestinyActivityDefinition')
  List<DestinyActivityDefinition>? destinyActivityDefinition;
  @JsonKey(name: 'DestinyActivityTypeDefinition')
  List<DestinyActivityTypeDefinition>? destinyActivityTypeDefinition;
  @JsonKey(name: 'DestinyClassDefinition')
  List<DestinyClassDefinition>? destinyClassDefinition;
  @JsonKey(name: 'DestinyGenderDefinition')
  List<DestinyGenderDefinition>? destinyGenderDefinition;
  @JsonKey(name: 'DestinyInventoryBucketDefinition')
  List<DestinyInventoryBucketDefinition>? destinyInventoryBucketDefinition;
  @JsonKey(name: 'DestinyRaceDefinition')
  List<DestinyRaceDefinition>? destinyRaceDefinition;
  @JsonKey(name: 'DestinyTalentGridDefinition')
  List<DestinyTalentGridDefinition>? destinyTalentGridDefinition;
  @JsonKey(name: 'DestinyUnlockDefinition')
  List<DestinyUnlockDefinition>? destinyUnlockDefinition;
  @JsonKey(name: 'DestinyMaterialRequirementSetDefinition')
  List<DestinyMaterialRequirementSetDefinition>?
      destinyMaterialRequirementSetDefinition;
  @JsonKey(name: 'DestinySandboxPerkDefinition')
  List<DestinySandboxPerkDefinition>? destinySandboxPerkDefinition;
  @JsonKey(name: 'DestinyStatGroupDefinition')
  List<DestinyStatGroupDefinition>? destinyStatGroupDefinition;
  @JsonKey(name: 'DestinyProgressionMappingDefinition')
  List<DestinyProgressionMappingDefinition>?
      destinyProgressionMappingDefinition;
  @JsonKey(name: 'DestinyFactionDefinition')
  List<DestinyFactionDefinition>? destinyFactionDefinition;
  @JsonKey(name: 'DestinyVendorGroupDefinition')
  List<DestinyVendorGroupDefinition>? destinyVendorGroupDefinition;
  @JsonKey(name: 'DestinyRewardSourceDefinition')
  List<DestinyRewardSourceDefinition>? destinyRewardSourceDefinition;
  @JsonKey(name: 'DestinyUnlockValueDefinition')
  List<DestinyUnlockValueDefinition>? destinyUnlockValueDefinition;
  @JsonKey(name: 'DestinyItemCategoryDefinition')
  List<DestinyItemCategoryDefinition>? destinyItemCategoryDefinition;
  @JsonKey(name: 'DestinyDamageTypeDefinition')
  List<DestinyDamageTypeDefinition>? destinyDamageTypeDefinition;
  @JsonKey(name: 'DestinyActivityModeDefinition')
  List<DestinyActivityModeDefinition>? destinyActivityModeDefinition;
  @JsonKey(name: 'DestinyActivityGraphDefinition')
  List<DestinyActivityGraphDefinition>? destinyActivityGraphDefinition;
  @JsonKey(name: 'DestinyCollectibleDefinition')
  List<DestinyCollectibleDefinition>? destinyCollectibleDefinition;
  @JsonKey(name: 'DestinyDestinationDefinition')
  List<DestinyDestinationDefinition>? destinyDestinationDefinition;
  @JsonKey(name: 'DestinyEquipmentSlotDefinition')
  List<DestinyEquipmentSlotDefinition>? destinyEquipmentSlotDefinition;
  @JsonKey(name: 'DestinyStatDefinition')
  List<DestinyStatDefinition>? destinyStatDefinition;
  @JsonKey(name: 'DestinyInventoryItemDefinition')
  List<DestinyInventoryItemDefinition>? destinyInventoryItemDefinition;
  @JsonKey(name: 'DestinyItemTierTypeDefinition')
  List<DestinyItemTierTypeDefinition>? destinyItemTierTypeDefinition;
  @JsonKey(name: 'DestinyLocationDefinition')
  List<DestinyLocationDefinition>? destinyLocationDefinition;
  @JsonKey(name: 'DestinyLoreDefinition')
  List<DestinyLoreDefinition>? destinyLoreDefinition;
  @JsonKey(name: 'DestinyMetricDefinition')
  List<DestinyMetricDefinition>? destinyMetricDefinition;
  @JsonKey(name: 'DestinyObjectiveDefinition')
  List<DestinyObjectiveDefinition>? destinyObjectiveDefinition;
  @JsonKey(name: 'DestinyPlugSetDefinition')
  List<DestinyPlugSetDefinition>? destinyPlugSetDefinition;
  @JsonKey(name: 'DestinyPowerCapDefinition')
  List<DestinyPowerCapDefinition>? destinyPowerCapDefinition;
  @JsonKey(name: 'DestinyPresentationNodeDefinition')
  List<DestinyPresentationNodeDefinition>? destinyPresentationNodeDefinition;
  @JsonKey(name: 'DestinyProgressionDefinition')
  List<DestinyProgressionDefinition>? destinyProgressionDefinition;
  @JsonKey(name: 'DestinyProgressionLevelRequirementDefinition')
  List<DestinyProgressionLevelRequirementDefinition>?
      destinyProgressionLevelRequirementDefinition;
  @JsonKey(name: 'DestinyRecordDefinition')
  List<DestinyRecordDefinition>? destinyRecordDefinition;
  @JsonKey(name: 'DestinySeasonDefinition')
  List<DestinySeasonDefinition>? destinySeasonDefinition;
  @JsonKey(name: 'DestinySeasonPassDefinition')
  List<DestinySeasonPassDefinition>? destinySeasonPassDefinition;
  @JsonKey(name: 'DestinySocketCategoryDefinition')
  List<DestinySocketCategoryDefinition>? destinySocketCategoryDefinition;
  @JsonKey(name: 'DestinySocketTypeDefinition')
  List<DestinySocketTypeDefinition>? destinySocketTypeDefinition;
  @JsonKey(name: 'DestinyTraitDefinition')
  List<DestinyTraitDefinition>? destinyTraitDefinition;
  @JsonKey(name: 'DestinyTraitCategoryDefinition')
  List<DestinyTraitCategoryDefinition>? destinyTraitCategoryDefinition;
  @JsonKey(name: 'DestinyVendorDefinition')
  List<DestinyVendorDefinition>? destinyVendorDefinition;
  @JsonKey(name: 'DestinyMilestoneDefinition')
  List<DestinyMilestoneDefinition>? destinyMilestoneDefinition;
  @JsonKey(name: 'DestinyActivityModifierDefinition')
  List<DestinyActivityModifierDefinition>? destinyActivityModifierDefinition;
  @JsonKey(name: 'DestinyReportReasonCategoryDefinition')
  List<DestinyReportReasonCategoryDefinition>?
      destinyReportReasonCategoryDefinition;
  @JsonKey(name: 'DestinyArtifactDefinition')
  List<DestinyArtifactDefinition>? destinyArtifactDefinition;
  @JsonKey(name: 'DestinyBreakerTypeDefinition')
  List<DestinyBreakerTypeDefinition>? destinyBreakerTypeDefinition;
  @JsonKey(name: 'DestinyChecklistDefinition')
  List<DestinyChecklistDefinition>? destinyChecklistDefinition;
  @JsonKey(name: 'DestinyHistoricalStatsDefinition')
  List<DestinyHistoricalStatsDefinition>? destinyHistoricalStatsDefinition;
  @JsonKey(name: 'DestinyMilestoneRewardEntryDefinition')
  List<DestinyMilestoneRewardEntryDefinition>?
      destinyMilestoneRewardEntryDefinition;
  @JsonKey(name: 'DestinyEnergyTypeDefinition')
  List<DestinyEnergyTypeDefinition>? destinyEnergyTypeDefinition;

  static setValue<T>(List<T> manifestValue) {
    switch (T) {
      case DestinyPlaceDefinition:
        return ManifestService.manifestList.destinyPlaceDefinition =
            manifestValue as List<DestinyPlaceDefinition>?;
      case DestinyActivityDefinition:
        return ManifestService.manifestList.destinyActivityDefinition =
            manifestValue as List<DestinyActivityDefinition>?;
      case DestinyActivityTypeDefinition:
        return ManifestService.manifestList.destinyActivityTypeDefinition =
            manifestValue as List<DestinyActivityTypeDefinition>?;
      case DestinyClassDefinition:
        return ManifestService.manifestList.destinyClassDefinition =
            manifestValue as List<DestinyClassDefinition>?;
      case DestinyGenderDefinition:
        return ManifestService.manifestList.destinyGenderDefinition =
            manifestValue as List<DestinyGenderDefinition>?;
      case DestinyInventoryBucketDefinition:
        return ManifestService.manifestList.destinyInventoryBucketDefinition =
            manifestValue as List<DestinyInventoryBucketDefinition>?;
      case DestinyRaceDefinition:
        return ManifestService.manifestList.destinyRaceDefinition =
            manifestValue as List<DestinyRaceDefinition>?;
      case DestinyTalentGridDefinition:
        return ManifestService.manifestList.destinyTalentGridDefinition =
            manifestValue as List<DestinyTalentGridDefinition>?;
      case DestinyUnlockDefinition:
        return ManifestService.manifestList.destinyUnlockDefinition =
            manifestValue as List<DestinyUnlockDefinition>?;
      case DestinyMaterialRequirementSetDefinition:
        return ManifestService
                .manifestList.destinyMaterialRequirementSetDefinition =
            manifestValue as List<DestinyMaterialRequirementSetDefinition>?;
      case DestinySandboxPerkDefinition:
        return ManifestService.manifestList.destinySandboxPerkDefinition =
            manifestValue as List<DestinySandboxPerkDefinition>?;
      case DestinyStatGroupDefinition:
        return ManifestService.manifestList.destinyStatGroupDefinition =
            manifestValue as List<DestinyStatGroupDefinition>?;
      case DestinyFactionDefinition:
        return ManifestService.manifestList.destinyFactionDefinition =
            manifestValue as List<DestinyFactionDefinition>?;
      case DestinyVendorGroupDefinition:
        return ManifestService.manifestList.destinyVendorGroupDefinition =
            manifestValue as List<DestinyVendorGroupDefinition>?;
      case DestinyRewardSourceDefinition:
        return ManifestService.manifestList.destinyRewardSourceDefinition =
            manifestValue as List<DestinyRewardSourceDefinition>?;
      case DestinyItemCategoryDefinition:
        return ManifestService.manifestList.destinyItemCategoryDefinition =
            manifestValue as List<DestinyItemCategoryDefinition>?;
      case DestinyDamageTypeDefinition:
        return ManifestService.manifestList.destinyDamageTypeDefinition =
            manifestValue as List<DestinyDamageTypeDefinition>?;
      case DestinyActivityModeDefinition:
        return ManifestService.manifestList.destinyActivityModeDefinition =
            manifestValue as List<DestinyActivityModeDefinition>?;
      case DestinyActivityGraphDefinition:
        return ManifestService.manifestList.destinyActivityGraphDefinition =
            manifestValue as List<DestinyActivityGraphDefinition>?;
      case DestinyCollectibleDefinition:
        return ManifestService.manifestList.destinyCollectibleDefinition =
            manifestValue as List<DestinyCollectibleDefinition>?;
      case DestinyStatDefinition:
        return ManifestService.manifestList.destinyStatDefinition =
            manifestValue as List<DestinyStatDefinition>?;
      case DestinyItemTierTypeDefinition:
        return ManifestService.manifestList.destinyItemTierTypeDefinition =
            manifestValue as List<DestinyItemTierTypeDefinition>?;
      case DestinyPresentationNodeDefinition:
        return ManifestService.manifestList.destinyPresentationNodeDefinition =
            manifestValue as List<DestinyPresentationNodeDefinition>?;
      case DestinyRecordDefinition:
        return ManifestService.manifestList.destinyRecordDefinition =
            manifestValue as List<DestinyRecordDefinition>?;
      case DestinyDestinationDefinition:
        return ManifestService.manifestList.destinyDestinationDefinition =
            manifestValue as List<DestinyDestinationDefinition>?;
      case DestinyEquipmentSlotDefinition:
        return ManifestService.manifestList.destinyEquipmentSlotDefinition =
            manifestValue as List<DestinyEquipmentSlotDefinition>?;
      case DestinyInventoryItemDefinition:
        return ManifestService.manifestList.destinyInventoryItemDefinition =
            manifestValue as List<DestinyInventoryItemDefinition>?;
      case DestinyLocationDefinition:
        return ManifestService.manifestList.destinyLocationDefinition =
            manifestValue as List<DestinyLocationDefinition>?;
      case DestinyLoreDefinition:
        return ManifestService.manifestList.destinyLoreDefinition =
            manifestValue as List<DestinyLoreDefinition>?;
      case DestinyObjectiveDefinition:
        return ManifestService.manifestList.destinyObjectiveDefinition =
            manifestValue as List<DestinyObjectiveDefinition>?;
      case DestinyProgressionDefinition:
        return ManifestService.manifestList.destinyProgressionDefinition =
            manifestValue as List<DestinyProgressionDefinition>?;
      case DestinyProgressionLevelRequirementDefinition:
        return ManifestService
                .manifestList.destinyProgressionLevelRequirementDefinition =
            manifestValue
                as List<DestinyProgressionLevelRequirementDefinition>?;
      case DestinySocketCategoryDefinition:
        return ManifestService.manifestList.destinySocketCategoryDefinition =
            manifestValue as List<DestinySocketCategoryDefinition>?;
      case DestinySocketTypeDefinition:
        return ManifestService.manifestList.destinySocketTypeDefinition =
            manifestValue as List<DestinySocketTypeDefinition>?;
      case DestinyVendorDefinition:
        return ManifestService.manifestList.destinyVendorDefinition =
            manifestValue as List<DestinyVendorDefinition>?;
      case DestinyMilestoneDefinition:
        return ManifestService.manifestList.destinyMilestoneDefinition =
            manifestValue as List<DestinyMilestoneDefinition>?;
      case DestinyActivityModifierDefinition:
        return ManifestService.manifestList.destinyActivityModifierDefinition =
            manifestValue as List<DestinyActivityModifierDefinition>?;
      case DestinyReportReasonCategoryDefinition:
        return ManifestService
                .manifestList.destinyReportReasonCategoryDefinition =
            manifestValue as List<DestinyReportReasonCategoryDefinition>?;
      case DestinyPlugSetDefinition:
        return ManifestService.manifestList.destinyPlugSetDefinition =
            manifestValue as List<DestinyPlugSetDefinition>?;
      case DestinyChecklistDefinition:
        return ManifestService.manifestList.destinyChecklistDefinition =
            manifestValue as List<DestinyChecklistDefinition>?;
      case DestinyHistoricalStatsDefinition:
        return ManifestService.manifestList.destinyHistoricalStatsDefinition =
            manifestValue as List<DestinyHistoricalStatsDefinition>?;
      case DestinyMilestoneRewardEntryDefinition:
        return ManifestService
                .manifestList.destinyMilestoneRewardEntryDefinition =
            manifestValue as List<DestinyMilestoneRewardEntryDefinition>?;
      case DestinyEnergyTypeDefinition:
        return ManifestService.manifestList.destinyEnergyTypeDefinition =
            manifestValue as List<DestinyEnergyTypeDefinition>?;
      case DestinySeasonDefinition:
        return ManifestService.manifestList.destinySeasonDefinition =
            manifestValue as List<DestinySeasonDefinition>?;
      case DestinySeasonPassDefinition:
        return ManifestService.manifestList.destinySeasonPassDefinition =
            manifestValue as List<DestinySeasonPassDefinition>?;
      case DestinyPowerCapDefinition:
        return ManifestService.manifestList.destinyPowerCapDefinition =
            manifestValue as List<DestinyPowerCapDefinition>?;
      case DestinyMetricDefinition:
        return ManifestService.manifestList.destinyMetricDefinition =
            manifestValue as List<DestinyMetricDefinition>?;
      case DestinyTraitDefinition:
        return ManifestService.manifestList.destinyTraitDefinition =
            manifestValue as List<DestinyTraitDefinition>?;
      default:
        throw Exception('Unknown type');
    }
  }

  static Map<Type, Function> getDefinitions = {
    DestinyClassDefinition: (ids) async =>
        await StorageService.isar.destinyClassDefinitions.getAll(ids),
    DestinyInventoryItemDefinition: (ids) async =>
        await StorageService.isar.destinyInventoryItemDefinitions.getAll(ids),
    DestinyDamageTypeDefinition: (ids) async =>
        await StorageService.isar.destinyDamageTypeDefinitions.getAll(ids),
    DestinyStatDefinition: (ids) async =>
        await StorageService.isar.destinyStatDefinitions.getAll(ids),
    DestinyTalentGridDefinition: (ids) async =>
        await StorageService.isar.destinyTalentGridDefinitions.getAll(ids),
    DestinySandboxPerkDefinition: (ids) async =>
        await StorageService.isar.destinySandboxPerkDefinitions.getAll(ids),
    DestinyEnergyTypeDefinition: (ids) async =>
        await StorageService.isar.destinyEnergyTypeDefinitions.getAll(ids),
    DestinyEquipmentSlotDefinition: (ids) async =>
        await StorageService.isar.destinyEquipmentSlotDefinitions.getAll(ids),
    DestinyPresentationNodeDefinition: (ids) async => await StorageService
        .isar.destinyPresentationNodeDefinitions
        .getAll(ids),
    DestinyCollectibleDefinition: (ids) async =>
        await StorageService.isar.destinyCollectibleDefinitions.getAll(ids),
    DestinyPlugSetDefinition: (ids) async =>
        await StorageService.isar.destinyPlugSetDefinitions.getAll(ids),
  };

  static Map<Type, Function> identities = {
    DestinyPlaceDefinition: (json) => DestinyPlaceDefinition.fromJson(json),
    DestinyActivityDefinition: (json) =>
        DestinyActivityDefinition.fromJson(json),
    DestinyActivityTypeDefinition: (json) =>
        DestinyActivityTypeDefinition.fromJson(json),
    DestinyClassDefinition: (json) => DestinyClassDefinition.fromJson(json),
    DestinyGenderDefinition: (json) => DestinyGenderDefinition.fromJson(json),
    DestinyInventoryBucketDefinition: (json) =>
        DestinyInventoryBucketDefinition.fromJson(json),
    DestinyRaceDefinition: (json) => DestinyRaceDefinition.fromJson(json),
    DestinyTalentGridDefinition: (json) =>
        DestinyTalentGridDefinition.fromJson(json),
    DestinyUnlockDefinition: (json) => DestinyUnlockDefinition.fromJson(json),
    DestinyMaterialRequirementSetDefinition: (json) =>
        DestinyMaterialRequirementSetDefinition.fromJson(json),
    DestinySandboxPerkDefinition: (json) =>
        DestinySandboxPerkDefinition.fromJson(json),
    DestinyStatGroupDefinition: (json) =>
        DestinyStatGroupDefinition.fromJson(json),
    DestinyFactionDefinition: (json) => DestinyFactionDefinition.fromJson(json),
    DestinyVendorGroupDefinition: (json) =>
        DestinyVendorGroupDefinition.fromJson(json),
    DestinyRewardSourceDefinition: (json) =>
        DestinyRewardSourceDefinition.fromJson(json),
    DestinyItemCategoryDefinition: (json) =>
        DestinyItemCategoryDefinition.fromJson(json),
    DestinyDamageTypeDefinition: (json) =>
        DestinyDamageTypeDefinition.fromJson(json),
    DestinyActivityModeDefinition: (json) =>
        DestinyActivityModeDefinition.fromJson(json),
    DestinyActivityGraphDefinition: (json) =>
        DestinyActivityGraphDefinition.fromJson(json),
    DestinyCollectibleDefinition: (json) =>
        DestinyCollectibleDefinition.fromJson(json),
    DestinyStatDefinition: (json) => DestinyStatDefinition.fromJson(json),
    DestinyItemTierTypeDefinition: (json) =>
        DestinyItemTierTypeDefinition.fromJson(json),
    DestinyPresentationNodeDefinition: (json) =>
        DestinyPresentationNodeDefinition.fromJson(json),
    DestinyRecordDefinition: (json) => DestinyRecordDefinition.fromJson(json),
    DestinyDestinationDefinition: (json) =>
        DestinyDestinationDefinition.fromJson(json),
    DestinyEquipmentSlotDefinition: (json) =>
        DestinyEquipmentSlotDefinition.fromJson(json),
    DestinyInventoryItemDefinition: (json) =>
        DestinyInventoryItemDefinition.fromJson(json),
    DestinyLocationDefinition: (json) =>
        DestinyLocationDefinition.fromJson(json),
    DestinyLoreDefinition: (json) => DestinyLoreDefinition.fromJson(json),
    DestinyObjectiveDefinition: (json) =>
        DestinyObjectiveDefinition.fromJson(json),
    DestinyProgressionDefinition: (json) =>
        DestinyProgressionDefinition.fromJson(json),
    DestinyProgressionLevelRequirementDefinition: (json) =>
        DestinyProgressionLevelRequirementDefinition.fromJson(json),
    DestinySocketCategoryDefinition: (json) =>
        DestinySocketCategoryDefinition.fromJson(json),
    DestinySocketTypeDefinition: (json) =>
        DestinySocketTypeDefinition.fromJson(json),
    DestinyVendorDefinition: (json) => DestinyVendorDefinition.fromJson(json),
    DestinyMilestoneDefinition: (json) =>
        DestinyMilestoneDefinition.fromJson(json),
    DestinyActivityModifierDefinition: (json) =>
        DestinyActivityModifierDefinition.fromJson(json),
    DestinyReportReasonCategoryDefinition: (json) =>
        DestinyReportReasonCategoryDefinition.fromJson(json),
    DestinyPlugSetDefinition: (json) => DestinyPlugSetDefinition.fromJson(json),
    DestinyChecklistDefinition: (json) =>
        DestinyChecklistDefinition.fromJson(json),
    DestinyHistoricalStatsDefinition: (json) =>
        DestinyHistoricalStatsDefinition.fromJson(json),
    DestinyMilestoneRewardEntryDefinition: (json) =>
        DestinyMilestoneRewardEntryDefinition.fromJson(json),
    DestinyEnergyTypeDefinition: (json) =>
        DestinyEnergyTypeDefinition.fromJson(json),
    DestinySeasonDefinition: (json) => DestinySeasonDefinition.fromJson(json),
    DestinySeasonPassDefinition: (json) =>
        DestinySeasonPassDefinition.fromJson(json),
    DestinyPowerCapDefinition: (json) =>
        DestinyPowerCapDefinition.fromJson(json),
    DestinyMetricDefinition: (json) => DestinyMetricDefinition.fromJson(json),
    DestinyTraitDefinition: (json) => DestinyTraitDefinition.fromJson(json)
  };

  static Map<Type, String> fromClass = {
    DestinyPlaceDefinition: "DestinyPlaceDefinition",
    DestinyActivityDefinition: "DestinyActivityDefinition",
    DestinyActivityTypeDefinition: "DestinyActivityTypeDefinition",
    DestinyClassDefinition: "DestinyClassDefinition",
    DestinyGenderDefinition: "DestinyGenderDefinition",
    DestinyInventoryBucketDefinition: "DestinyInventoryBucketDefinition",
    DestinyRaceDefinition: "DestinyRaceDefinition",
    DestinyTalentGridDefinition: "DestinyTalentGridDefinition",
    DestinyUnlockDefinition: "DestinyUnlockDefinition",
    DestinyMaterialRequirementSetDefinition:
        "DestinyMaterialRequirementSetDefinition",
    DestinySandboxPerkDefinition: "DestinySandboxPerkDefinition",
    DestinyStatGroupDefinition: "DestinyStatGroupDefinition",
    DestinyFactionDefinition: "DestinyFactionDefinition",
    DestinyVendorGroupDefinition: "DestinyVendorGroupDefinition",
    DestinyRewardSourceDefinition: "DestinyRewardSourceDefinition",
    DestinyItemCategoryDefinition: "DestinyItemCategoryDefinition",
    DestinyDamageTypeDefinition: "DestinyDamageTypeDefinition",
    DestinyActivityModeDefinition: "DestinyActivityModeDefinition",
    DestinyActivityGraphDefinition: "DestinyActivityGraphDefinition",
    DestinyCollectibleDefinition: "DestinyCollectibleDefinition",
    DestinyStatDefinition: "DestinyStatDefinition",
    DestinyItemTierTypeDefinition: "DestinyItemTierTypeDefinition",
    DestinyPresentationNodeDefinition: "DestinyPresentationNodeDefinition",
    DestinyRecordDefinition: "DestinyRecordDefinition",
    DestinyDestinationDefinition: "DestinyDestinationDefinition",
    DestinyEquipmentSlotDefinition: "DestinyEquipmentSlotDefinition",
    DestinyInventoryItemDefinition: "DestinyInventoryItemDefinition",
    DestinyLocationDefinition: "DestinyLocationDefinition",
    DestinyLoreDefinition: "DestinyLoreDefinition",
    DestinyObjectiveDefinition: "DestinyObjectiveDefinition",
    DestinyProgressionDefinition: "DestinyProgressionDefinition",
    DestinyProgressionLevelRequirementDefinition:
        "DestinyProgressionLevelRequirementDefinition",
    DestinySocketCategoryDefinition: "DestinySocketCategoryDefinition",
    DestinySocketTypeDefinition: "DestinySocketTypeDefinition",
    DestinyVendorDefinition: "DestinyVendorDefinition",
    DestinyMilestoneDefinition: "DestinyMilestoneDefinition",
    DestinyActivityModifierDefinition: "DestinyActivityModifierDefinition",
    DestinyReportReasonCategoryDefinition:
        "DestinyReportReasonCategoryDefinition",
    DestinyPlugSetDefinition: "DestinyPlugSetDefinition",
    DestinyChecklistDefinition: "DestinyChecklistDefinition",
    DestinyHistoricalStatsDefinition: "DestinyHistoricalStatsDefinition",
    DestinyMilestoneRewardEntryDefinition:
        "DestinyMilestoneRewardEntryDefinition",
    DestinyEnergyTypeDefinition: "DestinyEnergyTypeDefinition",
    DestinySeasonDefinition: "DestinySeasonDefinition",
    DestinySeasonPassDefinition: "DestinySeasonPassDefinition",
    DestinyPowerCapDefinition: "DestinyPowerCapDefinition",
    DestinyMetricDefinition: "DestinyMetricDefinition",
    DestinyTraitDefinition: "DestinyTraitDefinition"
  };
}
