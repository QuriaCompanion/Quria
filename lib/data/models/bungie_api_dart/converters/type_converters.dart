import 'package:bungie_api/destiny2.dart';
import 'package:quria/data/models/bungie_api_dart/hyperlink_reference.dart';

class JsonConverter {
  static Map<Type, Function> fromJson = {
    // classes
    DestinyDisplayPropertiesDefinition: (json) =>
        DestinyDisplayPropertiesDefinition.fromJson(json),
    DestinyCollectibleAcquisitionBlock: (json) =>
        DestinyCollectibleAcquisitionBlock.fromJson(json),
    DestinyCollectibleStateBlock: (json) =>
        DestinyCollectibleStateBlock.fromJson(json),
    DestinyPresentationChildBlock: (json) =>
        DestinyPresentationChildBlock.fromJson(json),
    DestinyArtDyeReference: (json) => DestinyArtDyeReference.fromJson(json),
    DestinyItemTooltipNotification: (json) =>
        DestinyItemTooltipNotification.fromJson(json),
    DestinyColor: (json) => DestinyColor.fromJson(json),
    DestinyItemActionBlockDefinition: (json) =>
        DestinyItemActionBlockDefinition.fromJson(json),
    DestinyItemCraftingBlockDefinition: (json) =>
        DestinyItemCraftingBlockDefinition.fromJson(json),
    DestinyItemInventoryBlockDefinition: (json) =>
        DestinyItemInventoryBlockDefinition.fromJson(json),
    DestinyItemSetBlockDefinition: (json) =>
        DestinyItemSetBlockDefinition.fromJson(json),
    DestinyItemStatBlockDefinition: (json) =>
        DestinyItemStatBlockDefinition.fromJson(json),
    DestinyEquippingBlockDefinition: (json) =>
        DestinyEquippingBlockDefinition.fromJson(json),
    DestinyItemTranslationBlockDefinition: (json) =>
        DestinyItemTranslationBlockDefinition.fromJson(json),
    DestinyItemPreviewBlockDefinition: (json) =>
        DestinyItemPreviewBlockDefinition.fromJson(json),
    DestinyItemQualityBlockDefinition: (json) =>
        DestinyItemQualityBlockDefinition.fromJson(json),
    DestinyItemValueBlockDefinition: (json) =>
        DestinyItemValueBlockDefinition.fromJson(json),
    DestinyItemSourceBlockDefinition: (json) =>
        DestinyItemSourceBlockDefinition.fromJson(json),
    DestinyItemObjectiveBlockDefinition: (json) =>
        DestinyItemObjectiveBlockDefinition.fromJson(json),
    DestinyItemMetricBlockDefinition: (json) =>
        DestinyItemMetricBlockDefinition.fromJson(json),
    DestinyItemPlugDefinition: (json) =>
        DestinyItemPlugDefinition.fromJson(json),
    DestinyItemGearsetBlockDefinition: (json) =>
        DestinyItemGearsetBlockDefinition.fromJson(json),
    DestinyItemSackBlockDefinition: (json) =>
        DestinyItemSackBlockDefinition.fromJson(json),
    DestinyItemSocketBlockDefinition: (json) =>
        DestinyItemSocketBlockDefinition.fromJson(json),
    DestinyItemSummaryBlockDefinition: (json) =>
        DestinyItemSummaryBlockDefinition.fromJson(json),
    DestinyItemTalentGridBlockDefinition: (json) =>
        DestinyItemTalentGridBlockDefinition.fromJson(json),
    DestinyItemInvestmentStatDefinition: (json) =>
        DestinyItemInvestmentStatDefinition.fromJson(json),
    DestinyItemPerkEntryDefinition: (json) =>
        DestinyItemPerkEntryDefinition.fromJson(json),
    HyperlinkReference: (json) => HyperlinkReference.fromJson(json),
    DestinyAnimationReference: (json) =>
        DestinyAnimationReference.fromJson(json),
    DestinyItemSocketEntryPlugItemRandomizedDefinition: (json) =>
        DestinyItemSocketEntryPlugItemRandomizedDefinition.fromJson(json),
    DestinyPresentationNodeChildrenBlock: (json) =>
        DestinyPresentationNodeChildrenBlock.fromJson(json),
    DestinyPresentationNodeRequirementsBlock: (json) =>
        DestinyPresentationNodeRequirementsBlock.fromJson(json),
    DestinyTalentNodeStepGroups: (json) =>
        DestinyTalentNodeStepGroups.fromJson(json),
    DestinyTalentNodeDefinition: (json) =>
        DestinyTalentNodeDefinition.fromJson(json),
    DestinyTalentNodeExclusiveSetDefinition: (json) =>
        DestinyTalentNodeExclusiveSetDefinition.fromJson(json),
    DestinyTalentNodeCategory: (json) =>
        DestinyTalentNodeCategory.fromJson(json),
    // enums
    DestinyClass: (json) => decodeDestinyClass(json),
    DestinyPresentationNodeType: (json) =>
        decodeDestinyPresentationNodeType(json),
    DestinyScope: (json) => decodeDestinyScope(json),
    DamageType: (json) => decodeDamageType(json),
    DestinyEnergyType: (json) => decodeDestinyEnergyType(json),
    SpecialItemType: (json) => decodeSpecialItemType(json),
    DestinyItemType: (json) => decodeDestinyItemType(json),
    DestinyItemSubType: (json) => decodeDestinyItemSubType(json),
    DestinyBreakerType: (json) => decodeDestinyBreakerType(json),
    DestinyPresentationDisplayStyle: (json) =>
        decodeDestinyPresentationDisplayStyle(json),
    DestinyPresentationScreenStyle: (json) =>
        decodeDestinyPresentationScreenStyle(json),
    DestinyStatAggregationType: (json) =>
        decodeDestinyStatAggregationType(json),
    DestinyStatCategory: (json) => decodeDestinyStatCategory(json),
  };
  static Map<Type, Function> toJson = {
    // classes
    DestinyDisplayPropertiesDefinition:
        (DestinyDisplayPropertiesDefinition json) => json.toJson(),
    DestinyCollectibleAcquisitionBlock:
        (DestinyCollectibleAcquisitionBlock json) => json.toJson(),
    DestinyCollectibleStateBlock: (DestinyCollectibleStateBlock json) =>
        json.toJson(),
    DestinyPresentationChildBlock: (json) =>
        DestinyPresentationChildBlock.fromJson(json),
    DestinyArtDyeReference: (DestinyArtDyeReference json) => json.toJson(),
    DestinyItemTooltipNotification: (DestinyItemTooltipNotification json) =>
        json.toJson(),
    DestinyColor: (DestinyColor json) => json.toJson(),
    DestinyItemActionBlockDefinition: (DestinyItemActionBlockDefinition json) =>
        json.toJson(),
    DestinyItemCraftingBlockDefinition:
        (DestinyItemCraftingBlockDefinition json) => json.toJson(),
    DestinyItemInventoryBlockDefinition:
        (DestinyItemInventoryBlockDefinition json) => json.toJson(),
    DestinyItemSetBlockDefinition: (DestinyItemSetBlockDefinition json) =>
        json.toJson(),
    DestinyItemStatBlockDefinition: (DestinyItemStatBlockDefinition json) =>
        json.toJson(),
    DestinyEquippingBlockDefinition: (DestinyEquippingBlockDefinition json) =>
        json.toJson(),
    DestinyItemTranslationBlockDefinition:
        (DestinyItemTranslationBlockDefinition json) => json.toJson(),
    DestinyItemPreviewBlockDefinition:
        (DestinyItemPreviewBlockDefinition json) => json.toJson(),
    DestinyItemQualityBlockDefinition:
        (DestinyItemQualityBlockDefinition json) => json.toJson(),
    DestinyItemValueBlockDefinition: (DestinyItemValueBlockDefinition json) =>
        json.toJson(),
    DestinyItemSourceBlockDefinition: (DestinyItemSourceBlockDefinition json) =>
        json.toJson(),
    DestinyItemObjectiveBlockDefinition:
        (DestinyItemObjectiveBlockDefinition json) => json.toJson(),
    DestinyItemMetricBlockDefinition: (DestinyItemMetricBlockDefinition json) =>
        json.toJson(),
    DestinyItemPlugDefinition: (DestinyItemPlugDefinition json) =>
        json.toJson(),
    DestinyItemGearsetBlockDefinition:
        (DestinyItemGearsetBlockDefinition json) => json.toJson(),
    DestinyItemSackBlockDefinition: (DestinyItemSackBlockDefinition json) =>
        json.toJson(),
    DestinyItemSocketBlockDefinition: (DestinyItemSocketBlockDefinition json) =>
        json.toJson(),
    DestinyItemSummaryBlockDefinition:
        (DestinyItemSummaryBlockDefinition json) => json.toJson(),
    DestinyItemTalentGridBlockDefinition:
        (DestinyItemTalentGridBlockDefinition json) => json.toJson(),
    DestinyItemInvestmentStatDefinition:
        (DestinyItemInvestmentStatDefinition json) => json.toJson(),
    DestinyItemPerkEntryDefinition: (DestinyItemPerkEntryDefinition json) =>
        json.toJson(),
    DestinyAnimationReference: (DestinyAnimationReference json) =>
        json.toJson(),
    HyperlinkReference: (HyperlinkReference json) => json.toJson(),
    DestinyItemSocketEntryPlugItemRandomizedDefinition:
        (DestinyItemSocketEntryPlugItemRandomizedDefinition json) =>
            json.toJson(),
    DestinyPresentationNodeRequirementsBlock:
        (DestinyPresentationNodeRequirementsBlock json) => json.toJson(),
    DestinyTalentNodeStepGroups: (DestinyTalentNodeStepGroups json) =>
        json.toJson(),
    DestinyTalentNodeDefinition: (DestinyTalentNodeDefinition json) =>
        json.toJson(),
    DestinyTalentNodeExclusiveSetDefinition:
        (DestinyTalentNodeExclusiveSetDefinition json) => json.toJson(),
    DestinyTalentNodeCategory: (DestinyTalentNodeCategory json) =>
        json.toJson(),

    //enums
    DestinyClass: (DestinyClass json) => encodeDestinyClass(json),
    DestinyPresentationNodeType: (DestinyPresentationNodeType json) =>
        encodeDestinyPresentationNodeType(json),
    DestinyScope: (DestinyScope json) => encodeDestinyScope(json),
    DamageType: (DamageType json) => encodeDamageType(json),
    DestinyEnergyType: (DestinyEnergyType json) =>
        encodeDestinyEnergyType(json),
    SpecialItemType: (SpecialItemType json) => encodeSpecialItemType(json),
    DestinyItemType: (DestinyItemType json) => encodeDestinyItemType(json),
    DestinyItemSubType: (DestinyItemSubType json) =>
        encodeDestinyItemSubType(json),
    DestinyBreakerType: (DestinyBreakerType json) =>
        encodeDestinyBreakerType(json),
    DestinyPresentationDisplayStyle: (DestinyPresentationDisplayStyle json) =>
        encodeDestinyPresentationDisplayStyle(json),
    DestinyPresentationScreenStyle: (DestinyPresentationScreenStyle json) =>
        encodeDestinyPresentationScreenStyle(json),
    DestinyStatAggregationType: (DestinyStatAggregationType json) =>
        encodeDestinyStatAggregationType(json),
    DestinyStatCategory: (DestinyStatCategory json) =>
        encodeDestinyStatCategory(json),
  };
}
