import 'package:bungie_api/models/destiny_historical_stats_definition.dart';
import 'package:bungie_api/models/destiny_milestone_reward_entry_definition.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bungie_api/models/destiny_activity_definition.dart';
import 'package:bungie_api/models/destiny_activity_graph_definition.dart';
import 'package:bungie_api/models/destiny_activity_mode_definition.dart';
import 'package:bungie_api/models/destiny_activity_modifier_definition.dart';
import 'package:bungie_api/models/destiny_activity_type_definition.dart';
import 'package:bungie_api/models/destiny_artifact_definition.dart';
import 'package:bungie_api/models/destiny_breaker_type_definition.dart';
import 'package:bungie_api/models/destiny_checklist_definition.dart';
import 'package:bungie_api/models/destiny_class_definition.dart';
import 'package:bungie_api/models/destiny_collectible_definition.dart';
import 'package:bungie_api/models/destiny_damage_type_definition.dart';
import 'package:bungie_api/models/destiny_destination_definition.dart';
import 'package:bungie_api/models/destiny_energy_type_definition.dart';
import 'package:bungie_api/models/destiny_equipment_slot_definition.dart';
import 'package:bungie_api/models/destiny_faction_definition.dart';
import 'package:bungie_api/models/destiny_gender_definition.dart';
import 'package:bungie_api/models/destiny_inventory_bucket_definition.dart';
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
import 'package:bungie_api/models/destiny_plug_set_definition.dart';
import 'package:bungie_api/models/destiny_power_cap_definition.dart';
import 'package:bungie_api/models/destiny_presentation_node_definition.dart';
import 'package:bungie_api/models/destiny_progression_definition.dart';
import 'package:bungie_api/models/destiny_progression_level_requirement_definition.dart';
import 'package:bungie_api/models/destiny_progression_mapping_definition.dart';
import 'package:bungie_api/models/destiny_race_definition.dart';
import 'package:bungie_api/models/destiny_record_definition.dart';
import 'package:bungie_api/models/destiny_report_reason_category_definition.dart';
import 'package:bungie_api/models/destiny_reward_source_definition.dart';
import 'package:bungie_api/models/destiny_sandbox_perk_definition.dart';
import 'package:bungie_api/models/destiny_season_definition.dart';
import 'package:bungie_api/models/destiny_season_pass_definition.dart';
import 'package:bungie_api/models/destiny_socket_category_definition.dart';
import 'package:bungie_api/models/destiny_socket_type_definition.dart';
import 'package:bungie_api/models/destiny_stat_definition.dart';
import 'package:bungie_api/models/destiny_stat_group_definition.dart';
import 'package:bungie_api/models/destiny_talent_grid_definition.dart';
import 'package:bungie_api/models/destiny_trait_category_definition.dart';
import 'package:bungie_api/models/destiny_trait_definition.dart';
import 'package:bungie_api/models/destiny_unlock_definition.dart';
import 'package:bungie_api/models/destiny_unlock_value_definition.dart';
import 'package:bungie_api/models/destiny_vendor_definition.dart';
import 'package:bungie_api/models/destiny_vendor_group_definition.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
part 'AllDestinyManifestComponents.model.g.dart';

