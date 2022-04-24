import 'dart:convert';

import 'package:bungie_api/destiny2.dart';
import 'package:isar/isar.dart';
import 'package:quria/data/models/bungie_api_dart/hyperlink_reference.dart';

class MapConverter extends TypeConverter<Map<String, String>?, String?> {
  const MapConverter();

  @override
  Map<String, String>? fromIsar(String? object) {
    if (object == null) return null;
    return Map<String, String>.from(json.decode(object));
  }

  @override
  String? toIsar(Map<String, String>? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyClassConverter extends TypeConverter<DestinyClass?, int?> {
  const DestinyClassConverter();

  @override
  DestinyClass? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDestinyClass(object);
  }

  @override
  int? toIsar(DestinyClass? object) {
    if (object == null) return null;
    return encodeDestinyClass(object);
  }
}

class DestinyScopeConverter extends TypeConverter<DestinyScope?, int?> {
  const DestinyScopeConverter();

  @override
  DestinyScope? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDestinyScope(object);
  }

  @override
  int? toIsar(DestinyScope? object) {
    if (object == null) return null;
    return encodeDestinyScope(object);
  }
}

class DestinyStatCategoryConverter
    extends TypeConverter<DestinyStatCategory?, int?> {
  const DestinyStatCategoryConverter();

  @override
  DestinyStatCategory? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDestinyStatCategory(object);
  }

  @override
  int? toIsar(DestinyStatCategory? object) {
    if (object == null) return null;
    return encodeDestinyStatCategory(object);
  }
}

class DestinyPresentationNodeTypeConverter
    extends TypeConverter<DestinyPresentationNodeType?, int?> {
  const DestinyPresentationNodeTypeConverter();

  @override
  DestinyPresentationNodeType? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDestinyPresentationNodeType(object);
  }

  @override
  int? toIsar(DestinyPresentationNodeType? object) {
    if (object == null) return null;
    return encodeDestinyPresentationNodeType(object);
  }
}

class BucketScopeConverter extends TypeConverter<BucketScope?, int?> {
  const BucketScopeConverter();

  @override
  BucketScope? fromIsar(int? object) {
    if (object == null) return null;
    return decodeBucketScope(object);
  }

  @override
  int? toIsar(BucketScope? object) {
    if (object == null) return null;
    return encodeBucketScope(object);
  }
}

class BucketCategoryConverter extends TypeConverter<BucketCategory?, int?> {
  const BucketCategoryConverter();

  @override
  BucketCategory? fromIsar(int? object) {
    if (object == null) return null;
    return decodeBucketCategory(object);
  }

  @override
  int? toIsar(BucketCategory? object) {
    if (object == null) return null;
    return encodeBucketCategory(object);
  }
}

class ItemLocationConverter extends TypeConverter<ItemLocation?, int?> {
  const ItemLocationConverter();

  @override
  ItemLocation? fromIsar(int? object) {
    if (object == null) return null;
    return decodeItemLocation(object);
  }

  @override
  int? toIsar(ItemLocation? object) {
    if (object == null) return null;
    return encodeItemLocation(object);
  }
}

class DamageTypeConverter extends TypeConverter<DamageType?, int?> {
  const DamageTypeConverter();

  @override
  DamageType? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDamageType(object);
  }

  @override
  int? toIsar(DamageType? object) {
    if (object == null) return null;
    return encodeDamageType(object);
  }
}

class SpecialItemTypeConverter extends TypeConverter<SpecialItemType?, int?> {
  const SpecialItemTypeConverter();

  @override
  SpecialItemType? fromIsar(int? object) {
    if (object == null) return null;
    return decodeSpecialItemType(object);
  }

  @override
  int? toIsar(SpecialItemType? object) {
    if (object == null) return null;
    return encodeSpecialItemType(object);
  }
}

class DestinyItemTypeConverter extends TypeConverter<DestinyItemType?, int?> {
  const DestinyItemTypeConverter();

  @override
  DestinyItemType? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDestinyItemType(object);
  }

  @override
  int? toIsar(DestinyItemType? object) {
    if (object == null) return null;
    return encodeDestinyItemType(object);
  }
}

class DestinyItemSubTypeConverter
    extends TypeConverter<DestinyItemSubType?, int?> {
  const DestinyItemSubTypeConverter();

  @override
  DestinyItemSubType? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDestinyItemSubType(object);
  }

  @override
  int? toIsar(DestinyItemSubType? object) {
    if (object == null) return null;
    return encodeDestinyItemSubType(object);
  }
}

