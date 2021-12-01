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
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
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
  @JsonKey(name: 'DestinyEnergyTypeDefinition')
  Map<int, DestinyEnergyTypeDefinition>? destinyEnergyTypeDefinition;

  Map<String, dynamic> toJson() => _$AllDestinyManifestComponentsToJson(this);
}