@JsonSerializable()
class AllDestinyManifestComponents {
  AllDestinyManifestComponents();
  factory AllDestinyManifestComponents.fromJson(Map<String, dynamic> json) {
    return _$AllDestinyManifestComponentsFromJson(json);
  }
  @JsonKey(name: 'DestinyPlaceDefinition')
  Map<int, DestinyPlaceDefinition>? destinyPlaceDefinition;
  @JsonKey(name: 'DestinyActivityDefinition')
  Map<int, DestinyActivityDefinition>? destinyActivityDefinition;
  @JsonKey(name: 'DestinyActivityTypeDefinition')
  Map<int, DestinyActivityTypeDefinition>? destinyActivityTypeDefinition;
  @JsonKey(name: 'DestinyClassDefinition')
  Map<int, DestinyClassDefinition>? destinyClassDefinition;
  @JsonKey(name: 'DestinyGenderDefinition')
  Map<int, DestinyGenderDefinition>? destinyGenderDefinition;
  @JsonKey(name: 'DestinyInventoryBucketDefinition')
  Map<int, DestinyInventoryBucketDefinition>? destinyInventoryBucketDefinition;
  @JsonKey(name: 'DestinyRaceDefinition')
  Map<int, DestinyRaceDefinition>? destinyRaceDefinition;
  @JsonKey(name: 'DestinyTalentGridDefinition')
  Map<int, DestinyTalentGridDefinition>? destinyTalentGridDefinition;
  @JsonKey(name: 'DestinyUnlockDefinition')
  Map<int, DestinyUnlockDefinition>? destinyUnlockDefinition;
  @JsonKey(name: 'DestinyMaterialRequirementSetDefinition')
  Map<int, DestinyMaterialRequirementSetDefinition>?
      destinyMaterialRequirementSetDefinition;
  @JsonKey(name: 'DestinySandboxPerkDefinition')
  Map<int, DestinySandboxPerkDefinition>? destinySandboxPerkDefinition;
  @JsonKey(name: 'DestinyStatGroupDefinition')
  Map<int, DestinyStatGroupDefinition>? destinyStatGroupDefinition;
  @JsonKey(name: 'DestinyProgressionMappingDefinition')
  Map<int, DestinyProgressionMappingDefinition>?
      destinyProgressionMappingDefinition;
  @JsonKey(name: 'DestinyFactionDefinition')
  Map<int, DestinyFactionDefinition>? destinyFactionDefinition;
  @JsonKey(name: 'DestinyVendorGroupDefinition')
  Map<int, DestinyVendorGroupDefinition>? destinyVendorGroupDefinition;
  @JsonKey(name: 'DestinyRewardSourceDefinition')
  Map<int, DestinyRewardSourceDefinition>? destinyRewardSourceDefinition;
  @JsonKey(name: 'DestinyUnlockValueDefinition')
  Map<int, DestinyUnlockValueDefinition>? destinyUnlockValueDefinition;
  @JsonKey(name: 'DestinyItemCategoryDefinition')
  Map<int, DestinyItemCategoryDefinition>? destinyItemCategoryDefinition;
  @JsonKey(name: 'DestinyDamageTypeDefinition')
  Map<int, DestinyDamageTypeDefinition>? destinyDamageTypeDefinition;
  @JsonKey(name: 'DestinyActivityModeDefinition')
  Map<int, DestinyActivityModeDefinition>? destinyActivityModeDefinition;
  @JsonKey(name: 'DestinyActivityGraphDefinition')
  Map<int, DestinyActivityGraphDefinition>? destinyActivityGraphDefinition;
  @JsonKey(name: 'DestinyCollectibleDefinition')
  Map<int, DestinyCollectibleDefinition>? destinyCollectibleDefinition;
  @JsonKey(name: 'DestinyDestinationDefinition')
  Map<int, DestinyDestinationDefinition>? destinyDestinationDefinition;
  @JsonKey(name: 'DestinyEquipmentSlotDefinition')
  Map<int, DestinyEquipmentSlotDefinition>? destinyEquipmentSlotDefinition;
  @JsonKey(name: 'DestinyStatDefinition')
  Map<int, DestinyStatDefinition>? destinyStatDefinition;
  @JsonKey(name: 'DestinyInventoryItemDefinition')
  Map<int, DestinyInventoryItemDefinition>? destinyInventoryItemDefinition;
  @JsonKey(name: 'DestinyItemTierTypeDefinition')
  Map<int, DestinyItemTierTypeDefinition>? destinyItemTierTypeDefinition;
  @JsonKey(name: 'DestinyLocationDefinition')
  Map<int, DestinyLocationDefinition>? destinyLocationDefinition;
  @JsonKey(name: 'DestinyLoreDefinition')
  Map<int, DestinyLoreDefinition>? destinyLoreDefinition;
  @JsonKey(name: 'DestinyMetricDefinition')
  Map<int, DestinyMetricDefinition>? destinyMetricDefinition;
  @JsonKey(name: 'DestinyObjectiveDefinition')
  Map<int, DestinyObjectiveDefinition>? destinyObjectiveDefinition;
  @JsonKey(name: 'DestinyPlugSetDefinition')
  Map<int, DestinyPlugSetDefinition>? destinyPlugSetDefinition;
  @JsonKey(name: 'DestinyPowerCapDefinition')
  Map<int, DestinyPowerCapDefinition>? destinyPowerCapDefinition;
  @JsonKey(name: 'DestinyPresentationNodeDefinition')
  Map<int, DestinyPresentationNodeDefinition>?
      destinyPresentationNodeDefinition;
  @JsonKey(name: 'DestinyProgressionDefinition')
  Map<int, DestinyProgressionDefinition>? destinyProgressionDefinition;
  @JsonKey(name: 'DestinyProgressionLevelRequirementDefinition')
  Map<int, DestinyProgressionLevelRequirementDefinition>?
      destinyProgressionLevelRequirementDefinition;
  @JsonKey(name: 'DestinyRecordDefinition')
  Map<int, DestinyRecordDefinition>? destinyRecordDefinition;
  @JsonKey(name: 'DestinySeasonDefinition')
  Map<int, DestinySeasonDefinition>? destinySeasonDefinition;
  @JsonKey(name: 'DestinySeasonPassDefinition')
  Map<int, DestinySeasonPassDefinition>? destinySeasonPassDefinition;
  @JsonKey(name: 'DestinySocketCategoryDefinition')
  Map<int, DestinySocketCategoryDefinition>? destinySocketCategoryDefinition;
  @JsonKey(name: 'DestinySocketTypeDefinition')
  Map<int, DestinySocketTypeDefinition>? destinySocketTypeDefinition;
  @JsonKey(name: 'DestinyTraitDefinition')
  Map<int, DestinyTraitDefinition>? destinyTraitDefinition;
  @JsonKey(name: 'DestinyTraitCategoryDefinition')
  Map<int, DestinyTraitCategoryDefinition>? destinyTraitCategoryDefinition;
  @JsonKey(name: 'DestinyVendorDefinition')
  Map<int, DestinyVendorDefinition>? destinyVendorDefinition;
  @JsonKey(name: 'DestinyMilestoneDefinition')
  Map<int, DestinyMilestoneDefinition>? destinyMilestoneDefinition;
  @JsonKey(name: 'DestinyActivityModifierDefinition')
  Map<int, DestinyActivityModifierDefinition>?
      destinyActivityModifierDefinition;
  @JsonKey(name: 'DestinyReportReasonCategoryDefinition')
  Map<int, DestinyReportReasonCategoryDefinition>?
      destinyReportReasonCategoryDefinition;
  @JsonKey(name: 'DestinyArtifactDefinition')
  Map<int, DestinyArtifactDefinition>? destinyArtifactDefinition;
  @JsonKey(name: 'DestinyBreakerTypeDefinition')
  Map<int, DestinyBreakerTypeDefinition>? destinyBreakerTypeDefinition;
  @JsonKey(name: 'DestinyChecklistDefinition')
  Map<int, DestinyChecklistDefinition>? destinyChecklistDefinition;
  @JsonKey(name: 'DestinyHistoricalStatsDefinition')
  Map<int, DestinyHistoricalStatsDefinition>? destinyHistoricalStatsDefinition;
  @JsonKey(name: 'DestinyMilestoneRewardEntryDefinition')
  Map<int, DestinyMilestoneRewardEntryDefinition>?
      destinyMilestoneRewardEntryDefinition;
  @JsonKey(name: 'DestinyEnergyTypeDefinition')
  Map<int, DestinyEnergyTypeDefinition>? destinyEnergyTypeDefinition;