class DestinyPresentationScreenStyleConverter
    extends TypeConverter<DestinyPresentationScreenStyle?, int?> {
  const DestinyPresentationScreenStyleConverter();

  @override
  DestinyPresentationScreenStyle? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDestinyPresentationScreenStyle(object);
  }

  @override
  int? toIsar(DestinyPresentationScreenStyle? object) {
    if (object == null) return null;
    return encodeDestinyPresentationScreenStyle(object);
  }
}

class DestinyPresentationDisplayStyleConverter
    extends TypeConverter<DestinyPresentationDisplayStyle?, int?> {
  const DestinyPresentationDisplayStyleConverter();

  @override
  DestinyPresentationDisplayStyle? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDestinyPresentationDisplayStyle(object);
  }

  @override
  int? toIsar(DestinyPresentationDisplayStyle? object) {
    if (object == null) return null;
    return encodeDestinyPresentationDisplayStyle(object);
  }
}

class DestinyBreakerTypeConverter
    extends TypeConverter<DestinyBreakerType?, int?> {
  const DestinyBreakerTypeConverter();

  @override
  DestinyBreakerType? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDestinyBreakerType(object);
  }

  @override
  int? toIsar(DestinyBreakerType? object) {
    if (object == null) return null;
    return encodeDestinyBreakerType(object);
  }
}

class DestinyEnergyTypeConverter
    extends TypeConverter<DestinyEnergyType?, int?> {
  const DestinyEnergyTypeConverter();

  @override
  DestinyEnergyType? fromIsar(int? object) {
    if (object == null) return null;
    return decodeDestinyEnergyType(object);
  }

  @override
  int? toIsar(DestinyEnergyType? object) {
    if (object == null) return null;
    return encodeDestinyEnergyType(object);
  }
}

