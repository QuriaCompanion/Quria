import 'package:bungie_api/models/destiny_historical_stats_definition.dart';
import 'package:bungie_api/models/destiny_milestone_reward_entry_definition.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
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
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_bucket_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_category_definition.dart';
import 'package:bungie_api/models/destiny_item_tier_type_definition.dart';
import 'package:bungie_api/models/destiny_location_definition.dart';
import 'package:bungie_api/models/destiny_lore_definition.dart';
import 'package:bungie_api/models/destiny_material_requirement_set_definition.dart';
import 'package:bungie_api/models/destiny_metric_definition.dart';
import 'package:bungie_api/models/destiny_milestone_definition.dart';
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
import 'package:quria/data/services/manifest/manifest.service.dart';

import 'package:quria/data/models/bungie_api_dart/destiny_class_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_collectible_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_damage_type_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_energy_type_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_equipment_slot_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_plug_set_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_presentation_node_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_sandbox_perk_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_stat_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_talent_grid_definition.dart';

@immutable
class AllDestinyManifestComponents {
  const AllDestinyManifestComponents();

  @JsonKey(name: 'DestinyPlaceDefinition')
  final Map<int, DestinyPlaceDefinition> destinyPlaceDefinition = const {};
  @JsonKey(name: 'DestinyActivityDefinition')
  final Map<int, DestinyActivityDefinition> destinyActivityDefinition = const {};
  @JsonKey(name: 'DestinyActivityTypeDefinition')
  final Map<int, DestinyActivityTypeDefinition> destinyActivityTypeDefinition = const {};
  @JsonKey(name: 'DestinyClassDefinition')
  final Map<int, DestinyClassDefinition> destinyClassDefinition = const {};
  @JsonKey(name: 'DestinyGenderDefinition')
  final Map<int, DestinyGenderDefinition> destinyGenderDefinition = const {};
  @JsonKey(name: 'DestinyInventoryBucketDefinition')
  final Map<int, DestinyInventoryBucketDefinition> destinyInventoryBucketDefinition = const {};
  @JsonKey(name: 'DestinyRaceDefinition')
  final Map<int, DestinyRaceDefinition> destinyRaceDefinition = const {};
  @JsonKey(name: 'DestinyTalentGridDefinition')
  final Map<int, DestinyTalentGridDefinition> destinyTalentGridDefinition = const {};
  @JsonKey(name: 'DestinyUnlockDefinition')
  final Map<int, DestinyUnlockDefinition> destinyUnlockDefinition = const {};
  @JsonKey(name: 'DestinyMaterialRequirementSetDefinition')
  final Map<int, DestinyMaterialRequirementSetDefinition> destinyMaterialRequirementSetDefinition = const {};
  @JsonKey(name: 'DestinySandboxPerkDefinition')
  final Map<int, DestinySandboxPerkDefinition> destinySandboxPerkDefinition = const {};
  @JsonKey(name: 'DestinyStatGroupDefinition')
  final Map<int, DestinyStatGroupDefinition> destinyStatGroupDefinition = const {};
  @JsonKey(name: 'DestinyProgressionMappingDefinition')
  final Map<int, DestinyProgressionMappingDefinition> destinyProgressionMappingDefinition = const {};
  @JsonKey(name: 'DestinyFactionDefinition')
  final Map<int, DestinyFactionDefinition> destinyFactionDefinition = const {};
  @JsonKey(name: 'DestinyVendorGroupDefinition')
  final Map<int, DestinyVendorGroupDefinition> destinyVendorGroupDefinition = const {};
  @JsonKey(name: 'DestinyRewardSourceDefinition')
  final Map<int, DestinyRewardSourceDefinition> destinyRewardSourceDefinition = const {};
  @JsonKey(name: 'DestinyUnlockValueDefinition')
  final Map<int, DestinyUnlockValueDefinition> destinyUnlockValueDefinition = const {};
  @JsonKey(name: 'DestinyItemCategoryDefinition')
  final Map<int, DestinyItemCategoryDefinition> destinyItemCategoryDefinition = const {};
  @JsonKey(name: 'DestinyDamageTypeDefinition')
  final Map<int, DestinyDamageTypeDefinition> destinyDamageTypeDefinition = const {};
  @JsonKey(name: 'DestinyActivityModeDefinition')
  final Map<int, DestinyActivityModeDefinition> destinyActivityModeDefinition = const {};
  @JsonKey(name: 'DestinyActivityGraphDefinition')
  final Map<int, DestinyActivityGraphDefinition> destinyActivityGraphDefinition = const {};
  @JsonKey(name: 'DestinyCollectibleDefinition')
  final Map<int, DestinyCollectibleDefinition> destinyCollectibleDefinition = const {};
  @JsonKey(name: 'DestinyDestinationDefinition')
  final Map<int, DestinyDestinationDefinition> destinyDestinationDefinition = const {};
  @JsonKey(name: 'DestinyEquipmentSlotDefinition')
  final Map<int, DestinyEquipmentSlotDefinition> destinyEquipmentSlotDefinition = const {};
  @JsonKey(name: 'DestinyStatDefinition')
  final Map<int, DestinyStatDefinition> destinyStatDefinition = const {};
  @JsonKey(name: 'DestinyInventoryItemDefinition')
  final Map<int, DestinyInventoryItemDefinition> destinyInventoryItemDefinition = const {};
  @JsonKey(name: 'DestinyItemTierTypeDefinition')
  final Map<int, DestinyItemTierTypeDefinition> destinyItemTierTypeDefinition = const {};
  @JsonKey(name: 'DestinyLocationDefinition')
  final Map<int, DestinyLocationDefinition> destinyLocationDefinition = const {};
  @JsonKey(name: 'DestinyLoreDefinition')
  final Map<int, DestinyLoreDefinition> destinyLoreDefinition = const {};
  @JsonKey(name: 'DestinyMetricDefinition')
  final Map<int, DestinyMetricDefinition> destinyMetricDefinition = const {};
  @JsonKey(name: 'DestinyObjectiveDefinition')
  final Map<int, DestinyObjectiveDefinition> destinyObjectiveDefinition = const {};
  @JsonKey(name: 'DestinyPlugSetDefinition')
  final Map<int, DestinyPlugSetDefinition> destinyPlugSetDefinition = const {};
  @JsonKey(name: 'DestinyPowerCapDefinition')
  final Map<int, DestinyPowerCapDefinition> destinyPowerCapDefinition = const {};
  @JsonKey(name: 'DestinyPresentationNodeDefinition')
  final Map<int, DestinyPresentationNodeDefinition> destinyPresentationNodeDefinition = const {};
  @JsonKey(name: 'DestinyProgressionDefinition')
  final Map<int, DestinyProgressionDefinition> destinyProgressionDefinition = const {};
  @JsonKey(name: 'DestinyProgressionLevelRequirementDefinition')
  final Map<int, DestinyProgressionLevelRequirementDefinition> destinyProgressionLevelRequirementDefinition = const {};
  @JsonKey(name: 'DestinyRecordDefinition')
  final Map<int, DestinyRecordDefinition> destinyRecordDefinition = const {};
  @JsonKey(name: 'DestinySeasonDefinition')
  final Map<int, DestinySeasonDefinition> destinySeasonDefinition = const {};
  @JsonKey(name: 'DestinySeasonPassDefinition')
  final Map<int, DestinySeasonPassDefinition> destinySeasonPassDefinition = const {};
  @JsonKey(name: 'DestinySocketCategoryDefinition')
  final Map<int, DestinySocketCategoryDefinition> destinySocketCategoryDefinition = const {};
  @JsonKey(name: 'DestinySocketTypeDefinition')
  final Map<int, DestinySocketTypeDefinition> destinySocketTypeDefinition = const {};
  @JsonKey(name: 'DestinyTraitDefinition')
  final Map<int, DestinyTraitDefinition> destinyTraitDefinition = const {};
  @JsonKey(name: 'DestinyTraitCategoryDefinition')
  final Map<int, DestinyTraitCategoryDefinition> destinyTraitCategoryDefinition = const {};
  @JsonKey(name: 'DestinyVendorDefinition')
  final Map<int, DestinyVendorDefinition> destinyVendorDefinition = const {};
  @JsonKey(name: 'DestinyMilestoneDefinition')
  final Map<int, DestinyMilestoneDefinition> destinyMilestoneDefinition = const {};
  @JsonKey(name: 'DestinyActivityModifierDefinition')
  final Map<int, DestinyActivityModifierDefinition> destinyActivityModifierDefinition = const {};
  @JsonKey(name: 'DestinyReportReasonCategoryDefinition')
  final Map<int, DestinyReportReasonCategoryDefinition> destinyReportReasonCategoryDefinition = const {};
  @JsonKey(name: 'DestinyArtifactDefinition')
  final Map<int, DestinyArtifactDefinition> destinyArtifactDefinition = const {};
  @JsonKey(name: 'DestinyBreakerTypeDefinition')
  final Map<int, DestinyBreakerTypeDefinition> destinyBreakerTypeDefinition = const {};
  @JsonKey(name: 'DestinyChecklistDefinition')
  final Map<int, DestinyChecklistDefinition> destinyChecklistDefinition = const {};
  @JsonKey(name: 'DestinyHistoricalStatsDefinition')
  final Map<int, DestinyHistoricalStatsDefinition> destinyHistoricalStatsDefinition = const {};
  @JsonKey(name: 'DestinyMilestoneRewardEntryDefinition')
  final Map<int, DestinyMilestoneRewardEntryDefinition> destinyMilestoneRewardEntryDefinition = const {};
  @JsonKey(name: 'DestinyEnergyTypeDefinition')
  final Map<int, DestinyEnergyTypeDefinition> destinyEnergyTypeDefinition = const {};
  static void setField<T>(int hash, T field) {
    switch (T) {
      case DestinyPlaceDefinition:
        ManifestService.manifestParsed.destinyPlaceDefinition[hash] = field as DestinyPlaceDefinition;
        break;
      case DestinyActivityDefinition:
        ManifestService.manifestParsed.destinyActivityDefinition[hash] = field as DestinyActivityDefinition;
        break;
      case DestinyActivityTypeDefinition:
        ManifestService.manifestParsed.destinyActivityTypeDefinition[hash] = field as DestinyActivityTypeDefinition;
        break;
      case DestinyClassDefinition:
        ManifestService.manifestParsed.destinyClassDefinition[hash] = field as DestinyClassDefinition;
        break;
      case DestinyGenderDefinition:
        ManifestService.manifestParsed.destinyGenderDefinition[hash] = field as DestinyGenderDefinition;
        break;
      case DestinyInventoryBucketDefinition:
        ManifestService.manifestParsed.destinyInventoryBucketDefinition[hash] =
            field as DestinyInventoryBucketDefinition;
        break;
      case DestinyRaceDefinition:
        ManifestService.manifestParsed.destinyRaceDefinition[hash] = field as DestinyRaceDefinition;
        break;
      case DestinyTalentGridDefinition:
        ManifestService.manifestParsed.destinyTalentGridDefinition[hash] = field as DestinyTalentGridDefinition;
        break;
      case DestinyUnlockDefinition:
        ManifestService.manifestParsed.destinyUnlockDefinition[hash] = field as DestinyUnlockDefinition;
        break;
      case DestinyMaterialRequirementSetDefinition:
        ManifestService.manifestParsed.destinyMaterialRequirementSetDefinition[hash] =
            field as DestinyMaterialRequirementSetDefinition;
        break;
      case DestinySandboxPerkDefinition:
        ManifestService.manifestParsed.destinySandboxPerkDefinition[hash] = field as DestinySandboxPerkDefinition;
        break;
      case DestinyStatGroupDefinition:
        ManifestService.manifestParsed.destinyStatGroupDefinition[hash] = field as DestinyStatGroupDefinition;
        break;
      case DestinyFactionDefinition:
        ManifestService.manifestParsed.destinyFactionDefinition[hash] = field as DestinyFactionDefinition;
        break;
      case DestinyVendorGroupDefinition:
        ManifestService.manifestParsed.destinyVendorGroupDefinition[hash] = field as DestinyVendorGroupDefinition;
        break;
      case DestinyRewardSourceDefinition:
        ManifestService.manifestParsed.destinyRewardSourceDefinition[hash] = field as DestinyRewardSourceDefinition;
        break;
      case DestinyItemCategoryDefinition:
        ManifestService.manifestParsed.destinyItemCategoryDefinition[hash] = field as DestinyItemCategoryDefinition;
        break;
      case DestinyDamageTypeDefinition:
        ManifestService.manifestParsed.destinyDamageTypeDefinition[hash] = field as DestinyDamageTypeDefinition;
        break;
      case DestinyActivityModeDefinition:
        ManifestService.manifestParsed.destinyActivityModeDefinition[hash] = field as DestinyActivityModeDefinition;
        break;
      case DestinyActivityGraphDefinition:
        ManifestService.manifestParsed.destinyActivityGraphDefinition[hash] = field as DestinyActivityGraphDefinition;
        break;
      case DestinyCollectibleDefinition:
        ManifestService.manifestParsed.destinyCollectibleDefinition[hash] = field as DestinyCollectibleDefinition;
        break;
      case DestinyStatDefinition:
        ManifestService.manifestParsed.destinyStatDefinition[hash] = field as DestinyStatDefinition;
        break;
      case DestinyItemTierTypeDefinition:
        ManifestService.manifestParsed.destinyItemTierTypeDefinition[hash] = field as DestinyItemTierTypeDefinition;
        break;
      case DestinyPresentationNodeDefinition:
        ManifestService.manifestParsed.destinyPresentationNodeDefinition[hash] =
            field as DestinyPresentationNodeDefinition;
        break;
      case DestinyRecordDefinition:
        ManifestService.manifestParsed.destinyRecordDefinition[hash] = field as DestinyRecordDefinition;
        break;
      case DestinyDestinationDefinition:
        ManifestService.manifestParsed.destinyDestinationDefinition[hash] = field as DestinyDestinationDefinition;
        break;
      case DestinyEquipmentSlotDefinition:
        ManifestService.manifestParsed.destinyEquipmentSlotDefinition[hash] = field as DestinyEquipmentSlotDefinition;
        break;
      case DestinyInventoryItemDefinition:
        ManifestService.manifestParsed.destinyInventoryItemDefinition[hash] = field as DestinyInventoryItemDefinition;
        break;
      case DestinyLocationDefinition:
        ManifestService.manifestParsed.destinyLocationDefinition[hash] = field as DestinyLocationDefinition;
        break;
      case DestinyLoreDefinition:
        ManifestService.manifestParsed.destinyLoreDefinition[hash] = field as DestinyLoreDefinition;
        break;
      case DestinyObjectiveDefinition:
        ManifestService.manifestParsed.destinyObjectiveDefinition[hash] = field as DestinyObjectiveDefinition;
        break;
      case DestinyProgressionDefinition:
        ManifestService.manifestParsed.destinyProgressionDefinition[hash] = field as DestinyProgressionDefinition;
        break;
      case DestinyProgressionLevelRequirementDefinition:
        ManifestService.manifestParsed.destinyProgressionLevelRequirementDefinition[hash] =
            field as DestinyProgressionLevelRequirementDefinition;
        break;
      case DestinySocketCategoryDefinition:
        ManifestService.manifestParsed.destinySocketCategoryDefinition[hash] = field as DestinySocketCategoryDefinition;
        break;
      case DestinySocketTypeDefinition:
        ManifestService.manifestParsed.destinySocketTypeDefinition[hash] = field as DestinySocketTypeDefinition;
        break;
      case DestinyVendorDefinition:
        ManifestService.manifestParsed.destinyVendorDefinition[hash] = field as DestinyVendorDefinition;
        break;
      case DestinyMilestoneDefinition:
        ManifestService.manifestParsed.destinyMilestoneDefinition[hash] = field as DestinyMilestoneDefinition;
        break;
      case DestinyActivityModifierDefinition:
        ManifestService.manifestParsed.destinyActivityModifierDefinition[hash] =
            field as DestinyActivityModifierDefinition;
        break;
      case DestinyReportReasonCategoryDefinition:
        ManifestService.manifestParsed.destinyReportReasonCategoryDefinition[hash] =
            field as DestinyReportReasonCategoryDefinition;
        break;
      case DestinyPlugSetDefinition:
        ManifestService.manifestParsed.destinyPlugSetDefinition[hash] = field as DestinyPlugSetDefinition;
        break;
      case DestinyChecklistDefinition:
        ManifestService.manifestParsed.destinyChecklistDefinition[hash] = field as DestinyChecklistDefinition;
        break;
      case DestinyHistoricalStatsDefinition:
        ManifestService.manifestParsed.destinyHistoricalStatsDefinition[hash] =
            field as DestinyHistoricalStatsDefinition;
        break;
      case DestinyMilestoneRewardEntryDefinition:
        ManifestService.manifestParsed.destinyMilestoneRewardEntryDefinition[hash] =
            field as DestinyMilestoneRewardEntryDefinition;
        break;
      case DestinyEnergyTypeDefinition:
        ManifestService.manifestParsed.destinyEnergyTypeDefinition[hash] = field as DestinyEnergyTypeDefinition;
        break;
      case DestinySeasonDefinition:
        ManifestService.manifestParsed.destinySeasonDefinition[hash] = field as DestinySeasonDefinition;
        break;
      case DestinySeasonPassDefinition:
        ManifestService.manifestParsed.destinySeasonPassDefinition[hash] = field as DestinySeasonPassDefinition;
        break;
      case DestinyPowerCapDefinition:
        ManifestService.manifestParsed.destinyPowerCapDefinition[hash] = field as DestinyPowerCapDefinition;
        break;
      case DestinyMetricDefinition:
        ManifestService.manifestParsed.destinyMetricDefinition[hash] = field as DestinyMetricDefinition;
        break;
      case DestinyTraitDefinition:
        ManifestService.manifestParsed.destinyTraitDefinition[hash] = field as DestinyTraitDefinition;
        break;
      default:
        throw Exception('Unknown type');
    }
  }