  static setValue<T>(Map<int, T> manifestValue) {
    switch (T) {
      case DestinyPlaceDefinition:
        return ManifestService.manifestParsed.destinyPlaceDefinition =
            manifestValue as Map<int, DestinyPlaceDefinition>?;
      case DestinyActivityDefinition:
        return ManifestService.manifestParsed.destinyActivityDefinition =
            manifestValue as Map<int, DestinyActivityDefinition>?;
      case DestinyActivityTypeDefinition:
        return ManifestService.manifestParsed.destinyActivityTypeDefinition =
            manifestValue as Map<int, DestinyActivityTypeDefinition>?;
      case DestinyClassDefinition:
        return ManifestService.manifestParsed.destinyClassDefinition =
            manifestValue as Map<int, DestinyClassDefinition>?;
      case DestinyGenderDefinition:
        return ManifestService.manifestParsed.destinyGenderDefinition =
            manifestValue as Map<int, DestinyGenderDefinition>?;
      case DestinyInventoryBucketDefinition:
        return ManifestService.manifestParsed.destinyInventoryBucketDefinition =
            manifestValue as Map<int, DestinyInventoryBucketDefinition>?;
      case DestinyRaceDefinition:
        return ManifestService.manifestParsed.destinyRaceDefinition =
            manifestValue as Map<int, DestinyRaceDefinition>?;
      case DestinyTalentGridDefinition:
        return ManifestService.manifestParsed.destinyTalentGridDefinition =
            manifestValue as Map<int, DestinyTalentGridDefinition>?;
      case DestinyUnlockDefinition:
        return ManifestService.manifestParsed.destinyUnlockDefinition =
            manifestValue as Map<int, DestinyUnlockDefinition>?;
      case DestinyMaterialRequirementSetDefinition:
        return ManifestService
                .manifestParsed.destinyMaterialRequirementSetDefinition =
            manifestValue as Map<int, DestinyMaterialRequirementSetDefinition>?;
      case DestinySandboxPerkDefinition:
        return ManifestService.manifestParsed.destinySandboxPerkDefinition =
            manifestValue as Map<int, DestinySandboxPerkDefinition>?;
      case DestinyStatGroupDefinition:
        return ManifestService.manifestParsed.destinyStatGroupDefinition =
            manifestValue as Map<int, DestinyStatGroupDefinition>?;
      case DestinyFactionDefinition:
        return ManifestService.manifestParsed.destinyFactionDefinition =
            manifestValue as Map<int, DestinyFactionDefinition>?;
      case DestinyVendorGroupDefinition:
        return ManifestService.manifestParsed.destinyVendorGroupDefinition =
            manifestValue as Map<int, DestinyVendorGroupDefinition>?;
      case DestinyRewardSourceDefinition:
        return ManifestService.manifestParsed.destinyRewardSourceDefinition =
            manifestValue as Map<int, DestinyRewardSourceDefinition>?;
      case DestinyItemCategoryDefinition:
        return ManifestService.manifestParsed.destinyItemCategoryDefinition =
            manifestValue as Map<int, DestinyItemCategoryDefinition>?;
      case DestinyDamageTypeDefinition:
        return ManifestService.manifestParsed.destinyDamageTypeDefinition =
            manifestValue as Map<int, DestinyDamageTypeDefinition>?;
      case DestinyActivityModeDefinition:
        return ManifestService.manifestParsed.destinyActivityModeDefinition =
            manifestValue as Map<int, DestinyActivityModeDefinition>?;
      case DestinyActivityGraphDefinition:
        return ManifestService.manifestParsed.destinyActivityGraphDefinition =
            manifestValue as Map<int, DestinyActivityGraphDefinition>?;
      case DestinyCollectibleDefinition:
        return ManifestService.manifestParsed.destinyCollectibleDefinition =
            manifestValue as Map<int, DestinyCollectibleDefinition>?;
      case DestinyStatDefinition:
        return ManifestService.manifestParsed.destinyStatDefinition =
            manifestValue as Map<int, DestinyStatDefinition>?;
      case DestinyItemTierTypeDefinition:
        return ManifestService.manifestParsed.destinyItemTierTypeDefinition =
            manifestValue as Map<int, DestinyItemTierTypeDefinition>?;
      case DestinyPresentationNodeDefinition:
        return ManifestService
                .manifestParsed.destinyPresentationNodeDefinition =
            manifestValue as Map<int, DestinyPresentationNodeDefinition>?;
      case DestinyRecordDefinition:
        return ManifestService.manifestParsed.destinyRecordDefinition =
            manifestValue as Map<int, DestinyRecordDefinition>?;
      case DestinyDestinationDefinition:
        return ManifestService.manifestParsed.destinyDestinationDefinition =
            manifestValue as Map<int, DestinyDestinationDefinition>?;
      case DestinyEquipmentSlotDefinition:
        return ManifestService.manifestParsed.destinyEquipmentSlotDefinition =
            manifestValue as Map<int, DestinyEquipmentSlotDefinition>?;
      case DestinyInventoryItemDefinition:
        return ManifestService.manifestParsed.destinyInventoryItemDefinition =
            manifestValue as Map<int, DestinyInventoryItemDefinition>?;
      case DestinyLocationDefinition:
        return ManifestService.manifestParsed.destinyLocationDefinition =
            manifestValue as Map<int, DestinyLocationDefinition>?;
      case DestinyLoreDefinition:
        return ManifestService.manifestParsed.destinyLoreDefinition =
            manifestValue as Map<int, DestinyLoreDefinition>?;
      case DestinyObjectiveDefinition:
        return ManifestService.manifestParsed.destinyObjectiveDefinition =
            manifestValue as Map<int, DestinyObjectiveDefinition>?;
      case DestinyProgressionDefinition:
        return ManifestService.manifestParsed.destinyProgressionDefinition =
            manifestValue as Map<int, DestinyProgressionDefinition>?;
      case DestinyProgressionLevelRequirementDefinition:
        return ManifestService
                .manifestParsed.destinyProgressionLevelRequirementDefinition =
            manifestValue
                as Map<int, DestinyProgressionLevelRequirementDefinition>?;
      case DestinySocketCategoryDefinition:
        return ManifestService.manifestParsed.destinySocketCategoryDefinition =
            manifestValue as Map<int, DestinySocketCategoryDefinition>?;
      case DestinySocketTypeDefinition:
        return ManifestService.manifestParsed.destinySocketTypeDefinition =
            manifestValue as Map<int, DestinySocketTypeDefinition>?;
      case DestinyVendorDefinition:
        return ManifestService.manifestParsed.destinyVendorDefinition =
            manifestValue as Map<int, DestinyVendorDefinition>?;
      case DestinyMilestoneDefinition:
        return ManifestService.manifestParsed.destinyMilestoneDefinition =
            manifestValue as Map<int, DestinyMilestoneDefinition>?;
      case DestinyActivityModifierDefinition:
        return ManifestService
                .manifestParsed.destinyActivityModifierDefinition =
            manifestValue as Map<int, DestinyActivityModifierDefinition>?;
      case DestinyReportReasonCategoryDefinition:
        return ManifestService
                .manifestParsed.destinyReportReasonCategoryDefinition =
            manifestValue as Map<int, DestinyReportReasonCategoryDefinition>?;
      case DestinyPlugSetDefinition:
        return ManifestService.manifestParsed.destinyPlugSetDefinition =
            manifestValue as Map<int, DestinyPlugSetDefinition>?;
      case DestinyChecklistDefinition:
        return ManifestService.manifestParsed.destinyChecklistDefinition =
            manifestValue as Map<int, DestinyChecklistDefinition>?;
      case DestinyHistoricalStatsDefinition:
        return ManifestService.manifestParsed.destinyHistoricalStatsDefinition =
            manifestValue as Map<int, DestinyHistoricalStatsDefinition>?;
      case DestinyMilestoneRewardEntryDefinition:
        return ManifestService
                .manifestParsed.destinyMilestoneRewardEntryDefinition =
            manifestValue as Map<int, DestinyMilestoneRewardEntryDefinition>?;
      case DestinyEnergyTypeDefinition:
        return ManifestService.manifestParsed.destinyEnergyTypeDefinition =
            manifestValue as Map<int, DestinyEnergyTypeDefinition>?;
      case DestinySeasonDefinition:
        return ManifestService.manifestParsed.destinySeasonDefinition =
            manifestValue as Map<int, DestinySeasonDefinition>?;
      case DestinySeasonPassDefinition:
        return ManifestService.manifestParsed.destinySeasonPassDefinition =
            manifestValue as Map<int, DestinySeasonPassDefinition>?;
      case DestinyPowerCapDefinition:
        return ManifestService.manifestParsed.destinyPowerCapDefinition =
            manifestValue as Map<int, DestinyPowerCapDefinition>?;
      case DestinyMetricDefinition:
        return ManifestService.manifestParsed.destinyMetricDefinition =
            manifestValue as Map<int, DestinyMetricDefinition>?;
      case DestinyTraitDefinition:
        return ManifestService.manifestParsed.destinyTraitDefinition =
            manifestValue as Map<int, DestinyTraitDefinition>?;
      default:
        throw Exception('Unknown type');
    }
  }