class DestinyDisplayPropertiesDefinitionConverter
    extends TypeConverter<DestinyDisplayPropertiesDefinition?, String?> {
  const DestinyDisplayPropertiesDefinitionConverter();

  @override
  DestinyDisplayPropertiesDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyDisplayPropertiesDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyDisplayPropertiesDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyCollectibleAcquisitionBlockConverter
    extends TypeConverter<DestinyCollectibleAcquisitionBlock?, String?> {
  const DestinyCollectibleAcquisitionBlockConverter();

  @override
  DestinyCollectibleAcquisitionBlock? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyCollectibleAcquisitionBlock.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyCollectibleAcquisitionBlock? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyCollectibleStateBlockConverter
    extends TypeConverter<DestinyCollectibleStateBlock?, String?> {
  const DestinyCollectibleStateBlockConverter();

  @override
  DestinyCollectibleStateBlock? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyCollectibleStateBlock.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyCollectibleStateBlock? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyPresentationChildBlockConverter
    extends TypeConverter<DestinyPresentationChildBlock?, String?> {
  const DestinyPresentationChildBlockConverter();

  @override
  DestinyPresentationChildBlock? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyPresentationChildBlock.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyPresentationChildBlock? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyColorConverter extends TypeConverter<DestinyColor?, String?> {
  const DestinyColorConverter();

  @override
  DestinyColor? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyColor.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyColor? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemActionBlockDefinitionConverter
    extends TypeConverter<DestinyItemActionBlockDefinition?, String?> {
  const DestinyItemActionBlockDefinitionConverter();

  @override
  DestinyItemActionBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemActionBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemActionBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemCraftingBlockDefinitionConverter
    extends TypeConverter<DestinyItemCraftingBlockDefinition?, String?> {
  const DestinyItemCraftingBlockDefinitionConverter();

  @override
  DestinyItemCraftingBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemCraftingBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemCraftingBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemInventoryBlockDefinitionConverter
    extends TypeConverter<DestinyItemInventoryBlockDefinition?, String?> {
  const DestinyItemInventoryBlockDefinitionConverter();

  @override
  DestinyItemInventoryBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemInventoryBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemInventoryBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemSetBlockDefinitionConverter
    extends TypeConverter<DestinyItemSetBlockDefinition?, String?> {
  const DestinyItemSetBlockDefinitionConverter();

  @override
  DestinyItemSetBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemSetBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemSetBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemStatBlockDefinitionConverter
    extends TypeConverter<DestinyItemStatBlockDefinition?, String?> {
  const DestinyItemStatBlockDefinitionConverter();

  @override
  DestinyItemStatBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemStatBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemStatBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemTranslationBlockDefinitionConverter
    extends TypeConverter<DestinyItemTranslationBlockDefinition?, String?> {
  const DestinyItemTranslationBlockDefinitionConverter();

  @override
  DestinyItemTranslationBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemTranslationBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemTranslationBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyEquippingBlockDefinitionConverter
    extends TypeConverter<DestinyEquippingBlockDefinition?, String?> {
  const DestinyEquippingBlockDefinitionConverter();

  @override
  DestinyEquippingBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyEquippingBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyEquippingBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemPreviewBlockDefinitionConverter
    extends TypeConverter<DestinyItemPreviewBlockDefinition?, String?> {
  const DestinyItemPreviewBlockDefinitionConverter();

  @override
  DestinyItemPreviewBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemPreviewBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemPreviewBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemQualityBlockDefinitionConverter
    extends TypeConverter<DestinyItemQualityBlockDefinition?, String?> {
  const DestinyItemQualityBlockDefinitionConverter();

  @override
  DestinyItemQualityBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemQualityBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemQualityBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemValueBlockDefinitionConverter
    extends TypeConverter<DestinyItemValueBlockDefinition?, String?> {
  const DestinyItemValueBlockDefinitionConverter();

  @override
  DestinyItemValueBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemValueBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemValueBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemSourceBlockDefinitionConverter
    extends TypeConverter<DestinyItemSourceBlockDefinition?, String?> {
  const DestinyItemSourceBlockDefinitionConverter();

  @override
  DestinyItemSourceBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemSourceBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemSourceBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemObjectiveBlockDefinitionConverter
    extends TypeConverter<DestinyItemObjectiveBlockDefinition?, String?> {
  const DestinyItemObjectiveBlockDefinitionConverter();

  @override
  DestinyItemObjectiveBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemObjectiveBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemObjectiveBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemMetricBlockDefinitionConverter
    extends TypeConverter<DestinyItemMetricBlockDefinition?, String?> {
  const DestinyItemMetricBlockDefinitionConverter();

  @override
  DestinyItemMetricBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemMetricBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemMetricBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemPlugDefinitionConverter
    extends TypeConverter<DestinyItemPlugDefinition?, String?> {
  const DestinyItemPlugDefinitionConverter();

  @override
  DestinyItemPlugDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemPlugDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemPlugDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemGearsetBlockDefinitionConverter
    extends TypeConverter<DestinyItemGearsetBlockDefinition?, String?> {
  const DestinyItemGearsetBlockDefinitionConverter();

  @override
  DestinyItemGearsetBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemGearsetBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemGearsetBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemSackBlockDefinitionConverter
    extends TypeConverter<DestinyItemSackBlockDefinition?, String?> {
  const DestinyItemSackBlockDefinitionConverter();

  @override
  DestinyItemSackBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemSackBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemSackBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemSocketBlockDefinitionConverter
    extends TypeConverter<DestinyItemSocketBlockDefinition?, String?> {
  const DestinyItemSocketBlockDefinitionConverter();

  @override
  DestinyItemSocketBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemSocketBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemSocketBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemSummaryBlockDefinitionConverter
    extends TypeConverter<DestinyItemSummaryBlockDefinition?, String?> {
  const DestinyItemSummaryBlockDefinitionConverter();

  @override
  DestinyItemSummaryBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemSummaryBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemSummaryBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyItemTalentGridBlockDefinitionConverter
    extends TypeConverter<DestinyItemTalentGridBlockDefinition?, String?> {
  const DestinyItemTalentGridBlockDefinitionConverter();

  @override
  DestinyItemTalentGridBlockDefinition? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyItemTalentGridBlockDefinition.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyItemTalentGridBlockDefinition? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyPresentationNodeChildrenBlockConverter
    extends TypeConverter<DestinyPresentationNodeChildrenBlock?, String?> {
  const DestinyPresentationNodeChildrenBlockConverter();

  @override
  DestinyPresentationNodeChildrenBlock? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyPresentationNodeChildrenBlock.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyPresentationNodeChildrenBlock? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyPresentationNodeRequirementsBlockConverter
    extends TypeConverter<DestinyPresentationNodeRequirementsBlock?, String?> {
  const DestinyPresentationNodeRequirementsBlockConverter();

  @override
  DestinyPresentationNodeRequirementsBlock? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyPresentationNodeRequirementsBlock.fromJson(
        json.decode(object));
  }

  @override
  String? toIsar(DestinyPresentationNodeRequirementsBlock? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

class DestinyTalentNodeStepGroupsConverter
    extends TypeConverter<DestinyTalentNodeStepGroups?, String?> {
  const DestinyTalentNodeStepGroupsConverter();

  @override
  DestinyTalentNodeStepGroups? fromIsar(String? object) {
    if (object == null) return null;
    return DestinyTalentNodeStepGroups.fromJson(json.decode(object));
  }

  @override
  String? toIsar(DestinyTalentNodeStepGroups? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

// MapClass

class DestinyTalentExclusiveGroupMapConverter
    extends TypeConverter<Map<String, DestinyTalentExclusiveGroup>?, String?> {
  const DestinyTalentExclusiveGroupMapConverter();

  @override
  Map<String, DestinyTalentExclusiveGroup>? fromIsar(String? object) {
    if (object == null) return null;
    Map<String, DestinyTalentExclusiveGroup> map = {};
    for (var item in Map<String, dynamic>.from(json.decode(object)).entries) {
      map[item.key] = DestinyTalentExclusiveGroup.fromJson(item.value);
    }
    return map;
  }

  @override
  String? toIsar(Map<String, DestinyTalentExclusiveGroup>? object) {
    if (object == null) return null;
    return json.encode(object);
  }
}

// lists
class DestinyItemInvestmentStatDefinitionListConverter extends TypeConverter<
    List<DestinyItemInvestmentStatDefinition>?, List<String>?> {
  const DestinyItemInvestmentStatDefinitionListConverter();

  @override
  List<DestinyItemInvestmentStatDefinition>? fromIsar(List<String>? object) {
    if (object == null) return null;
    List<DestinyItemInvestmentStatDefinition> list = [];
    for (String item in object) {
      list.add(DestinyItemInvestmentStatDefinition.fromJson(json.decode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(List<DestinyItemInvestmentStatDefinition>? object) {
    if (object == null) return null;
    List<String> list = [];
    for (DestinyItemInvestmentStatDefinition item in object) {
      list.add(json.encode(item.toJson()));
    }
    return list;
  }
}

class DestinyItemPerkEntryDefinitionListConverter extends TypeConverter<
    List<DestinyItemPerkEntryDefinition>?, List<String>?> {
  const DestinyItemPerkEntryDefinitionListConverter();

  @override
  List<DestinyItemPerkEntryDefinition>? fromIsar(List<String>? object) {
    if (object == null) return null;
    List<DestinyItemPerkEntryDefinition> list = [];
    for (String item in object) {
      list.add(DestinyItemPerkEntryDefinition.fromJson(json.decode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(List<DestinyItemPerkEntryDefinition>? object) {
    if (object == null) return null;
    List<String> list = [];
    for (DestinyItemPerkEntryDefinition item in object) {
      list.add(json.encode(item.toJson()));
    }
    return list;
  }
}

class DestinyAnimationReferenceListConverter
    extends TypeConverter<List<DestinyAnimationReference>?, List<String>?> {
  const DestinyAnimationReferenceListConverter();

  @override
  List<DestinyAnimationReference>? fromIsar(List<String>? object) {
    if (object == null) return null;
    List<DestinyAnimationReference> list = [];
    for (String item in object) {
      list.add(DestinyAnimationReference.fromJson(json.decode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(List<DestinyAnimationReference>? object) {
    if (object == null) return null;
    List<String> list = [];
    for (DestinyAnimationReference item in object) {
      list.add(json.encode(item.toJson()));
    }
    return list;
  }
}

class HyperlinkReferenceListConverter
    extends TypeConverter<List<HyperlinkReference>?, List<String>?> {
  const HyperlinkReferenceListConverter();

  @override
  List<HyperlinkReference>? fromIsar(List<String>? object) {
    if (object == null) return null;
    List<HyperlinkReference> list = [];
    for (String item in object) {
      list.add(HyperlinkReference.fromJson(json.decode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(List<HyperlinkReference>? object) {
    if (object == null) return null;
    List<String> list = [];
    for (HyperlinkReference item in object) {
      list.add(json.encode(item.toJson()));
    }
    return list;
  }
}

class DamageTypeListConverter
    extends TypeConverter<List<DamageType>?, List<int>?> {
  const DamageTypeListConverter();

  @override
  List<DamageType>? fromIsar(List<int>? object) {
    if (object == null) return null;
    List<DamageType> list = [];
    for (int? item in object) {
      list.add(decodeDamageType(item)!);
    }
    return list;
  }

  @override
  List<int>? toIsar(List<DamageType>? object) {
    if (object == null) return null;
    List<int> list = [];
    for (DamageType item in object) {
      list.add(encodeDamageType(item)!);
    }
    return list;
  }
}

class DestinyItemTooltipNotificationListConverter extends TypeConverter<
    List<DestinyItemTooltipNotification>?, List<String>?> {
  const DestinyItemTooltipNotificationListConverter();

  @override
  List<DestinyItemTooltipNotification>? fromIsar(List<String>? object) {
    if (object == null) return null;
    List<DestinyItemTooltipNotification> list = [];
    for (String item in object) {
      list.add(DestinyItemTooltipNotification.fromJson(json.decode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(List<DestinyItemTooltipNotification>? object) {
    if (object == null) return null;
    List<String> list = [];
    for (DestinyItemTooltipNotification item in object) {
      list.add(json.encode(item.toJson()));
    }
    return list;
  }
}

class DestinyArtDyeReferenceListConverter
    extends TypeConverter<List<DestinyArtDyeReference>?, List<String>?> {
  const DestinyArtDyeReferenceListConverter();

  @override
  List<DestinyArtDyeReference>? fromIsar(List<String>? object) {
    if (object == null) return null;
    List<DestinyArtDyeReference> list = [];
    for (String item in object) {
      list.add(DestinyArtDyeReference.fromJson(json.decode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(List<DestinyArtDyeReference>? object) {
    if (object == null) return null;
    List<String> list = [];
    for (DestinyArtDyeReference item in object) {
      list.add(json.encode(item.toJson()));
    }
    return list;
  }
}

class DestinyItemSocketEntryPlugItemRandomizedDefinitionListConverter
    extends TypeConverter<
        List<DestinyItemSocketEntryPlugItemRandomizedDefinition>?,
        List<String>?> {
  const DestinyItemSocketEntryPlugItemRandomizedDefinitionListConverter();

  @override
  List<DestinyItemSocketEntryPlugItemRandomizedDefinition>? fromIsar(
      List<String>? object) {
    if (object == null) return null;
    List<DestinyItemSocketEntryPlugItemRandomizedDefinition> list = [];
    for (String item in object) {
      list.add(DestinyItemSocketEntryPlugItemRandomizedDefinition.fromJson(
          json.decode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(
      List<DestinyItemSocketEntryPlugItemRandomizedDefinition>? object) {
    if (object == null) return null;
    List<String> list = [];
    for (DestinyItemSocketEntryPlugItemRandomizedDefinition item in object) {
      list.add(json.encode(item.toJson()));
    }
    return list;
  }
}

class DestinyTalentNodeCategoryListConverter
    extends TypeConverter<List<DestinyTalentNodeCategory>?, List<String>?> {
  const DestinyTalentNodeCategoryListConverter();

  @override
  List<DestinyTalentNodeCategory>? fromIsar(List<String>? object) {
    if (object == null) return null;
    List<DestinyTalentNodeCategory> list = [];
    for (String item in object) {
      list.add(DestinyTalentNodeCategory.fromJson(json.decode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(List<DestinyTalentNodeCategory>? object) {
    if (object == null) return null;
    List<String> list = [];
    for (DestinyTalentNodeCategory item in object) {
      list.add(json.encode(item.toJson()));
    }
    return list;
  }
}

class DestinyTalentNodeExclusiveSetDefinitionListConverter
    extends TypeConverter<List<DestinyTalentNodeExclusiveSetDefinition>?,
        List<String>?> {
  const DestinyTalentNodeExclusiveSetDefinitionListConverter();

  @override
  List<DestinyTalentNodeExclusiveSetDefinition>? fromIsar(
      List<String>? object) {
    if (object == null) return null;
    List<DestinyTalentNodeExclusiveSetDefinition> list = [];
    for (String item in object) {
      list.add(
          DestinyTalentNodeExclusiveSetDefinition.fromJson(json.decode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(List<DestinyTalentNodeExclusiveSetDefinition>? object) {
    if (object == null) return null;
    List<String> list = [];
    for (DestinyTalentNodeExclusiveSetDefinition item in object) {
      list.add(json.encode(item.toJson()));
    }
    return list;
  }
}

class DestinyTalentNodeDefinitionListConverter
    extends TypeConverter<List<DestinyTalentNodeDefinition>?, List<String>?> {
  const DestinyTalentNodeDefinitionListConverter();

  @override
  List<DestinyTalentNodeDefinition>? fromIsar(List<String>? object) {
    if (object == null) return null;
    List<DestinyTalentNodeDefinition> list = [];
    for (String item in object) {
      list.add(DestinyTalentNodeDefinition.fromJson(json.decode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(List<DestinyTalentNodeDefinition>? object) {
    if (object == null) return null;
    List<String> list = [];
    for (DestinyTalentNodeDefinition item in object) {
      list.add(json.encode(item.toJson()));
    }
    return list;
  }
}