  static setValue<T>(Map<int, T> manifestValue) {
    switch (T) {
      case DestinyPlaceDefinition:
        return ManifestService.manifestParsed.destinyPlaceDefinition
            .addAll(manifestValue as Map<int, DestinyPlaceDefinition>);
      case DestinyActivityDefinition:
        return ManifestService.manifestParsed.destinyActivityDefinition
            .addAll(manifestValue as Map<int, DestinyActivityDefinition>);
      case DestinyActivityTypeDefinition:
        return ManifestService.manifestParsed.destinyActivityTypeDefinition
            .addAll(manifestValue as Map<int, DestinyActivityTypeDefinition>);
      case DestinyClassDefinition:
        return ManifestService.manifestParsed.destinyClassDefinition
            .addAll(manifestValue as Map<int, DestinyClassDefinition>);
      case DestinyGenderDefinition:
        return ManifestService.manifestParsed.destinyGenderDefinition
            .addAll(manifestValue as Map<int, DestinyGenderDefinition>);
      case DestinyInventoryBucketDefinition:
        return ManifestService.manifestParsed.destinyInventoryBucketDefinition
            .addAll(manifestValue as Map<int, DestinyInventoryBucketDefinition>);
      case DestinyRaceDefinition:
        return ManifestService.manifestParsed.destinyRaceDefinition
            .addAll(manifestValue as Map<int, DestinyRaceDefinition>);
      case DestinyTalentGridDefinition:
        return ManifestService.manifestParsed.destinyTalentGridDefinition
            .addAll(manifestValue as Map<int, DestinyTalentGridDefinition>);
      case DestinyUnlockDefinition:
        return ManifestService.manifestParsed.destinyUnlockDefinition
            .addAll(manifestValue as Map<int, DestinyUnlockDefinition>);
      case DestinyMaterialRequirementSetDefinition:
        return ManifestService.manifestParsed.destinyMaterialRequirementSetDefinition
            .addAll(manifestValue as Map<int, DestinyMaterialRequirementSetDefinition>);
      case DestinySandboxPerkDefinition:
        return ManifestService.manifestParsed.destinySandboxPerkDefinition
            .addAll(manifestValue as Map<int, DestinySandboxPerkDefinition>);
      case DestinyStatGroupDefinition:
        return ManifestService.manifestParsed.destinyStatGroupDefinition
            .addAll(manifestValue as Map<int, DestinyStatGroupDefinition>);
      case DestinyFactionDefinition:
        return ManifestService.manifestParsed.destinyFactionDefinition
            .addAll(manifestValue as Map<int, DestinyFactionDefinition>);
      case DestinyVendorGroupDefinition:
        return ManifestService.manifestParsed.destinyVendorGroupDefinition
            .addAll(manifestValue as Map<int, DestinyVendorGroupDefinition>);
      case DestinyRewardSourceDefinition:
        return ManifestService.manifestParsed.destinyRewardSourceDefinition
            .addAll(manifestValue as Map<int, DestinyRewardSourceDefinition>);
      case DestinyItemCategoryDefinition:
        return ManifestService.manifestParsed.destinyItemCategoryDefinition
            .addAll(manifestValue as Map<int, DestinyItemCategoryDefinition>);
      case DestinyDamageTypeDefinition:
        return ManifestService.manifestParsed.destinyDamageTypeDefinition
            .addAll(manifestValue as Map<int, DestinyDamageTypeDefinition>);
      case DestinyActivityModeDefinition:
        return ManifestService.manifestParsed.destinyActivityModeDefinition
            .addAll(manifestValue as Map<int, DestinyActivityModeDefinition>);
      case DestinyActivityGraphDefinition:
        return ManifestService.manifestParsed.destinyActivityGraphDefinition
            .addAll(manifestValue as Map<int, DestinyActivityGraphDefinition>);
      case DestinyCollectibleDefinition:
        return ManifestService.manifestParsed.destinyCollectibleDefinition
            .addAll(manifestValue as Map<int, DestinyCollectibleDefinition>);
      case DestinyStatDefinition:
        return ManifestService.manifestParsed.destinyStatDefinition
            .addAll(manifestValue as Map<int, DestinyStatDefinition>);
      case DestinyItemTierTypeDefinition:
        return ManifestService.manifestParsed.destinyItemTierTypeDefinition
            .addAll(manifestValue as Map<int, DestinyItemTierTypeDefinition>);
      case DestinyPresentationNodeDefinition:
        return ManifestService.manifestParsed.destinyPresentationNodeDefinition
            .addAll(manifestValue as Map<int, DestinyPresentationNodeDefinition>);
      case DestinyRecordDefinition:
        return ManifestService.manifestParsed.destinyRecordDefinition
            .addAll(manifestValue as Map<int, DestinyRecordDefinition>);
      case DestinyDestinationDefinition:
        return ManifestService.manifestParsed.destinyDestinationDefinition
            .addAll(manifestValue as Map<int, DestinyDestinationDefinition>);
      case DestinyEquipmentSlotDefinition:
        return ManifestService.manifestParsed.destinyEquipmentSlotDefinition
            .addAll(manifestValue as Map<int, DestinyEquipmentSlotDefinition>);
      case DestinyInventoryItemDefinition:
        return ManifestService.manifestParsed.destinyInventoryItemDefinition
            .addAll(manifestValue as Map<int, DestinyInventoryItemDefinition>);
      case DestinyLocationDefinition:
        return ManifestService.manifestParsed.destinyLocationDefinition
            .addAll(manifestValue as Map<int, DestinyLocationDefinition>);
      case DestinyLoreDefinition:
        return ManifestService.manifestParsed.destinyLoreDefinition
            .addAll(manifestValue as Map<int, DestinyLoreDefinition>);
      case DestinyObjectiveDefinition:
        return ManifestService.manifestParsed.destinyObjectiveDefinition
            .addAll(manifestValue as Map<int, DestinyObjectiveDefinition>);
      case DestinyProgressionDefinition:
        return ManifestService.manifestParsed.destinyProgressionDefinition
            .addAll(manifestValue as Map<int, DestinyProgressionDefinition>);
      case DestinyProgressionLevelRequirementDefinition:
        return ManifestService.manifestParsed.destinyProgressionLevelRequirementDefinition
            .addAll(manifestValue as Map<int, DestinyProgressionLevelRequirementDefinition>);
      case DestinySocketCategoryDefinition:
        return ManifestService.manifestParsed.destinySocketCategoryDefinition
            .addAll(manifestValue as Map<int, DestinySocketCategoryDefinition>);
      case DestinySocketTypeDefinition:
        return ManifestService.manifestParsed.destinySocketTypeDefinition
            .addAll(manifestValue as Map<int, DestinySocketTypeDefinition>);
      case DestinyVendorDefinition:
        return ManifestService.manifestParsed.destinyVendorDefinition
            .addAll(manifestValue as Map<int, DestinyVendorDefinition>);
      case DestinyMilestoneDefinition:
        return ManifestService.manifestParsed.destinyMilestoneDefinition
            .addAll(manifestValue as Map<int, DestinyMilestoneDefinition>);
      case DestinyActivityModifierDefinition:
        return ManifestService.manifestParsed.destinyActivityModifierDefinition
            .addAll(manifestValue as Map<int, DestinyActivityModifierDefinition>);
      case DestinyReportReasonCategoryDefinition:
        return ManifestService.manifestParsed.destinyReportReasonCategoryDefinition
            .addAll(manifestValue as Map<int, DestinyReportReasonCategoryDefinition>);
      case DestinyPlugSetDefinition:
        return ManifestService.manifestParsed.destinyPlugSetDefinition
            .addAll(manifestValue as Map<int, DestinyPlugSetDefinition>);
      case DestinyChecklistDefinition:
        return ManifestService.manifestParsed.destinyChecklistDefinition
            .addAll(manifestValue as Map<int, DestinyChecklistDefinition>);
      case DestinyHistoricalStatsDefinition:
        return ManifestService.manifestParsed.destinyHistoricalStatsDefinition
            .addAll(manifestValue as Map<int, DestinyHistoricalStatsDefinition>);
      case DestinyMilestoneRewardEntryDefinition:
        return ManifestService.manifestParsed.destinyMilestoneRewardEntryDefinition
            .addAll(manifestValue as Map<int, DestinyMilestoneRewardEntryDefinition>);
      case DestinyEnergyTypeDefinition:
        return ManifestService.manifestParsed.destinyEnergyTypeDefinition
            .addAll(manifestValue as Map<int, DestinyEnergyTypeDefinition>);
      case DestinySeasonDefinition:
        return ManifestService.manifestParsed.destinySeasonDefinition
            .addAll(manifestValue as Map<int, DestinySeasonDefinition>);
      case DestinySeasonPassDefinition:
        return ManifestService.manifestParsed.destinySeasonPassDefinition
            .addAll(manifestValue as Map<int, DestinySeasonPassDefinition>);
      case DestinyPowerCapDefinition:
        return ManifestService.manifestParsed.destinyPowerCapDefinition
            .addAll(manifestValue as Map<int, DestinyPowerCapDefinition>);
      case DestinyMetricDefinition:
        return ManifestService.manifestParsed.destinyMetricDefinition
            .addAll(manifestValue as Map<int, DestinyMetricDefinition>);
      case DestinyTraitDefinition:
        return ManifestService.manifestParsed.destinyTraitDefinition
            .addAll(manifestValue as Map<int, DestinyTraitDefinition>);
      default:
        throw Exception('Unknown type');
    }
  }