  static Map<int, T>? getValue<T>() {
    switch (T) {
      case DestinyPlaceDefinition:
        return ManifestService.manifestParsed.destinyPlaceDefinition
            as Map<int, T>?;
      case DestinyActivityDefinition:
        return ManifestService.manifestParsed.destinyActivityDefinition
            as Map<int, T>?;
      case DestinyActivityTypeDefinition:
        return ManifestService.manifestParsed.destinyActivityTypeDefinition
            as Map<int, T>?;
      case DestinyClassDefinition:
        return ManifestService.manifestParsed.destinyClassDefinition
            as Map<int, T>?;
      case DestinyGenderDefinition:
        return ManifestService.manifestParsed.destinyGenderDefinition
            as Map<int, T>?;
      case DestinyInventoryBucketDefinition:
        return ManifestService.manifestParsed.destinyInventoryBucketDefinition
            as Map<int, T>?;
      case DestinyRaceDefinition:
        return ManifestService.manifestParsed.destinyRaceDefinition
            as Map<int, T>?;
      case DestinyTalentGridDefinition:
        return ManifestService.manifestParsed.destinyTalentGridDefinition
            as Map<int, T>?;
      case DestinyUnlockDefinition:
        return ManifestService.manifestParsed.destinyUnlockDefinition
            as Map<int, T>?;
      case DestinyMaterialRequirementSetDefinition:
        return ManifestService.manifestParsed
            .destinyMaterialRequirementSetDefinition as Map<int, T>?;
      case DestinySandboxPerkDefinition:
        return ManifestService.manifestParsed.destinySandboxPerkDefinition
            as Map<int, T>?;
      case DestinyStatGroupDefinition:
        return ManifestService.manifestParsed.destinyStatGroupDefinition
            as Map<int, T>?;
      case DestinyFactionDefinition:
        return ManifestService.manifestParsed.destinyFactionDefinition
            as Map<int, T>?;
      case DestinyVendorGroupDefinition:
        return ManifestService.manifestParsed.destinyVendorGroupDefinition
            as Map<int, T>?;
      case DestinyRewardSourceDefinition:
        return ManifestService.manifestParsed.destinyRewardSourceDefinition
            as Map<int, T>?;
      case DestinyItemCategoryDefinition:
        return ManifestService.manifestParsed.destinyItemCategoryDefinition
            as Map<int, T>?;
      case DestinyDamageTypeDefinition:
        return ManifestService.manifestParsed.destinyDamageTypeDefinition
            as Map<int, T>?;
      case DestinyActivityModeDefinition:
        return ManifestService.manifestParsed.destinyActivityModeDefinition
            as Map<int, T>?;
      case DestinyActivityGraphDefinition:
        return ManifestService.manifestParsed.destinyActivityGraphDefinition
            as Map<int, T>?;
      case DestinyCollectibleDefinition:
        return ManifestService.manifestParsed.destinyCollectibleDefinition
            as Map<int, T>?;
      case DestinyStatDefinition:
        return ManifestService.manifestParsed.destinyStatDefinition
            as Map<int, T>?;
      case DestinyItemTierTypeDefinition:
        return ManifestService.manifestParsed.destinyItemTierTypeDefinition
            as Map<int, T>?;
      case DestinyPresentationNodeDefinition:
        return ManifestService.manifestParsed.destinyPresentationNodeDefinition
            as Map<int, T>?;
      case DestinyRecordDefinition:
        return ManifestService.manifestParsed.destinyRecordDefinition
            as Map<int, T>?;
      case DestinyDestinationDefinition:
        return ManifestService.manifestParsed.destinyDestinationDefinition
            as Map<int, T>?;
      case DestinyEquipmentSlotDefinition:
        return ManifestService.manifestParsed.destinyEquipmentSlotDefinition
            as Map<int, T>?;
      case DestinyInventoryItemDefinition:
        return ManifestService.manifestParsed.destinyInventoryItemDefinition
            as Map<int, T>?;
      case DestinyLocationDefinition:
        return ManifestService.manifestParsed.destinyLocationDefinition
            as Map<int, T>?;
      case DestinyLoreDefinition:
        return ManifestService.manifestParsed.destinyLoreDefinition
            as Map<int, T>?;
      case DestinyObjectiveDefinition:
        return ManifestService.manifestParsed.destinyObjectiveDefinition
            as Map<int, T>?;
      case DestinyProgressionDefinition:
        return ManifestService.manifestParsed.destinyProgressionDefinition
            as Map<int, T>?;
      case DestinyProgressionLevelRequirementDefinition:
        return ManifestService.manifestParsed
            .destinyProgressionLevelRequirementDefinition as Map<int, T>?;
      case DestinySocketCategoryDefinition:
        return ManifestService.manifestParsed.destinySocketCategoryDefinition
            as Map<int, T>?;
      case DestinySocketTypeDefinition:
        return ManifestService.manifestParsed.destinySocketTypeDefinition
            as Map<int, T>?;
      case DestinyVendorDefinition:
        return ManifestService.manifestParsed.destinyVendorDefinition
            as Map<int, T>?;
      case DestinyMilestoneDefinition:
        return ManifestService.manifestParsed.destinyMilestoneDefinition
            as Map<int, T>?;
      case DestinyActivityModifierDefinition:
        return ManifestService.manifestParsed.destinyActivityModifierDefinition
            as Map<int, T>?;
      case DestinyReportReasonCategoryDefinition:
        return ManifestService.manifestParsed
            .destinyReportReasonCategoryDefinition as Map<int, T>?;
      case DestinyPlugSetDefinition:
        return ManifestService.manifestParsed.destinyPlugSetDefinition
            as Map<int, T>?;
      case DestinyChecklistDefinition:
        return ManifestService.manifestParsed.destinyChecklistDefinition
            as Map<int, T>?;
      case DestinyHistoricalStatsDefinition:
        return ManifestService.manifestParsed.destinyHistoricalStatsDefinition
            as Map<int, T>?;
      case DestinyMilestoneRewardEntryDefinition:
        return ManifestService.manifestParsed
            .destinyMilestoneRewardEntryDefinition as Map<int, T>?;
      case DestinyEnergyTypeDefinition:
        return ManifestService.manifestParsed.destinyEnergyTypeDefinition
            as Map<int, T>?;
      case DestinySeasonDefinition:
        return ManifestService.manifestParsed.destinySeasonDefinition
            as Map<int, T>?;
      case DestinySeasonPassDefinition:
        return ManifestService.manifestParsed.destinySeasonPassDefinition
            as Map<int, T>?;
      case DestinyPowerCapDefinition:
        return ManifestService.manifestParsed.destinyPowerCapDefinition
            as Map<int, T>?;
      case DestinyMetricDefinition:
        return ManifestService.manifestParsed.destinyMetricDefinition
            as Map<int, T>?;
      case DestinyTraitDefinition:
        return ManifestService.manifestParsed.destinyTraitDefinition
            as Map<int, T>?;
      default:
        throw Exception('Unknown type');
    }
  }

  Map<String, dynamic> toJson() => _$AllDestinyManifestComponentsToJson(this);
}