  static Map<int, T>? getValue<T>() {
    switch (T) {
      case DestinyPlaceDefinition:
        return ManifestService.manifestParsed.destinyPlaceDefinition as Map<int, T>?;
      case DestinyActivityDefinition:
        return ManifestService.manifestParsed.destinyActivityDefinition as Map<int, T>?;
      case DestinyActivityTypeDefinition:
        return ManifestService.manifestParsed.destinyActivityTypeDefinition as Map<int, T>?;
      case DestinyClassDefinition:
        return ManifestService.manifestParsed.destinyClassDefinition as Map<int, T>?;
      case DestinyGenderDefinition:
        return ManifestService.manifestParsed.destinyGenderDefinition as Map<int, T>?;
      case DestinyInventoryBucketDefinition:
        return ManifestService.manifestParsed.destinyInventoryBucketDefinition as Map<int, T>?;
      case DestinyRaceDefinition:
        return ManifestService.manifestParsed.destinyRaceDefinition as Map<int, T>?;
      case DestinyTalentGridDefinition:
        return ManifestService.manifestParsed.destinyTalentGridDefinition as Map<int, T>?;
      case DestinyUnlockDefinition:
        return ManifestService.manifestParsed.destinyUnlockDefinition as Map<int, T>?;
      case DestinyMaterialRequirementSetDefinition:
        return ManifestService.manifestParsed.destinyMaterialRequirementSetDefinition as Map<int, T>?;
      case DestinySandboxPerkDefinition:
        return ManifestService.manifestParsed.destinySandboxPerkDefinition as Map<int, T>?;
      case DestinyStatGroupDefinition:
        return ManifestService.manifestParsed.destinyStatGroupDefinition as Map<int, T>?;
      case DestinyFactionDefinition:
        return ManifestService.manifestParsed.destinyFactionDefinition as Map<int, T>?;
      case DestinyVendorGroupDefinition:
        return ManifestService.manifestParsed.destinyVendorGroupDefinition as Map<int, T>?;
      case DestinyRewardSourceDefinition:
        return ManifestService.manifestParsed.destinyRewardSourceDefinition as Map<int, T>?;
      case DestinyItemCategoryDefinition:
        return ManifestService.manifestParsed.destinyItemCategoryDefinition as Map<int, T>?;
      case DestinyDamageTypeDefinition:
        return ManifestService.manifestParsed.destinyDamageTypeDefinition as Map<int, T>?;
      case DestinyActivityModeDefinition:
        return ManifestService.manifestParsed.destinyActivityModeDefinition as Map<int, T>?;
      case DestinyActivityGraphDefinition:
        return ManifestService.manifestParsed.destinyActivityGraphDefinition as Map<int, T>?;
      case DestinyCollectibleDefinition:
        return ManifestService.manifestParsed.destinyCollectibleDefinition as Map<int, T>?;
      case DestinyStatDefinition:
        return ManifestService.manifestParsed.destinyStatDefinition as Map<int, T>?;
      case DestinyItemTierTypeDefinition:
        return ManifestService.manifestParsed.destinyItemTierTypeDefinition as Map<int, T>?;
      case DestinyPresentationNodeDefinition:
        return ManifestService.manifestParsed.destinyPresentationNodeDefinition as Map<int, T>?;
      case DestinyRecordDefinition:
        return ManifestService.manifestParsed.destinyRecordDefinition as Map<int, T>?;
      case DestinyDestinationDefinition:
        return ManifestService.manifestParsed.destinyDestinationDefinition as Map<int, T>?;
      case DestinyEquipmentSlotDefinition:
        return ManifestService.manifestParsed.destinyEquipmentSlotDefinition as Map<int, T>?;
      case DestinyInventoryItemDefinition:
        return ManifestService.manifestParsed.destinyInventoryItemDefinition as Map<int, T>?;
      case DestinyLocationDefinition:
        return ManifestService.manifestParsed.destinyLocationDefinition as Map<int, T>?;
      case DestinyLoreDefinition:
        return ManifestService.manifestParsed.destinyLoreDefinition as Map<int, T>?;
      case DestinyObjectiveDefinition:
        return ManifestService.manifestParsed.destinyObjectiveDefinition as Map<int, T>?;
      case DestinyProgressionDefinition:
        return ManifestService.manifestParsed.destinyProgressionDefinition as Map<int, T>?;
      case DestinyProgressionLevelRequirementDefinition:
        return ManifestService.manifestParsed.destinyProgressionLevelRequirementDefinition as Map<int, T>?;
      case DestinySocketCategoryDefinition:
        return ManifestService.manifestParsed.destinySocketCategoryDefinition as Map<int, T>?;
      case DestinySocketTypeDefinition:
        return ManifestService.manifestParsed.destinySocketTypeDefinition as Map<int, T>?;
      case DestinyVendorDefinition:
        return ManifestService.manifestParsed.destinyVendorDefinition as Map<int, T>?;
      case DestinyMilestoneDefinition:
        return ManifestService.manifestParsed.destinyMilestoneDefinition as Map<int, T>?;
      case DestinyActivityModifierDefinition:
        return ManifestService.manifestParsed.destinyActivityModifierDefinition as Map<int, T>?;
      case DestinyReportReasonCategoryDefinition:
        return ManifestService.manifestParsed.destinyReportReasonCategoryDefinition as Map<int, T>?;
      case DestinyPlugSetDefinition:
        return ManifestService.manifestParsed.destinyPlugSetDefinition as Map<int, T>?;
      case DestinyChecklistDefinition:
        return ManifestService.manifestParsed.destinyChecklistDefinition as Map<int, T>?;
      case DestinyHistoricalStatsDefinition:
        return ManifestService.manifestParsed.destinyHistoricalStatsDefinition as Map<int, T>?;
      case DestinyMilestoneRewardEntryDefinition:
        return ManifestService.manifestParsed.destinyMilestoneRewardEntryDefinition as Map<int, T>?;
      case DestinyEnergyTypeDefinition:
        return ManifestService.manifestParsed.destinyEnergyTypeDefinition as Map<int, T>?;
      case DestinySeasonDefinition:
        return ManifestService.manifestParsed.destinySeasonDefinition as Map<int, T>?;
      case DestinySeasonPassDefinition:
        return ManifestService.manifestParsed.destinySeasonPassDefinition as Map<int, T>?;
      case DestinyPowerCapDefinition:
        return ManifestService.manifestParsed.destinyPowerCapDefinition as Map<int, T>?;
      case DestinyMetricDefinition:
        return ManifestService.manifestParsed.destinyMetricDefinition as Map<int, T>?;
      case DestinyTraitDefinition:
        return ManifestService.manifestParsed.destinyTraitDefinition as Map<int, T>?;
      default:
        throw Exception('Unknown type');
    }
  }
}
