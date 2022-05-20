// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_inventory_item_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDestinyInventoryItemDefinitionCollection on Isar {
  IsarCollection<DestinyInventoryItemDefinition>
      get destinyInventoryItemDefinitions => getCollection();
}

const DestinyInventoryItemDefinitionSchema = CollectionSchema(
  name: 'DestinyInventoryItemDefinition',
  schema:
      '{"name":"DestinyInventoryItemDefinition","idName":"hash","properties":[{"name":"action","type":"String"},{"name":"allowActions","type":"Bool"},{"name":"animations","type":"StringList"},{"name":"backgroundColor","type":"String"},{"name":"breakerType","type":"Long"},{"name":"breakerTypeHash","type":"Long"},{"name":"classType","type":"Long"},{"name":"collectibleHash","type":"Long"},{"name":"crafting","type":"String"},{"name":"damageTypeHashes","type":"LongList"},{"name":"damageTypes","type":"LongList"},{"name":"defaultDamageType","type":"Long"},{"name":"defaultDamageTypeHash","type":"Long"},{"name":"displayProperties","type":"String"},{"name":"displaySource","type":"String"},{"name":"doesPostmasterPullHaveSideEffects","type":"Bool"},{"name":"emblemObjectiveHash","type":"Long"},{"name":"equippable","type":"Bool"},{"name":"equippingBlock","type":"String"},{"name":"flavorText","type":"String"},{"name":"gearset","type":"String"},{"name":"iconWatermark","type":"String"},{"name":"iconWatermarkShelved","type":"String"},{"name":"index","type":"Long"},{"name":"inventory","type":"String"},{"name":"investmentStats","type":"StringList"},{"name":"isWrapper","type":"Bool"},{"name":"itemCategoryHashes","type":"LongList"},{"name":"itemSubType","type":"Long"},{"name":"itemType","type":"Long"},{"name":"itemTypeAndTierDisplayName","type":"String"},{"name":"itemTypeDisplayName","type":"String"},{"name":"links","type":"StringList"},{"name":"loreHash","type":"Long"},{"name":"metrics","type":"String"},{"name":"nonTransferrable","type":"Bool"},{"name":"objectives","type":"String"},{"name":"perks","type":"StringList"},{"name":"plug","type":"String"},{"name":"preview","type":"String"},{"name":"quality","type":"String"},{"name":"redacted","type":"Bool"},{"name":"sack","type":"String"},{"name":"screenshot","type":"String"},{"name":"seasonHash","type":"Long"},{"name":"secondaryIcon","type":"String"},{"name":"secondaryOverlay","type":"String"},{"name":"secondarySpecial","type":"String"},{"name":"setData","type":"String"},{"name":"sockets","type":"String"},{"name":"sourceData","type":"String"},{"name":"specialItemType","type":"Long"},{"name":"stats","type":"String"},{"name":"summary","type":"String"},{"name":"summaryItemHash","type":"Long"},{"name":"talentGrid","type":"String"},{"name":"tooltipNotifications","type":"StringList"},{"name":"tooltipStyle","type":"String"},{"name":"traitHashes","type":"LongList"},{"name":"traitIds","type":"StringList"},{"name":"translationBlock","type":"String"},{"name":"uiItemDisplayStyle","type":"String"},{"name":"value","type":"String"}],"indexes":[],"links":[]}',
  idName: 'hash',
  propertyIds: {
    'action': 0,
    'allowActions': 1,
    'animations': 2,
    'backgroundColor': 3,
    'breakerType': 4,
    'breakerTypeHash': 5,
    'classType': 6,
    'collectibleHash': 7,
    'crafting': 8,
    'damageTypeHashes': 9,
    'damageTypes': 10,
    'defaultDamageType': 11,
    'defaultDamageTypeHash': 12,
    'displayProperties': 13,
    'displaySource': 14,
    'doesPostmasterPullHaveSideEffects': 15,
    'emblemObjectiveHash': 16,
    'equippable': 17,
    'equippingBlock': 18,
    'flavorText': 19,
    'gearset': 20,
    'iconWatermark': 21,
    'iconWatermarkShelved': 22,
    'index': 23,
    'inventory': 24,
    'investmentStats': 25,
    'isWrapper': 26,
    'itemCategoryHashes': 27,
    'itemSubType': 28,
    'itemType': 29,
    'itemTypeAndTierDisplayName': 30,
    'itemTypeDisplayName': 31,
    'links': 32,
    'loreHash': 33,
    'metrics': 34,
    'nonTransferrable': 35,
    'objectives': 36,
    'perks': 37,
    'plug': 38,
    'preview': 39,
    'quality': 40,
    'redacted': 41,
    'sack': 42,
    'screenshot': 43,
    'seasonHash': 44,
    'secondaryIcon': 45,
    'secondaryOverlay': 46,
    'secondarySpecial': 47,
    'setData': 48,
    'sockets': 49,
    'sourceData': 50,
    'specialItemType': 51,
    'stats': 52,
    'summary': 53,
    'summaryItemHash': 54,
    'talentGrid': 55,
    'tooltipNotifications': 56,
    'tooltipStyle': 57,
    'traitHashes': 58,
    'traitIds': 59,
    'translationBlock': 60,
    'uiItemDisplayStyle': 61,
    'value': 62
  },
  listProperties: {
    'animations',
    'damageTypeHashes',
    'damageTypes',
    'investmentStats',
    'itemCategoryHashes',
    'links',
    'perks',
    'tooltipNotifications',
    'traitHashes',
    'traitIds'
  },
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _destinyInventoryItemDefinitionGetId,
  setId: _destinyInventoryItemDefinitionSetId,
  getLinks: _destinyInventoryItemDefinitionGetLinks,
  attachLinks: _destinyInventoryItemDefinitionAttachLinks,
  serializeNative: _destinyInventoryItemDefinitionSerializeNative,
  deserializeNative: _destinyInventoryItemDefinitionDeserializeNative,
  deserializePropNative: _destinyInventoryItemDefinitionDeserializePropNative,
  serializeWeb: _destinyInventoryItemDefinitionSerializeWeb,
  deserializeWeb: _destinyInventoryItemDefinitionDeserializeWeb,
  deserializePropWeb: _destinyInventoryItemDefinitionDeserializePropWeb,
  version: 3,
);

int? _destinyInventoryItemDefinitionGetId(
    DestinyInventoryItemDefinition object) {
  if (object.hash == Isar.autoIncrement) {
    return null;
  } else {
    return object.hash;
  }
}

void _destinyInventoryItemDefinitionSetId(
    DestinyInventoryItemDefinition object, int id) {
  object.hash = id;
}

List<IsarLinkBase> _destinyInventoryItemDefinitionGetLinks(
    DestinyInventoryItemDefinition object) {
  return [];
}

const _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter =
    DestinyItemActionBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyAnimationReferenceListConverter =
    DestinyAnimationReferenceListConverter();
const _destinyInventoryItemDefinitionDestinyColorConverter =
    DestinyColorConverter();
const _destinyInventoryItemDefinitionDestinyBreakerTypeConverter =
    DestinyBreakerTypeConverter();
const _destinyInventoryItemDefinitionDestinyClassConverter =
    DestinyClassConverter();
const _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter =
    DestinyItemCraftingBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDamageTypeListConverter =
    DamageTypeListConverter();
const _destinyInventoryItemDefinitionDamageTypeConverter =
    DamageTypeConverter();
const _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter =
    DestinyDisplayPropertiesDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter =
    DestinyEquippingBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter =
    DestinyItemGearsetBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter =
    DestinyItemInventoryBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemInvestmentStatDefinitionListConverter =
    DestinyItemInvestmentStatDefinitionListConverter();
const _destinyInventoryItemDefinitionDestinyItemSubTypeConverter =
    DestinyItemSubTypeConverter();
const _destinyInventoryItemDefinitionDestinyItemTypeConverter =
    DestinyItemTypeConverter();
const _destinyInventoryItemDefinitionHyperlinkReferenceListConverter =
    HyperlinkReferenceListConverter();
const _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter =
    DestinyItemMetricBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter =
    DestinyItemObjectiveBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemPerkEntryDefinitionListConverter =
    DestinyItemPerkEntryDefinitionListConverter();
const _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter =
    DestinyItemPlugDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter =
    DestinyItemPreviewBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter =
    DestinyItemQualityBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter =
    DestinyItemSackBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter =
    DestinyItemSetBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter =
    DestinyItemSocketBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter =
    DestinyItemSourceBlockDefinitionConverter();
const _destinyInventoryItemDefinitionSpecialItemTypeConverter =
    SpecialItemTypeConverter();
const _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter =
    DestinyItemStatBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter =
    DestinyItemSummaryBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter =
    DestinyItemTalentGridBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemTooltipNotificationListConverter =
    DestinyItemTooltipNotificationListConverter();
const _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter =
    DestinyItemTranslationBlockDefinitionConverter();
const _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter =
    DestinyItemValueBlockDefinitionConverter();

void _destinyInventoryItemDefinitionSerializeNative(
    IsarCollection<DestinyInventoryItemDefinition> collection,
    IsarRawObject rawObj,
    DestinyInventoryItemDefinition object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 =
      _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
          .toIsar(object.action);
  IsarUint8List? _action;
  if (value0 != null) {
    _action = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_action?.length ?? 0) as int;
  final value1 = object.allowActions;
  final _allowActions = value1;
  final value2 =
      _destinyInventoryItemDefinitionDestinyAnimationReferenceListConverter
          .toIsar(object.animations);
  dynamicSize += (value2?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList2;
  if (value2 != null) {
    bytesList2 = [];
    for (var str in value2) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList2.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _animations = bytesList2;
  final value3 = _destinyInventoryItemDefinitionDestinyColorConverter
      .toIsar(object.backgroundColor);
  IsarUint8List? _backgroundColor;
  if (value3 != null) {
    _backgroundColor = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_backgroundColor?.length ?? 0) as int;
  final value4 = _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
      .toIsar(object.breakerType);
  final _breakerType = value4;
  final value5 = object.breakerTypeHash;
  final _breakerTypeHash = value5;
  final value6 = _destinyInventoryItemDefinitionDestinyClassConverter
      .toIsar(object.classType);
  final _classType = value6;
  final value7 = object.collectibleHash;
  final _collectibleHash = value7;
  final value8 =
      _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
          .toIsar(object.crafting);
  IsarUint8List? _crafting;
  if (value8 != null) {
    _crafting = IsarBinaryWriter.utf8Encoder.convert(value8);
  }
  dynamicSize += (_crafting?.length ?? 0) as int;
  final value9 = object.damageTypeHashes;
  dynamicSize += (value9?.length ?? 0) * 8;
  final _damageTypeHashes = value9;
  final value10 = _destinyInventoryItemDefinitionDamageTypeListConverter
      .toIsar(object.damageTypes);
  dynamicSize += (value10?.length ?? 0) * 8;
  final _damageTypes = value10;
  final value11 = _destinyInventoryItemDefinitionDamageTypeConverter
      .toIsar(object.defaultDamageType);
  final _defaultDamageType = value11;
  final value12 = object.defaultDamageTypeHash;
  final _defaultDamageTypeHash = value12;
  final value13 =
      _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties);
  IsarUint8List? _displayProperties;
  if (value13 != null) {
    _displayProperties = IsarBinaryWriter.utf8Encoder.convert(value13);
  }
  dynamicSize += (_displayProperties?.length ?? 0) as int;
  final value14 = object.displaySource;
  IsarUint8List? _displaySource;
  if (value14 != null) {
    _displaySource = IsarBinaryWriter.utf8Encoder.convert(value14);
  }
  dynamicSize += (_displaySource?.length ?? 0) as int;
  final value15 = object.doesPostmasterPullHaveSideEffects;
  final _doesPostmasterPullHaveSideEffects = value15;
  final value16 = object.emblemObjectiveHash;
  final _emblemObjectiveHash = value16;
  final value17 = object.equippable;
  final _equippable = value17;
  final value18 =
      _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
          .toIsar(object.equippingBlock);
  IsarUint8List? _equippingBlock;
  if (value18 != null) {
    _equippingBlock = IsarBinaryWriter.utf8Encoder.convert(value18);
  }
  dynamicSize += (_equippingBlock?.length ?? 0) as int;
  final value19 = object.flavorText;
  IsarUint8List? _flavorText;
  if (value19 != null) {
    _flavorText = IsarBinaryWriter.utf8Encoder.convert(value19);
  }
  dynamicSize += (_flavorText?.length ?? 0) as int;
  final value20 =
      _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
          .toIsar(object.gearset);
  IsarUint8List? _gearset;
  if (value20 != null) {
    _gearset = IsarBinaryWriter.utf8Encoder.convert(value20);
  }
  dynamicSize += (_gearset?.length ?? 0) as int;
  final value21 = object.iconWatermark;
  IsarUint8List? _iconWatermark;
  if (value21 != null) {
    _iconWatermark = IsarBinaryWriter.utf8Encoder.convert(value21);
  }
  dynamicSize += (_iconWatermark?.length ?? 0) as int;
  final value22 = object.iconWatermarkShelved;
  IsarUint8List? _iconWatermarkShelved;
  if (value22 != null) {
    _iconWatermarkShelved = IsarBinaryWriter.utf8Encoder.convert(value22);
  }
  dynamicSize += (_iconWatermarkShelved?.length ?? 0) as int;
  final value23 = object.index;
  final _index = value23;
  final value24 =
      _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
          .toIsar(object.inventory);
  IsarUint8List? _inventory;
  if (value24 != null) {
    _inventory = IsarBinaryWriter.utf8Encoder.convert(value24);
  }
  dynamicSize += (_inventory?.length ?? 0) as int;
  final value25 =
      _destinyInventoryItemDefinitionDestinyItemInvestmentStatDefinitionListConverter
          .toIsar(object.investmentStats);
  dynamicSize += (value25?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList25;
  if (value25 != null) {
    bytesList25 = [];
    for (var str in value25) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList25.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _investmentStats = bytesList25;
  final value26 = object.isWrapper;
  final _isWrapper = value26;
  final value27 = object.itemCategoryHashes;
  dynamicSize += (value27?.length ?? 0) * 8;
  final _itemCategoryHashes = value27;
  final value28 = _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
      .toIsar(object.itemSubType);
  final _itemSubType = value28;
  final value29 = _destinyInventoryItemDefinitionDestinyItemTypeConverter
      .toIsar(object.itemType);
  final _itemType = value29;
  final value30 = object.itemTypeAndTierDisplayName;
  IsarUint8List? _itemTypeAndTierDisplayName;
  if (value30 != null) {
    _itemTypeAndTierDisplayName = IsarBinaryWriter.utf8Encoder.convert(value30);
  }
  dynamicSize += (_itemTypeAndTierDisplayName?.length ?? 0) as int;
  final value31 = object.itemTypeDisplayName;
  IsarUint8List? _itemTypeDisplayName;
  if (value31 != null) {
    _itemTypeDisplayName = IsarBinaryWriter.utf8Encoder.convert(value31);
  }
  dynamicSize += (_itemTypeDisplayName?.length ?? 0) as int;
  final value32 = _destinyInventoryItemDefinitionHyperlinkReferenceListConverter
      .toIsar(object.links);
  dynamicSize += (value32?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList32;
  if (value32 != null) {
    bytesList32 = [];
    for (var str in value32) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList32.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _links = bytesList32;
  final value33 = object.loreHash;
  final _loreHash = value33;
  final value34 =
      _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
          .toIsar(object.metrics);
  IsarUint8List? _metrics;
  if (value34 != null) {
    _metrics = IsarBinaryWriter.utf8Encoder.convert(value34);
  }
  dynamicSize += (_metrics?.length ?? 0) as int;
  final value35 = object.nonTransferrable;
  final _nonTransferrable = value35;
  final value36 =
      _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
          .toIsar(object.objectives);
  IsarUint8List? _objectives;
  if (value36 != null) {
    _objectives = IsarBinaryWriter.utf8Encoder.convert(value36);
  }
  dynamicSize += (_objectives?.length ?? 0) as int;
  final value37 =
      _destinyInventoryItemDefinitionDestinyItemPerkEntryDefinitionListConverter
          .toIsar(object.perks);
  dynamicSize += (value37?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList37;
  if (value37 != null) {
    bytesList37 = [];
    for (var str in value37) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList37.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _perks = bytesList37;
  final value38 =
      _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .toIsar(object.plug);
  IsarUint8List? _plug;
  if (value38 != null) {
    _plug = IsarBinaryWriter.utf8Encoder.convert(value38);
  }
  dynamicSize += (_plug?.length ?? 0) as int;
  final value39 =
      _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
          .toIsar(object.preview);
  IsarUint8List? _preview;
  if (value39 != null) {
    _preview = IsarBinaryWriter.utf8Encoder.convert(value39);
  }
  dynamicSize += (_preview?.length ?? 0) as int;
  final value40 =
      _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
          .toIsar(object.quality);
  IsarUint8List? _quality;
  if (value40 != null) {
    _quality = IsarBinaryWriter.utf8Encoder.convert(value40);
  }
  dynamicSize += (_quality?.length ?? 0) as int;
  final value41 = object.redacted;
  final _redacted = value41;
  final value42 =
      _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
          .toIsar(object.sack);
  IsarUint8List? _sack;
  if (value42 != null) {
    _sack = IsarBinaryWriter.utf8Encoder.convert(value42);
  }
  dynamicSize += (_sack?.length ?? 0) as int;
  final value43 = object.screenshot;
  IsarUint8List? _screenshot;
  if (value43 != null) {
    _screenshot = IsarBinaryWriter.utf8Encoder.convert(value43);
  }
  dynamicSize += (_screenshot?.length ?? 0) as int;
  final value44 = object.seasonHash;
  final _seasonHash = value44;
  final value45 = object.secondaryIcon;
  IsarUint8List? _secondaryIcon;
  if (value45 != null) {
    _secondaryIcon = IsarBinaryWriter.utf8Encoder.convert(value45);
  }
  dynamicSize += (_secondaryIcon?.length ?? 0) as int;
  final value46 = object.secondaryOverlay;
  IsarUint8List? _secondaryOverlay;
  if (value46 != null) {
    _secondaryOverlay = IsarBinaryWriter.utf8Encoder.convert(value46);
  }
  dynamicSize += (_secondaryOverlay?.length ?? 0) as int;
  final value47 = object.secondarySpecial;
  IsarUint8List? _secondarySpecial;
  if (value47 != null) {
    _secondarySpecial = IsarBinaryWriter.utf8Encoder.convert(value47);
  }
  dynamicSize += (_secondarySpecial?.length ?? 0) as int;
  final value48 =
      _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
          .toIsar(object.setData);
  IsarUint8List? _setData;
  if (value48 != null) {
    _setData = IsarBinaryWriter.utf8Encoder.convert(value48);
  }
  dynamicSize += (_setData?.length ?? 0) as int;
  final value49 =
      _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
          .toIsar(object.sockets);
  IsarUint8List? _sockets;
  if (value49 != null) {
    _sockets = IsarBinaryWriter.utf8Encoder.convert(value49);
  }
  dynamicSize += (_sockets?.length ?? 0) as int;
  final value50 =
      _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
          .toIsar(object.sourceData);
  IsarUint8List? _sourceData;
  if (value50 != null) {
    _sourceData = IsarBinaryWriter.utf8Encoder.convert(value50);
  }
  dynamicSize += (_sourceData?.length ?? 0) as int;
  final value51 = _destinyInventoryItemDefinitionSpecialItemTypeConverter
      .toIsar(object.specialItemType);
  final _specialItemType = value51;
  final value52 =
      _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
          .toIsar(object.stats);
  IsarUint8List? _stats;
  if (value52 != null) {
    _stats = IsarBinaryWriter.utf8Encoder.convert(value52);
  }
  dynamicSize += (_stats?.length ?? 0) as int;
  final value53 =
      _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
          .toIsar(object.summary);
  IsarUint8List? _summary;
  if (value53 != null) {
    _summary = IsarBinaryWriter.utf8Encoder.convert(value53);
  }
  dynamicSize += (_summary?.length ?? 0) as int;
  final value54 = object.summaryItemHash;
  final _summaryItemHash = value54;
  final value55 =
      _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
          .toIsar(object.talentGrid);
  IsarUint8List? _talentGrid;
  if (value55 != null) {
    _talentGrid = IsarBinaryWriter.utf8Encoder.convert(value55);
  }
  dynamicSize += (_talentGrid?.length ?? 0) as int;
  final value56 =
      _destinyInventoryItemDefinitionDestinyItemTooltipNotificationListConverter
          .toIsar(object.tooltipNotifications);
  dynamicSize += (value56?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList56;
  if (value56 != null) {
    bytesList56 = [];
    for (var str in value56) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList56.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _tooltipNotifications = bytesList56;
  final value57 = object.tooltipStyle;
  IsarUint8List? _tooltipStyle;
  if (value57 != null) {
    _tooltipStyle = IsarBinaryWriter.utf8Encoder.convert(value57);
  }
  dynamicSize += (_tooltipStyle?.length ?? 0) as int;
  final value58 = object.traitHashes;
  dynamicSize += (value58?.length ?? 0) * 8;
  final _traitHashes = value58;
  final value59 = object.traitIds;
  dynamicSize += (value59?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList59;
  if (value59 != null) {
    bytesList59 = [];
    for (var str in value59) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList59.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _traitIds = bytesList59;
  final value60 =
      _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
          .toIsar(object.translationBlock);
  IsarUint8List? _translationBlock;
  if (value60 != null) {
    _translationBlock = IsarBinaryWriter.utf8Encoder.convert(value60);
  }
  dynamicSize += (_translationBlock?.length ?? 0) as int;
  final value61 = object.uiItemDisplayStyle;
  IsarUint8List? _uiItemDisplayStyle;
  if (value61 != null) {
    _uiItemDisplayStyle = IsarBinaryWriter.utf8Encoder.convert(value61);
  }
  dynamicSize += (_uiItemDisplayStyle?.length ?? 0) as int;
  final value62 =
      _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
          .toIsar(object.value);
  IsarUint8List? _value;
  if (value62 != null) {
    _value = IsarBinaryWriter.utf8Encoder.convert(value62);
  }
  dynamicSize += (_value?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _action);
  writer.writeBool(offsets[1], _allowActions);
  writer.writeStringList(offsets[2], _animations);
  writer.writeBytes(offsets[3], _backgroundColor);
  writer.writeLong(offsets[4], _breakerType);
  writer.writeLong(offsets[5], _breakerTypeHash);
  writer.writeLong(offsets[6], _classType);
  writer.writeLong(offsets[7], _collectibleHash);
  writer.writeBytes(offsets[8], _crafting);
  writer.writeLongList(offsets[9], _damageTypeHashes);
  writer.writeLongList(offsets[10], _damageTypes);
  writer.writeLong(offsets[11], _defaultDamageType);
  writer.writeLong(offsets[12], _defaultDamageTypeHash);
  writer.writeBytes(offsets[13], _displayProperties);
  writer.writeBytes(offsets[14], _displaySource);
  writer.writeBool(offsets[15], _doesPostmasterPullHaveSideEffects);
  writer.writeLong(offsets[16], _emblemObjectiveHash);
  writer.writeBool(offsets[17], _equippable);
  writer.writeBytes(offsets[18], _equippingBlock);
  writer.writeBytes(offsets[19], _flavorText);
  writer.writeBytes(offsets[20], _gearset);
  writer.writeBytes(offsets[21], _iconWatermark);
  writer.writeBytes(offsets[22], _iconWatermarkShelved);
  writer.writeLong(offsets[23], _index);
  writer.writeBytes(offsets[24], _inventory);
  writer.writeStringList(offsets[25], _investmentStats);
  writer.writeBool(offsets[26], _isWrapper);
  writer.writeLongList(offsets[27], _itemCategoryHashes);
  writer.writeLong(offsets[28], _itemSubType);
  writer.writeLong(offsets[29], _itemType);
  writer.writeBytes(offsets[30], _itemTypeAndTierDisplayName);
  writer.writeBytes(offsets[31], _itemTypeDisplayName);
  writer.writeStringList(offsets[32], _links);
  writer.writeLong(offsets[33], _loreHash);
  writer.writeBytes(offsets[34], _metrics);
  writer.writeBool(offsets[35], _nonTransferrable);
  writer.writeBytes(offsets[36], _objectives);
  writer.writeStringList(offsets[37], _perks);
  writer.writeBytes(offsets[38], _plug);
  writer.writeBytes(offsets[39], _preview);
  writer.writeBytes(offsets[40], _quality);
  writer.writeBool(offsets[41], _redacted);
  writer.writeBytes(offsets[42], _sack);
  writer.writeBytes(offsets[43], _screenshot);
  writer.writeLong(offsets[44], _seasonHash);
  writer.writeBytes(offsets[45], _secondaryIcon);
  writer.writeBytes(offsets[46], _secondaryOverlay);
  writer.writeBytes(offsets[47], _secondarySpecial);
  writer.writeBytes(offsets[48], _setData);
  writer.writeBytes(offsets[49], _sockets);
  writer.writeBytes(offsets[50], _sourceData);
  writer.writeLong(offsets[51], _specialItemType);
  writer.writeBytes(offsets[52], _stats);
  writer.writeBytes(offsets[53], _summary);
  writer.writeLong(offsets[54], _summaryItemHash);
  writer.writeBytes(offsets[55], _talentGrid);
  writer.writeStringList(offsets[56], _tooltipNotifications);
  writer.writeBytes(offsets[57], _tooltipStyle);
  writer.writeLongList(offsets[58], _traitHashes);
  writer.writeStringList(offsets[59], _traitIds);
  writer.writeBytes(offsets[60], _translationBlock);
  writer.writeBytes(offsets[61], _uiItemDisplayStyle);
  writer.writeBytes(offsets[62], _value);
}

DestinyInventoryItemDefinition _destinyInventoryItemDefinitionDeserializeNative(
    IsarCollection<DestinyInventoryItemDefinition> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = DestinyInventoryItemDefinition();
  object.action =
      _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[0]));
  object.allowActions = reader.readBoolOrNull(offsets[1]);
  object.animations =
      _destinyInventoryItemDefinitionDestinyAnimationReferenceListConverter
          .fromIsar(reader.readStringList(offsets[2]));
  object.backgroundColor = _destinyInventoryItemDefinitionDestinyColorConverter
      .fromIsar(reader.readStringOrNull(offsets[3]));
  object.breakerType =
      _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
          .fromIsar(reader.readLongOrNull(offsets[4]));
  object.breakerTypeHash = reader.readLongOrNull(offsets[5]);
  object.classType = _destinyInventoryItemDefinitionDestinyClassConverter
      .fromIsar(reader.readLongOrNull(offsets[6]));
  object.collectibleHash = reader.readLongOrNull(offsets[7]);
  object.crafting =
      _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[8]));
  object.damageTypeHashes = reader.readLongList(offsets[9]);
  object.damageTypes = _destinyInventoryItemDefinitionDamageTypeListConverter
      .fromIsar(reader.readLongList(offsets[10]));
  object.defaultDamageType = _destinyInventoryItemDefinitionDamageTypeConverter
      .fromIsar(reader.readLongOrNull(offsets[11]));
  object.defaultDamageTypeHash = reader.readLongOrNull(offsets[12]);
  object.displayProperties =
      _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[13]));
  object.displaySource = reader.readStringOrNull(offsets[14]);
  object.doesPostmasterPullHaveSideEffects = reader.readBoolOrNull(offsets[15]);
  object.emblemObjectiveHash = reader.readLongOrNull(offsets[16]);
  object.equippable = reader.readBoolOrNull(offsets[17]);
  object.equippingBlock =
      _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[18]));
  object.flavorText = reader.readStringOrNull(offsets[19]);
  object.gearset =
      _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[20]));
  object.hash = id;
  object.iconWatermark = reader.readStringOrNull(offsets[21]);
  object.iconWatermarkShelved = reader.readStringOrNull(offsets[22]);
  object.index = reader.readLongOrNull(offsets[23]);
  object.inventory =
      _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[24]));
  object.investmentStats =
      _destinyInventoryItemDefinitionDestinyItemInvestmentStatDefinitionListConverter
          .fromIsar(reader.readStringList(offsets[25]));
  object.isWrapper = reader.readBoolOrNull(offsets[26]);
  object.itemCategoryHashes = reader.readLongList(offsets[27]);
  object.itemSubType =
      _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
          .fromIsar(reader.readLongOrNull(offsets[28]));
  object.itemType = _destinyInventoryItemDefinitionDestinyItemTypeConverter
      .fromIsar(reader.readLongOrNull(offsets[29]));
  object.itemTypeAndTierDisplayName = reader.readStringOrNull(offsets[30]);
  object.itemTypeDisplayName = reader.readStringOrNull(offsets[31]);
  object.links = _destinyInventoryItemDefinitionHyperlinkReferenceListConverter
      .fromIsar(reader.readStringList(offsets[32]));
  object.loreHash = reader.readLongOrNull(offsets[33]);
  object.metrics =
      _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[34]));
  object.nonTransferrable = reader.readBoolOrNull(offsets[35]);
  object.objectives =
      _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[36]));
  object.perks =
      _destinyInventoryItemDefinitionDestinyItemPerkEntryDefinitionListConverter
          .fromIsar(reader.readStringList(offsets[37]));
  object.plug =
      _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[38]));
  object.preview =
      _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[39]));
  object.quality =
      _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[40]));
  object.redacted = reader.readBoolOrNull(offsets[41]);
  object.sack =
      _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[42]));
  object.screenshot = reader.readStringOrNull(offsets[43]);
  object.seasonHash = reader.readLongOrNull(offsets[44]);
  object.secondaryIcon = reader.readStringOrNull(offsets[45]);
  object.secondaryOverlay = reader.readStringOrNull(offsets[46]);
  object.secondarySpecial = reader.readStringOrNull(offsets[47]);
  object.setData =
      _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[48]));
  object.sockets =
      _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[49]));
  object.sourceData =
      _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[50]));
  object.specialItemType =
      _destinyInventoryItemDefinitionSpecialItemTypeConverter
          .fromIsar(reader.readLongOrNull(offsets[51]));
  object.stats =
      _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[52]));
  object.summary =
      _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[53]));
  object.summaryItemHash = reader.readLongOrNull(offsets[54]);
  object.talentGrid =
      _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[55]));
  object.tooltipNotifications =
      _destinyInventoryItemDefinitionDestinyItemTooltipNotificationListConverter
          .fromIsar(reader.readStringList(offsets[56]));
  object.tooltipStyle = reader.readStringOrNull(offsets[57]);
  object.traitHashes = reader.readLongList(offsets[58]);
  object.traitIds = reader.readStringList(offsets[59]);
  object.translationBlock =
      _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[60]));
  object.uiItemDisplayStyle = reader.readStringOrNull(offsets[61]);
  object.value =
      _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[62]));
  return object;
}

P _destinyInventoryItemDefinitionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (_destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (_destinyInventoryItemDefinitionDestinyAnimationReferenceListConverter
          .fromIsar(reader.readStringList(offset))) as P;
    case 3:
      return (_destinyInventoryItemDefinitionDestinyColorConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 4:
      return (_destinyInventoryItemDefinitionDestinyBreakerTypeConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (_destinyInventoryItemDefinitionDestinyClassConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (_destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 9:
      return (reader.readLongList(offset)) as P;
    case 10:
      return (_destinyInventoryItemDefinitionDamageTypeListConverter
          .fromIsar(reader.readLongList(offset))) as P;
    case 11:
      return (_destinyInventoryItemDefinitionDamageTypeConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (_destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readBoolOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readBoolOrNull(offset)) as P;
    case 18:
      return (_destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (_destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (_destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 25:
      return (_destinyInventoryItemDefinitionDestinyItemInvestmentStatDefinitionListConverter
          .fromIsar(reader.readStringList(offset))) as P;
    case 26:
      return (reader.readBoolOrNull(offset)) as P;
    case 27:
      return (reader.readLongList(offset)) as P;
    case 28:
      return (_destinyInventoryItemDefinitionDestinyItemSubTypeConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 29:
      return (_destinyInventoryItemDefinitionDestinyItemTypeConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (_destinyInventoryItemDefinitionHyperlinkReferenceListConverter
          .fromIsar(reader.readStringList(offset))) as P;
    case 33:
      return (reader.readLongOrNull(offset)) as P;
    case 34:
      return (_destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 35:
      return (reader.readBoolOrNull(offset)) as P;
    case 36:
      return (_destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 37:
      return (_destinyInventoryItemDefinitionDestinyItemPerkEntryDefinitionListConverter
          .fromIsar(reader.readStringList(offset))) as P;
    case 38:
      return (_destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 39:
      return (_destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 40:
      return (_destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 41:
      return (reader.readBoolOrNull(offset)) as P;
    case 42:
      return (_destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 43:
      return (reader.readStringOrNull(offset)) as P;
    case 44:
      return (reader.readLongOrNull(offset)) as P;
    case 45:
      return (reader.readStringOrNull(offset)) as P;
    case 46:
      return (reader.readStringOrNull(offset)) as P;
    case 47:
      return (reader.readStringOrNull(offset)) as P;
    case 48:
      return (_destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 49:
      return (_destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 50:
      return (_destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 51:
      return (_destinyInventoryItemDefinitionSpecialItemTypeConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 52:
      return (_destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 53:
      return (_destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 54:
      return (reader.readLongOrNull(offset)) as P;
    case 55:
      return (_destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 56:
      return (_destinyInventoryItemDefinitionDestinyItemTooltipNotificationListConverter
          .fromIsar(reader.readStringList(offset))) as P;
    case 57:
      return (reader.readStringOrNull(offset)) as P;
    case 58:
      return (reader.readLongList(offset)) as P;
    case 59:
      return (reader.readStringList(offset)) as P;
    case 60:
      return (_destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 61:
      return (reader.readStringOrNull(offset)) as P;
    case 62:
      return (_destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _destinyInventoryItemDefinitionSerializeWeb(
    IsarCollection<DestinyInventoryItemDefinition> collection,
    DestinyInventoryItemDefinition object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj,
      'action',
      _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
          .toIsar(object.action));
  IsarNative.jsObjectSet(jsObj, 'allowActions', object.allowActions);
  IsarNative.jsObjectSet(
      jsObj,
      'animations',
      _destinyInventoryItemDefinitionDestinyAnimationReferenceListConverter
          .toIsar(object.animations));
  IsarNative.jsObjectSet(
      jsObj,
      'backgroundColor',
      _destinyInventoryItemDefinitionDestinyColorConverter
          .toIsar(object.backgroundColor));
  IsarNative.jsObjectSet(
      jsObj,
      'breakerType',
      _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
          .toIsar(object.breakerType));
  IsarNative.jsObjectSet(jsObj, 'breakerTypeHash', object.breakerTypeHash);
  IsarNative.jsObjectSet(
      jsObj,
      'classType',
      _destinyInventoryItemDefinitionDestinyClassConverter
          .toIsar(object.classType));
  IsarNative.jsObjectSet(jsObj, 'collectibleHash', object.collectibleHash);
  IsarNative.jsObjectSet(
      jsObj,
      'crafting',
      _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
          .toIsar(object.crafting));
  IsarNative.jsObjectSet(jsObj, 'damageTypeHashes', object.damageTypeHashes);
  IsarNative.jsObjectSet(
      jsObj,
      'damageTypes',
      _destinyInventoryItemDefinitionDamageTypeListConverter
          .toIsar(object.damageTypes));
  IsarNative.jsObjectSet(
      jsObj,
      'defaultDamageType',
      _destinyInventoryItemDefinitionDamageTypeConverter
          .toIsar(object.defaultDamageType));
  IsarNative.jsObjectSet(
      jsObj, 'defaultDamageTypeHash', object.defaultDamageTypeHash);
  IsarNative.jsObjectSet(
      jsObj,
      'displayProperties',
      _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties));
  IsarNative.jsObjectSet(jsObj, 'displaySource', object.displaySource);
  IsarNative.jsObjectSet(jsObj, 'doesPostmasterPullHaveSideEffects',
      object.doesPostmasterPullHaveSideEffects);
  IsarNative.jsObjectSet(
      jsObj, 'emblemObjectiveHash', object.emblemObjectiveHash);
  IsarNative.jsObjectSet(jsObj, 'equippable', object.equippable);
  IsarNative.jsObjectSet(
      jsObj,
      'equippingBlock',
      _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
          .toIsar(object.equippingBlock));
  IsarNative.jsObjectSet(jsObj, 'flavorText', object.flavorText);
  IsarNative.jsObjectSet(
      jsObj,
      'gearset',
      _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
          .toIsar(object.gearset));
  IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
  IsarNative.jsObjectSet(jsObj, 'iconWatermark', object.iconWatermark);
  IsarNative.jsObjectSet(
      jsObj, 'iconWatermarkShelved', object.iconWatermarkShelved);
  IsarNative.jsObjectSet(jsObj, 'index', object.index);
  IsarNative.jsObjectSet(
      jsObj,
      'inventory',
      _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
          .toIsar(object.inventory));
  IsarNative.jsObjectSet(
      jsObj,
      'investmentStats',
      _destinyInventoryItemDefinitionDestinyItemInvestmentStatDefinitionListConverter
          .toIsar(object.investmentStats));
  IsarNative.jsObjectSet(jsObj, 'isWrapper', object.isWrapper);
  IsarNative.jsObjectSet(
      jsObj, 'itemCategoryHashes', object.itemCategoryHashes);
  IsarNative.jsObjectSet(
      jsObj,
      'itemSubType',
      _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
          .toIsar(object.itemSubType));
  IsarNative.jsObjectSet(
      jsObj,
      'itemType',
      _destinyInventoryItemDefinitionDestinyItemTypeConverter
          .toIsar(object.itemType));
  IsarNative.jsObjectSet(
      jsObj, 'itemTypeAndTierDisplayName', object.itemTypeAndTierDisplayName);
  IsarNative.jsObjectSet(
      jsObj, 'itemTypeDisplayName', object.itemTypeDisplayName);
  IsarNative.jsObjectSet(
      jsObj,
      'links',
      _destinyInventoryItemDefinitionHyperlinkReferenceListConverter
          .toIsar(object.links));
  IsarNative.jsObjectSet(jsObj, 'loreHash', object.loreHash);
  IsarNative.jsObjectSet(
      jsObj,
      'metrics',
      _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
          .toIsar(object.metrics));
  IsarNative.jsObjectSet(jsObj, 'nonTransferrable', object.nonTransferrable);
  IsarNative.jsObjectSet(
      jsObj,
      'objectives',
      _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
          .toIsar(object.objectives));
  IsarNative.jsObjectSet(
      jsObj,
      'perks',
      _destinyInventoryItemDefinitionDestinyItemPerkEntryDefinitionListConverter
          .toIsar(object.perks));
  IsarNative.jsObjectSet(
      jsObj,
      'plug',
      _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .toIsar(object.plug));
  IsarNative.jsObjectSet(
      jsObj,
      'preview',
      _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
          .toIsar(object.preview));
  IsarNative.jsObjectSet(
      jsObj,
      'quality',
      _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
          .toIsar(object.quality));
  IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
  IsarNative.jsObjectSet(
      jsObj,
      'sack',
      _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
          .toIsar(object.sack));
  IsarNative.jsObjectSet(jsObj, 'screenshot', object.screenshot);
  IsarNative.jsObjectSet(jsObj, 'seasonHash', object.seasonHash);
  IsarNative.jsObjectSet(jsObj, 'secondaryIcon', object.secondaryIcon);
  IsarNative.jsObjectSet(jsObj, 'secondaryOverlay', object.secondaryOverlay);
  IsarNative.jsObjectSet(jsObj, 'secondarySpecial', object.secondarySpecial);
  IsarNative.jsObjectSet(
      jsObj,
      'setData',
      _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
          .toIsar(object.setData));
  IsarNative.jsObjectSet(
      jsObj,
      'sockets',
      _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
          .toIsar(object.sockets));
  IsarNative.jsObjectSet(
      jsObj,
      'sourceData',
      _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
          .toIsar(object.sourceData));
  IsarNative.jsObjectSet(
      jsObj,
      'specialItemType',
      _destinyInventoryItemDefinitionSpecialItemTypeConverter
          .toIsar(object.specialItemType));
  IsarNative.jsObjectSet(
      jsObj,
      'stats',
      _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
          .toIsar(object.stats));
  IsarNative.jsObjectSet(
      jsObj,
      'summary',
      _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
          .toIsar(object.summary));
  IsarNative.jsObjectSet(jsObj, 'summaryItemHash', object.summaryItemHash);
  IsarNative.jsObjectSet(
      jsObj,
      'talentGrid',
      _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
          .toIsar(object.talentGrid));
  IsarNative.jsObjectSet(
      jsObj,
      'tooltipNotifications',
      _destinyInventoryItemDefinitionDestinyItemTooltipNotificationListConverter
          .toIsar(object.tooltipNotifications));
  IsarNative.jsObjectSet(jsObj, 'tooltipStyle', object.tooltipStyle);
  IsarNative.jsObjectSet(jsObj, 'traitHashes', object.traitHashes);
  IsarNative.jsObjectSet(jsObj, 'traitIds', object.traitIds);
  IsarNative.jsObjectSet(
      jsObj,
      'translationBlock',
      _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
          .toIsar(object.translationBlock));
  IsarNative.jsObjectSet(
      jsObj, 'uiItemDisplayStyle', object.uiItemDisplayStyle);
  IsarNative.jsObjectSet(
      jsObj,
      'value',
      _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
          .toIsar(object.value));
  return jsObj;
}

DestinyInventoryItemDefinition _destinyInventoryItemDefinitionDeserializeWeb(
    IsarCollection<DestinyInventoryItemDefinition> collection, dynamic jsObj) {
  final object = DestinyInventoryItemDefinition();
  object.action =
      _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'action'));
  object.allowActions = IsarNative.jsObjectGet(jsObj, 'allowActions');
  object.animations =
      _destinyInventoryItemDefinitionDestinyAnimationReferenceListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'animations') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>());
  object.backgroundColor = _destinyInventoryItemDefinitionDestinyColorConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'backgroundColor'));
  object.breakerType =
      _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'breakerType'));
  object.breakerTypeHash = IsarNative.jsObjectGet(jsObj, 'breakerTypeHash');
  object.classType = _destinyInventoryItemDefinitionDestinyClassConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'classType'));
  object.collectibleHash = IsarNative.jsObjectGet(jsObj, 'collectibleHash');
  object.crafting =
      _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'crafting'));
  object.damageTypeHashes =
      (IsarNative.jsObjectGet(jsObj, 'damageTypeHashes') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<int>();
  object.damageTypes = _destinyInventoryItemDefinitionDamageTypeListConverter
      .fromIsar((IsarNative.jsObjectGet(jsObj, 'damageTypes') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<int>());
  object.defaultDamageType = _destinyInventoryItemDefinitionDamageTypeConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'defaultDamageType'));
  object.defaultDamageTypeHash =
      IsarNative.jsObjectGet(jsObj, 'defaultDamageTypeHash');
  object.displayProperties =
      _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'));
  object.displaySource = IsarNative.jsObjectGet(jsObj, 'displaySource');
  object.doesPostmasterPullHaveSideEffects =
      IsarNative.jsObjectGet(jsObj, 'doesPostmasterPullHaveSideEffects');
  object.emblemObjectiveHash =
      IsarNative.jsObjectGet(jsObj, 'emblemObjectiveHash');
  object.equippable = IsarNative.jsObjectGet(jsObj, 'equippable');
  object.equippingBlock =
      _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'equippingBlock'));
  object.flavorText = IsarNative.jsObjectGet(jsObj, 'flavorText');
  object.gearset =
      _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'gearset'));
  object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
  object.iconWatermark = IsarNative.jsObjectGet(jsObj, 'iconWatermark');
  object.iconWatermarkShelved =
      IsarNative.jsObjectGet(jsObj, 'iconWatermarkShelved');
  object.index = IsarNative.jsObjectGet(jsObj, 'index');
  object.inventory =
      _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'inventory'));
  object.investmentStats =
      _destinyInventoryItemDefinitionDestinyItemInvestmentStatDefinitionListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'investmentStats') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>());
  object.isWrapper = IsarNative.jsObjectGet(jsObj, 'isWrapper');
  object.itemCategoryHashes =
      (IsarNative.jsObjectGet(jsObj, 'itemCategoryHashes') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<int>();
  object.itemSubType =
      _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'itemSubType'));
  object.itemType = _destinyInventoryItemDefinitionDestinyItemTypeConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'itemType'));
  object.itemTypeAndTierDisplayName =
      IsarNative.jsObjectGet(jsObj, 'itemTypeAndTierDisplayName');
  object.itemTypeDisplayName =
      IsarNative.jsObjectGet(jsObj, 'itemTypeDisplayName');
  object.links = _destinyInventoryItemDefinitionHyperlinkReferenceListConverter
      .fromIsar((IsarNative.jsObjectGet(jsObj, 'links') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>());
  object.loreHash = IsarNative.jsObjectGet(jsObj, 'loreHash');
  object.metrics =
      _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'metrics'));
  object.nonTransferrable = IsarNative.jsObjectGet(jsObj, 'nonTransferrable');
  object.objectives =
      _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'objectives'));
  object.perks =
      _destinyInventoryItemDefinitionDestinyItemPerkEntryDefinitionListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'perks') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>());
  object.plug =
      _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'plug'));
  object.preview =
      _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'preview'));
  object.quality =
      _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'quality'));
  object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
  object.sack =
      _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'sack'));
  object.screenshot = IsarNative.jsObjectGet(jsObj, 'screenshot');
  object.seasonHash = IsarNative.jsObjectGet(jsObj, 'seasonHash');
  object.secondaryIcon = IsarNative.jsObjectGet(jsObj, 'secondaryIcon');
  object.secondaryOverlay = IsarNative.jsObjectGet(jsObj, 'secondaryOverlay');
  object.secondarySpecial = IsarNative.jsObjectGet(jsObj, 'secondarySpecial');
  object.setData =
      _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'setData'));
  object.sockets =
      _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'sockets'));
  object.sourceData =
      _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'sourceData'));
  object.specialItemType =
      _destinyInventoryItemDefinitionSpecialItemTypeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'specialItemType'));
  object.stats =
      _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'stats'));
  object.summary =
      _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'summary'));
  object.summaryItemHash = IsarNative.jsObjectGet(jsObj, 'summaryItemHash');
  object.talentGrid =
      _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'talentGrid'));
  object.tooltipNotifications =
      _destinyInventoryItemDefinitionDestinyItemTooltipNotificationListConverter
          .fromIsar(
              (IsarNative.jsObjectGet(jsObj, 'tooltipNotifications') as List?)
                  ?.map((e) => e ?? '')
                  .toList()
                  .cast<String>());
  object.tooltipStyle = IsarNative.jsObjectGet(jsObj, 'tooltipStyle');
  object.traitHashes = (IsarNative.jsObjectGet(jsObj, 'traitHashes') as List?)
      ?.map((e) => e ?? double.negativeInfinity)
      .toList()
      .cast<int>();
  object.traitIds = (IsarNative.jsObjectGet(jsObj, 'traitIds') as List?)
      ?.map((e) => e ?? '')
      .toList()
      .cast<String>();
  object.translationBlock =
      _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'translationBlock'));
  object.uiItemDisplayStyle =
      IsarNative.jsObjectGet(jsObj, 'uiItemDisplayStyle');
  object.value =
      _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'value'));
  return object;
}

P _destinyInventoryItemDefinitionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'action':
      return (_destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'action'))) as P;
    case 'allowActions':
      return (IsarNative.jsObjectGet(jsObj, 'allowActions')) as P;
    case 'animations':
      return (_destinyInventoryItemDefinitionDestinyAnimationReferenceListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'animations') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>())) as P;
    case 'backgroundColor':
      return (_destinyInventoryItemDefinitionDestinyColorConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'backgroundColor'))) as P;
    case 'breakerType':
      return (_destinyInventoryItemDefinitionDestinyBreakerTypeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'breakerType'))) as P;
    case 'breakerTypeHash':
      return (IsarNative.jsObjectGet(jsObj, 'breakerTypeHash')) as P;
    case 'classType':
      return (_destinyInventoryItemDefinitionDestinyClassConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'classType'))) as P;
    case 'collectibleHash':
      return (IsarNative.jsObjectGet(jsObj, 'collectibleHash')) as P;
    case 'crafting':
      return (_destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'crafting'))) as P;
    case 'damageTypeHashes':
      return ((IsarNative.jsObjectGet(jsObj, 'damageTypeHashes') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<int>()) as P;
    case 'damageTypes':
      return (_destinyInventoryItemDefinitionDamageTypeListConverter.fromIsar(
          (IsarNative.jsObjectGet(jsObj, 'damageTypes') as List?)
              ?.map((e) => e ?? double.negativeInfinity)
              .toList()
              .cast<int>())) as P;
    case 'defaultDamageType':
      return (_destinyInventoryItemDefinitionDamageTypeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'defaultDamageType'))) as P;
    case 'defaultDamageTypeHash':
      return (IsarNative.jsObjectGet(jsObj, 'defaultDamageTypeHash')) as P;
    case 'displayProperties':
      return (_destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'))) as P;
    case 'displaySource':
      return (IsarNative.jsObjectGet(jsObj, 'displaySource')) as P;
    case 'doesPostmasterPullHaveSideEffects':
      return (IsarNative.jsObjectGet(
          jsObj, 'doesPostmasterPullHaveSideEffects')) as P;
    case 'emblemObjectiveHash':
      return (IsarNative.jsObjectGet(jsObj, 'emblemObjectiveHash')) as P;
    case 'equippable':
      return (IsarNative.jsObjectGet(jsObj, 'equippable')) as P;
    case 'equippingBlock':
      return (_destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'equippingBlock'))) as P;
    case 'flavorText':
      return (IsarNative.jsObjectGet(jsObj, 'flavorText')) as P;
    case 'gearset':
      return (_destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'gearset'))) as P;
    case 'hash':
      return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
    case 'iconWatermark':
      return (IsarNative.jsObjectGet(jsObj, 'iconWatermark')) as P;
    case 'iconWatermarkShelved':
      return (IsarNative.jsObjectGet(jsObj, 'iconWatermarkShelved')) as P;
    case 'index':
      return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
    case 'inventory':
      return (_destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'inventory'))) as P;
    case 'investmentStats':
      return (_destinyInventoryItemDefinitionDestinyItemInvestmentStatDefinitionListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'investmentStats') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>())) as P;
    case 'isWrapper':
      return (IsarNative.jsObjectGet(jsObj, 'isWrapper')) as P;
    case 'itemCategoryHashes':
      return ((IsarNative.jsObjectGet(jsObj, 'itemCategoryHashes') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<int>()) as P;
    case 'itemSubType':
      return (_destinyInventoryItemDefinitionDestinyItemSubTypeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'itemSubType'))) as P;
    case 'itemType':
      return (_destinyInventoryItemDefinitionDestinyItemTypeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'itemType'))) as P;
    case 'itemTypeAndTierDisplayName':
      return (IsarNative.jsObjectGet(jsObj, 'itemTypeAndTierDisplayName')) as P;
    case 'itemTypeDisplayName':
      return (IsarNative.jsObjectGet(jsObj, 'itemTypeDisplayName')) as P;
    case 'links':
      return (_destinyInventoryItemDefinitionHyperlinkReferenceListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'links') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>())) as P;
    case 'loreHash':
      return (IsarNative.jsObjectGet(jsObj, 'loreHash')) as P;
    case 'metrics':
      return (_destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'metrics'))) as P;
    case 'nonTransferrable':
      return (IsarNative.jsObjectGet(jsObj, 'nonTransferrable')) as P;
    case 'objectives':
      return (_destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'objectives'))) as P;
    case 'perks':
      return (_destinyInventoryItemDefinitionDestinyItemPerkEntryDefinitionListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'perks') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>())) as P;
    case 'plug':
      return (_destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'plug'))) as P;
    case 'preview':
      return (_destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'preview'))) as P;
    case 'quality':
      return (_destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'quality'))) as P;
    case 'redacted':
      return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
    case 'sack':
      return (_destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'sack'))) as P;
    case 'screenshot':
      return (IsarNative.jsObjectGet(jsObj, 'screenshot')) as P;
    case 'seasonHash':
      return (IsarNative.jsObjectGet(jsObj, 'seasonHash')) as P;
    case 'secondaryIcon':
      return (IsarNative.jsObjectGet(jsObj, 'secondaryIcon')) as P;
    case 'secondaryOverlay':
      return (IsarNative.jsObjectGet(jsObj, 'secondaryOverlay')) as P;
    case 'secondarySpecial':
      return (IsarNative.jsObjectGet(jsObj, 'secondarySpecial')) as P;
    case 'setData':
      return (_destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'setData'))) as P;
    case 'sockets':
      return (_destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'sockets'))) as P;
    case 'sourceData':
      return (_destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'sourceData'))) as P;
    case 'specialItemType':
      return (_destinyInventoryItemDefinitionSpecialItemTypeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'specialItemType'))) as P;
    case 'stats':
      return (_destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'stats'))) as P;
    case 'summary':
      return (_destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'summary'))) as P;
    case 'summaryItemHash':
      return (IsarNative.jsObjectGet(jsObj, 'summaryItemHash')) as P;
    case 'talentGrid':
      return (_destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'talentGrid'))) as P;
    case 'tooltipNotifications':
      return (_destinyInventoryItemDefinitionDestinyItemTooltipNotificationListConverter
          .fromIsar(
              (IsarNative.jsObjectGet(jsObj, 'tooltipNotifications') as List?)
                  ?.map((e) => e ?? '')
                  .toList()
                  .cast<String>())) as P;
    case 'tooltipStyle':
      return (IsarNative.jsObjectGet(jsObj, 'tooltipStyle')) as P;
    case 'traitHashes':
      return ((IsarNative.jsObjectGet(jsObj, 'traitHashes') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<int>()) as P;
    case 'traitIds':
      return ((IsarNative.jsObjectGet(jsObj, 'traitIds') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>()) as P;
    case 'translationBlock':
      return (_destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'translationBlock'))) as P;
    case 'uiItemDisplayStyle':
      return (IsarNative.jsObjectGet(jsObj, 'uiItemDisplayStyle')) as P;
    case 'value':
      return (_destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'value'))) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _destinyInventoryItemDefinitionAttachLinks(
    IsarCollection col, int id, DestinyInventoryItemDefinition object) {}

extension DestinyInventoryItemDefinitionQueryWhereSort on QueryBuilder<
    DestinyInventoryItemDefinition, DestinyInventoryItemDefinition, QWhere> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhere> anyHash() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DestinyInventoryItemDefinitionQueryWhere on QueryBuilder<
    DestinyInventoryItemDefinition,
    DestinyInventoryItemDefinition,
    QWhereClause> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhereClause> hashEqualTo(int hash) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: hash,
      includeLower: true,
      upper: hash,
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhereClause> hashNotEqualTo(int hash) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: hash, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: hash, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: hash, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: hash, includeUpper: false),
      );
    }
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhereClause> hashGreaterThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: hash, includeLower: include),
    );
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhereClause> hashLessThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: hash, includeUpper: include),
    );
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhereClause> hashBetween(
    int lowerHash,
    int upperHash, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerHash,
      includeLower: includeLower,
      upper: upperHash,
      includeUpper: includeUpper,
    ));
  }
}

extension DestinyInventoryItemDefinitionQueryFilter on QueryBuilder<
    DestinyInventoryItemDefinition,
    DestinyInventoryItemDefinition,
    QFilterCondition> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> actionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'action',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> actionEqualTo(
    DestinyItemActionBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'action',
      value:
          _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> actionGreaterThan(
    DestinyItemActionBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'action',
      value:
          _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> actionLessThan(
    DestinyItemActionBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'action',
      value:
          _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> actionBetween(
    DestinyItemActionBlockDefinition? lower,
    DestinyItemActionBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'action',
      lower:
          _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> actionStartsWith(
    DestinyItemActionBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'action',
      value:
          _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> actionEndsWith(
    DestinyItemActionBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'action',
      value:
          _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      actionContains(DestinyItemActionBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'action',
      value:
          _destinyInventoryItemDefinitionDestinyItemActionBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      actionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'action',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> allowActionsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'allowActions',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> allowActionsEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'allowActions',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> animationsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'animations',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> animationsAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'animations',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> animationsAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'animations',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> animationsAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'animations',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> animationsAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'animations',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> animationsAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'animations',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> animationsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'animations',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> animationsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'animations',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      animationsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'animations',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      animationsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'animations',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> backgroundColorIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'backgroundColor',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> backgroundColorEqualTo(
    DestinyColor? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'backgroundColor',
      value: _destinyInventoryItemDefinitionDestinyColorConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> backgroundColorGreaterThan(
    DestinyColor? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'backgroundColor',
      value: _destinyInventoryItemDefinitionDestinyColorConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> backgroundColorLessThan(
    DestinyColor? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'backgroundColor',
      value: _destinyInventoryItemDefinitionDestinyColorConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> backgroundColorBetween(
    DestinyColor? lower,
    DestinyColor? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'backgroundColor',
      lower: _destinyInventoryItemDefinitionDestinyColorConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _destinyInventoryItemDefinitionDestinyColorConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> backgroundColorStartsWith(
    DestinyColor value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'backgroundColor',
      value: _destinyInventoryItemDefinitionDestinyColorConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> backgroundColorEndsWith(
    DestinyColor value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'backgroundColor',
      value: _destinyInventoryItemDefinitionDestinyColorConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      backgroundColorContains(DestinyColor value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'backgroundColor',
      value: _destinyInventoryItemDefinitionDestinyColorConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      backgroundColorMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'backgroundColor',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> breakerTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'breakerType',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> breakerTypeEqualTo(DestinyBreakerType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'breakerType',
      value: _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> breakerTypeGreaterThan(
    DestinyBreakerType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'breakerType',
      value: _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> breakerTypeLessThan(
    DestinyBreakerType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'breakerType',
      value: _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> breakerTypeBetween(
    DestinyBreakerType? lower,
    DestinyBreakerType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'breakerType',
      lower: _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
          .toIsar(lower),
      includeLower: includeLower,
      upper: _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
          .toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> breakerTypeHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'breakerTypeHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> breakerTypeHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'breakerTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> breakerTypeHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'breakerTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> breakerTypeHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'breakerTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> breakerTypeHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'breakerTypeHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> classTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'classType',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> classTypeEqualTo(DestinyClass? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'classType',
      value: _destinyInventoryItemDefinitionDestinyClassConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> classTypeGreaterThan(
    DestinyClass? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'classType',
      value: _destinyInventoryItemDefinitionDestinyClassConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> classTypeLessThan(
    DestinyClass? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'classType',
      value: _destinyInventoryItemDefinitionDestinyClassConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> classTypeBetween(
    DestinyClass? lower,
    DestinyClass? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'classType',
      lower: _destinyInventoryItemDefinitionDestinyClassConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _destinyInventoryItemDefinitionDestinyClassConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> collectibleHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'collectibleHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> collectibleHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'collectibleHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> collectibleHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'collectibleHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> collectibleHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'collectibleHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> collectibleHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'collectibleHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> craftingIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'crafting',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> craftingEqualTo(
    DestinyItemCraftingBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'crafting',
      value:
          _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> craftingGreaterThan(
    DestinyItemCraftingBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'crafting',
      value:
          _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> craftingLessThan(
    DestinyItemCraftingBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'crafting',
      value:
          _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> craftingBetween(
    DestinyItemCraftingBlockDefinition? lower,
    DestinyItemCraftingBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'crafting',
      lower:
          _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> craftingStartsWith(
    DestinyItemCraftingBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'crafting',
      value:
          _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> craftingEndsWith(
    DestinyItemCraftingBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'crafting',
      value:
          _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      craftingContains(DestinyItemCraftingBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'crafting',
      value:
          _destinyInventoryItemDefinitionDestinyItemCraftingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      craftingMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'crafting',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypeHashesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'damageTypeHashes',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypeHashesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'damageTypeHashes',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypeHashesAnyEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'damageTypeHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypeHashesAnyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'damageTypeHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypeHashesAnyLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'damageTypeHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypeHashesAnyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'damageTypeHashes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'damageTypes',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'damageTypes',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypesAnyEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'damageTypes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypesAnyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'damageTypes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypesAnyLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'damageTypes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> damageTypesAnyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'damageTypes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> defaultDamageTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'defaultDamageType',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> defaultDamageTypeEqualTo(DamageType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'defaultDamageType',
      value: _destinyInventoryItemDefinitionDamageTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> defaultDamageTypeGreaterThan(
    DamageType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'defaultDamageType',
      value: _destinyInventoryItemDefinitionDamageTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> defaultDamageTypeLessThan(
    DamageType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'defaultDamageType',
      value: _destinyInventoryItemDefinitionDamageTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> defaultDamageTypeBetween(
    DamageType? lower,
    DamageType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'defaultDamageType',
      lower: _destinyInventoryItemDefinitionDamageTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _destinyInventoryItemDefinitionDamageTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> defaultDamageTypeHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'defaultDamageTypeHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> defaultDamageTypeHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'defaultDamageTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> defaultDamageTypeHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'defaultDamageTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> defaultDamageTypeHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'defaultDamageTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> defaultDamageTypeHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'defaultDamageTypeHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displayPropertiesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displayProperties',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displayPropertiesEqualTo(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayProperties',
      value:
          _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displayPropertiesGreaterThan(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'displayProperties',
      value:
          _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displayPropertiesLessThan(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'displayProperties',
      value:
          _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displayPropertiesBetween(
    DestinyDisplayPropertiesDefinition? lower,
    DestinyDisplayPropertiesDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'displayProperties',
      lower:
          _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displayPropertiesStartsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displayProperties',
      value:
          _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displayPropertiesEndsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displayProperties',
      value:
          _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      displayPropertiesContains(DestinyDisplayPropertiesDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displayProperties',
      value:
          _destinyInventoryItemDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      displayPropertiesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displayProperties',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displaySourceIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displaySource',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displaySourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displaySource',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displaySourceGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'displaySource',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displaySourceLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'displaySource',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displaySourceBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'displaySource',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displaySourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displaySource',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> displaySourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displaySource',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      displaySourceContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displaySource',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      displaySourceMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displaySource',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> doesPostmasterPullHaveSideEffectsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'doesPostmasterPullHaveSideEffects',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      doesPostmasterPullHaveSideEffectsEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'doesPostmasterPullHaveSideEffects',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> emblemObjectiveHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'emblemObjectiveHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> emblemObjectiveHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'emblemObjectiveHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> emblemObjectiveHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'emblemObjectiveHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> emblemObjectiveHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'emblemObjectiveHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> emblemObjectiveHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'emblemObjectiveHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> equippableIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'equippable',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> equippableEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'equippable',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> equippingBlockIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'equippingBlock',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> equippingBlockEqualTo(
    DestinyEquippingBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'equippingBlock',
      value:
          _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> equippingBlockGreaterThan(
    DestinyEquippingBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'equippingBlock',
      value:
          _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> equippingBlockLessThan(
    DestinyEquippingBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'equippingBlock',
      value:
          _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> equippingBlockBetween(
    DestinyEquippingBlockDefinition? lower,
    DestinyEquippingBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'equippingBlock',
      lower:
          _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> equippingBlockStartsWith(
    DestinyEquippingBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'equippingBlock',
      value:
          _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> equippingBlockEndsWith(
    DestinyEquippingBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'equippingBlock',
      value:
          _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      equippingBlockContains(DestinyEquippingBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'equippingBlock',
      value:
          _destinyInventoryItemDefinitionDestinyEquippingBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      equippingBlockMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'equippingBlock',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> flavorTextIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'flavorText',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> flavorTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'flavorText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> flavorTextGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'flavorText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> flavorTextLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'flavorText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> flavorTextBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'flavorText',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> flavorTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'flavorText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> flavorTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'flavorText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      flavorTextContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'flavorText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      flavorTextMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'flavorText',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> gearsetIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'gearset',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> gearsetEqualTo(
    DestinyItemGearsetBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'gearset',
      value:
          _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> gearsetGreaterThan(
    DestinyItemGearsetBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'gearset',
      value:
          _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> gearsetLessThan(
    DestinyItemGearsetBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'gearset',
      value:
          _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> gearsetBetween(
    DestinyItemGearsetBlockDefinition? lower,
    DestinyItemGearsetBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'gearset',
      lower:
          _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> gearsetStartsWith(
    DestinyItemGearsetBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'gearset',
      value:
          _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> gearsetEndsWith(
    DestinyItemGearsetBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'gearset',
      value:
          _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      gearsetContains(DestinyItemGearsetBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'gearset',
      value:
          _destinyInventoryItemDefinitionDestinyItemGearsetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      gearsetMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'gearset',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> hashEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> hashGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> hashLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> hashBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'iconWatermark',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'iconWatermark',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'iconWatermark',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'iconWatermark',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'iconWatermark',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'iconWatermark',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'iconWatermark',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      iconWatermarkContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'iconWatermark',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      iconWatermarkMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'iconWatermark',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkShelvedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'iconWatermarkShelved',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkShelvedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'iconWatermarkShelved',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkShelvedGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'iconWatermarkShelved',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkShelvedLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'iconWatermarkShelved',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkShelvedBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'iconWatermarkShelved',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkShelvedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'iconWatermarkShelved',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> iconWatermarkShelvedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'iconWatermarkShelved',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      iconWatermarkShelvedContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'iconWatermarkShelved',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      iconWatermarkShelvedMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'iconWatermarkShelved',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> indexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> indexLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> indexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'index',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> inventoryIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'inventory',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> inventoryEqualTo(
    DestinyItemInventoryBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'inventory',
      value:
          _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> inventoryGreaterThan(
    DestinyItemInventoryBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'inventory',
      value:
          _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> inventoryLessThan(
    DestinyItemInventoryBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'inventory',
      value:
          _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> inventoryBetween(
    DestinyItemInventoryBlockDefinition? lower,
    DestinyItemInventoryBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'inventory',
      lower:
          _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> inventoryStartsWith(
    DestinyItemInventoryBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'inventory',
      value:
          _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> inventoryEndsWith(
    DestinyItemInventoryBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'inventory',
      value:
          _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      inventoryContains(DestinyItemInventoryBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'inventory',
      value:
          _destinyInventoryItemDefinitionDestinyItemInventoryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      inventoryMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'inventory',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> investmentStatsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'investmentStats',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> investmentStatsAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'investmentStats',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> investmentStatsAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'investmentStats',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> investmentStatsAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'investmentStats',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> investmentStatsAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'investmentStats',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> investmentStatsAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'investmentStats',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> investmentStatsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'investmentStats',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> investmentStatsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'investmentStats',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      investmentStatsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'investmentStats',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      investmentStatsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'investmentStats',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> isWrapperIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'isWrapper',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> isWrapperEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isWrapper',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemCategoryHashesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'itemCategoryHashes',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemCategoryHashesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'itemCategoryHashes',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemCategoryHashesAnyEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'itemCategoryHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemCategoryHashesAnyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'itemCategoryHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemCategoryHashesAnyLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'itemCategoryHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemCategoryHashesAnyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'itemCategoryHashes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemSubTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'itemSubType',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemSubTypeEqualTo(DestinyItemSubType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'itemSubType',
      value: _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemSubTypeGreaterThan(
    DestinyItemSubType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'itemSubType',
      value: _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemSubTypeLessThan(
    DestinyItemSubType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'itemSubType',
      value: _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemSubTypeBetween(
    DestinyItemSubType? lower,
    DestinyItemSubType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'itemSubType',
      lower: _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
          .toIsar(lower),
      includeLower: includeLower,
      upper: _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
          .toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'itemType',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeEqualTo(DestinyItemType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'itemType',
      value:
          _destinyInventoryItemDefinitionDestinyItemTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeGreaterThan(
    DestinyItemType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'itemType',
      value:
          _destinyInventoryItemDefinitionDestinyItemTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeLessThan(
    DestinyItemType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'itemType',
      value:
          _destinyInventoryItemDefinitionDestinyItemTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeBetween(
    DestinyItemType? lower,
    DestinyItemType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'itemType',
      lower:
          _destinyInventoryItemDefinitionDestinyItemTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeAndTierDisplayNameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'itemTypeAndTierDisplayName',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeAndTierDisplayNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'itemTypeAndTierDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeAndTierDisplayNameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'itemTypeAndTierDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeAndTierDisplayNameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'itemTypeAndTierDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeAndTierDisplayNameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'itemTypeAndTierDisplayName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeAndTierDisplayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'itemTypeAndTierDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeAndTierDisplayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'itemTypeAndTierDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      itemTypeAndTierDisplayNameContains(String value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'itemTypeAndTierDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      itemTypeAndTierDisplayNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'itemTypeAndTierDisplayName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeDisplayNameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'itemTypeDisplayName',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeDisplayNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'itemTypeDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeDisplayNameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'itemTypeDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeDisplayNameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'itemTypeDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeDisplayNameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'itemTypeDisplayName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeDisplayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'itemTypeDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> itemTypeDisplayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'itemTypeDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      itemTypeDisplayNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'itemTypeDisplayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      itemTypeDisplayNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'itemTypeDisplayName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> linksIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'links',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> linksAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'links',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> linksAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'links',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> linksAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'links',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> linksAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'links',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> linksAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'links',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> linksAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'links',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> linksAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'links',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      linksAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'links',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      linksAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'links',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> loreHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'loreHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> loreHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'loreHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> loreHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'loreHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> loreHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'loreHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> loreHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'loreHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> metricsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'metrics',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> metricsEqualTo(
    DestinyItemMetricBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'metrics',
      value:
          _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> metricsGreaterThan(
    DestinyItemMetricBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'metrics',
      value:
          _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> metricsLessThan(
    DestinyItemMetricBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'metrics',
      value:
          _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> metricsBetween(
    DestinyItemMetricBlockDefinition? lower,
    DestinyItemMetricBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'metrics',
      lower:
          _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> metricsStartsWith(
    DestinyItemMetricBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'metrics',
      value:
          _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> metricsEndsWith(
    DestinyItemMetricBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'metrics',
      value:
          _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      metricsContains(DestinyItemMetricBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'metrics',
      value:
          _destinyInventoryItemDefinitionDestinyItemMetricBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      metricsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'metrics',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> nonTransferrableIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nonTransferrable',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> nonTransferrableEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nonTransferrable',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> objectivesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'objectives',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> objectivesEqualTo(
    DestinyItemObjectiveBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'objectives',
      value:
          _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> objectivesGreaterThan(
    DestinyItemObjectiveBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'objectives',
      value:
          _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> objectivesLessThan(
    DestinyItemObjectiveBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'objectives',
      value:
          _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> objectivesBetween(
    DestinyItemObjectiveBlockDefinition? lower,
    DestinyItemObjectiveBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'objectives',
      lower:
          _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> objectivesStartsWith(
    DestinyItemObjectiveBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'objectives',
      value:
          _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> objectivesEndsWith(
    DestinyItemObjectiveBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'objectives',
      value:
          _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      objectivesContains(DestinyItemObjectiveBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'objectives',
      value:
          _destinyInventoryItemDefinitionDestinyItemObjectiveBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      objectivesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'objectives',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> perksIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'perks',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> perksAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'perks',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> perksAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'perks',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> perksAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'perks',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> perksAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'perks',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> perksAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'perks',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> perksAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'perks',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> perksAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'perks',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      perksAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'perks',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      perksAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'perks',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> plugIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'plug',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> plugEqualTo(
    DestinyItemPlugDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'plug',
      value: _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> plugGreaterThan(
    DestinyItemPlugDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'plug',
      value: _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> plugLessThan(
    DestinyItemPlugDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'plug',
      value: _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> plugBetween(
    DestinyItemPlugDefinition? lower,
    DestinyItemPlugDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'plug',
      lower: _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .toIsar(lower),
      includeLower: includeLower,
      upper: _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> plugStartsWith(
    DestinyItemPlugDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'plug',
      value: _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> plugEndsWith(
    DestinyItemPlugDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'plug',
      value: _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      plugContains(DestinyItemPlugDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'plug',
      value: _destinyInventoryItemDefinitionDestinyItemPlugDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      plugMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'plug',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> previewIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'preview',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> previewEqualTo(
    DestinyItemPreviewBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'preview',
      value:
          _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> previewGreaterThan(
    DestinyItemPreviewBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'preview',
      value:
          _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> previewLessThan(
    DestinyItemPreviewBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'preview',
      value:
          _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> previewBetween(
    DestinyItemPreviewBlockDefinition? lower,
    DestinyItemPreviewBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'preview',
      lower:
          _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> previewStartsWith(
    DestinyItemPreviewBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'preview',
      value:
          _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> previewEndsWith(
    DestinyItemPreviewBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'preview',
      value:
          _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      previewContains(DestinyItemPreviewBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'preview',
      value:
          _destinyInventoryItemDefinitionDestinyItemPreviewBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      previewMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'preview',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> qualityIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'quality',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> qualityEqualTo(
    DestinyItemQualityBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'quality',
      value:
          _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> qualityGreaterThan(
    DestinyItemQualityBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'quality',
      value:
          _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> qualityLessThan(
    DestinyItemQualityBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'quality',
      value:
          _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> qualityBetween(
    DestinyItemQualityBlockDefinition? lower,
    DestinyItemQualityBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'quality',
      lower:
          _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> qualityStartsWith(
    DestinyItemQualityBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'quality',
      value:
          _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> qualityEndsWith(
    DestinyItemQualityBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'quality',
      value:
          _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      qualityContains(DestinyItemQualityBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'quality',
      value:
          _destinyInventoryItemDefinitionDestinyItemQualityBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      qualityMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'quality',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sackIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'sack',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sackEqualTo(
    DestinyItemSackBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sack',
      value:
          _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sackGreaterThan(
    DestinyItemSackBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sack',
      value:
          _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sackLessThan(
    DestinyItemSackBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sack',
      value:
          _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sackBetween(
    DestinyItemSackBlockDefinition? lower,
    DestinyItemSackBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sack',
      lower:
          _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sackStartsWith(
    DestinyItemSackBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sack',
      value:
          _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sackEndsWith(
    DestinyItemSackBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sack',
      value:
          _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      sackContains(DestinyItemSackBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sack',
      value:
          _destinyInventoryItemDefinitionDestinyItemSackBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      sackMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sack',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> screenshotIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'screenshot',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> screenshotEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'screenshot',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> screenshotGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'screenshot',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> screenshotLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'screenshot',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> screenshotBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'screenshot',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> screenshotStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'screenshot',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> screenshotEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'screenshot',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      screenshotContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'screenshot',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      screenshotMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'screenshot',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> seasonHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'seasonHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> seasonHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seasonHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> seasonHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'seasonHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> seasonHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'seasonHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> seasonHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'seasonHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryIconIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'secondaryIcon',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryIconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'secondaryIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryIconGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'secondaryIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryIconLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'secondaryIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryIconBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'secondaryIcon',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'secondaryIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'secondaryIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      secondaryIconContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'secondaryIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      secondaryIconMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'secondaryIcon',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryOverlayIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'secondaryOverlay',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryOverlayEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'secondaryOverlay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryOverlayGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'secondaryOverlay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryOverlayLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'secondaryOverlay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryOverlayBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'secondaryOverlay',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryOverlayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'secondaryOverlay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondaryOverlayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'secondaryOverlay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      secondaryOverlayContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'secondaryOverlay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      secondaryOverlayMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'secondaryOverlay',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondarySpecialIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'secondarySpecial',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondarySpecialEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'secondarySpecial',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondarySpecialGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'secondarySpecial',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondarySpecialLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'secondarySpecial',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondarySpecialBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'secondarySpecial',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondarySpecialStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'secondarySpecial',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> secondarySpecialEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'secondarySpecial',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      secondarySpecialContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'secondarySpecial',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      secondarySpecialMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'secondarySpecial',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> setDataIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'setData',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> setDataEqualTo(
    DestinyItemSetBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'setData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> setDataGreaterThan(
    DestinyItemSetBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'setData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> setDataLessThan(
    DestinyItemSetBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'setData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> setDataBetween(
    DestinyItemSetBlockDefinition? lower,
    DestinyItemSetBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'setData',
      lower:
          _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> setDataStartsWith(
    DestinyItemSetBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'setData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> setDataEndsWith(
    DestinyItemSetBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'setData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      setDataContains(DestinyItemSetBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'setData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSetBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      setDataMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'setData',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> socketsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'sockets',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> socketsEqualTo(
    DestinyItemSocketBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sockets',
      value:
          _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> socketsGreaterThan(
    DestinyItemSocketBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sockets',
      value:
          _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> socketsLessThan(
    DestinyItemSocketBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sockets',
      value:
          _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> socketsBetween(
    DestinyItemSocketBlockDefinition? lower,
    DestinyItemSocketBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sockets',
      lower:
          _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> socketsStartsWith(
    DestinyItemSocketBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sockets',
      value:
          _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> socketsEndsWith(
    DestinyItemSocketBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sockets',
      value:
          _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      socketsContains(DestinyItemSocketBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sockets',
      value:
          _destinyInventoryItemDefinitionDestinyItemSocketBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      socketsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sockets',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sourceDataIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'sourceData',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sourceDataEqualTo(
    DestinyItemSourceBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sourceData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sourceDataGreaterThan(
    DestinyItemSourceBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sourceData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sourceDataLessThan(
    DestinyItemSourceBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sourceData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sourceDataBetween(
    DestinyItemSourceBlockDefinition? lower,
    DestinyItemSourceBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sourceData',
      lower:
          _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sourceDataStartsWith(
    DestinyItemSourceBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sourceData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> sourceDataEndsWith(
    DestinyItemSourceBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sourceData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      sourceDataContains(DestinyItemSourceBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sourceData',
      value:
          _destinyInventoryItemDefinitionDestinyItemSourceBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      sourceDataMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sourceData',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> specialItemTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'specialItemType',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> specialItemTypeEqualTo(SpecialItemType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'specialItemType',
      value:
          _destinyInventoryItemDefinitionSpecialItemTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> specialItemTypeGreaterThan(
    SpecialItemType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'specialItemType',
      value:
          _destinyInventoryItemDefinitionSpecialItemTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> specialItemTypeLessThan(
    SpecialItemType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'specialItemType',
      value:
          _destinyInventoryItemDefinitionSpecialItemTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> specialItemTypeBetween(
    SpecialItemType? lower,
    SpecialItemType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'specialItemType',
      lower:
          _destinyInventoryItemDefinitionSpecialItemTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionSpecialItemTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> statsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stats',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> statsEqualTo(
    DestinyItemStatBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stats',
      value:
          _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> statsGreaterThan(
    DestinyItemStatBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'stats',
      value:
          _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> statsLessThan(
    DestinyItemStatBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'stats',
      value:
          _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> statsBetween(
    DestinyItemStatBlockDefinition? lower,
    DestinyItemStatBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'stats',
      lower:
          _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> statsStartsWith(
    DestinyItemStatBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'stats',
      value:
          _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> statsEndsWith(
    DestinyItemStatBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'stats',
      value:
          _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      statsContains(DestinyItemStatBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'stats',
      value:
          _destinyInventoryItemDefinitionDestinyItemStatBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      statsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'stats',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'summary',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryEqualTo(
    DestinyItemSummaryBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'summary',
      value:
          _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryGreaterThan(
    DestinyItemSummaryBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'summary',
      value:
          _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryLessThan(
    DestinyItemSummaryBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'summary',
      value:
          _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryBetween(
    DestinyItemSummaryBlockDefinition? lower,
    DestinyItemSummaryBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'summary',
      lower:
          _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryStartsWith(
    DestinyItemSummaryBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'summary',
      value:
          _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryEndsWith(
    DestinyItemSummaryBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'summary',
      value:
          _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      summaryContains(DestinyItemSummaryBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'summary',
      value:
          _destinyInventoryItemDefinitionDestinyItemSummaryBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      summaryMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'summary',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryItemHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'summaryItemHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryItemHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'summaryItemHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryItemHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'summaryItemHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryItemHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'summaryItemHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> summaryItemHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'summaryItemHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> talentGridIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'talentGrid',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> talentGridEqualTo(
    DestinyItemTalentGridBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'talentGrid',
      value:
          _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> talentGridGreaterThan(
    DestinyItemTalentGridBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'talentGrid',
      value:
          _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> talentGridLessThan(
    DestinyItemTalentGridBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'talentGrid',
      value:
          _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> talentGridBetween(
    DestinyItemTalentGridBlockDefinition? lower,
    DestinyItemTalentGridBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'talentGrid',
      lower:
          _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> talentGridStartsWith(
    DestinyItemTalentGridBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'talentGrid',
      value:
          _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> talentGridEndsWith(
    DestinyItemTalentGridBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'talentGrid',
      value:
          _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      talentGridContains(DestinyItemTalentGridBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'talentGrid',
      value:
          _destinyInventoryItemDefinitionDestinyItemTalentGridBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      talentGridMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'talentGrid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipNotificationsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'tooltipNotifications',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipNotificationsAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tooltipNotifications',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipNotificationsAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tooltipNotifications',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipNotificationsAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tooltipNotifications',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipNotificationsAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tooltipNotifications',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipNotificationsAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tooltipNotifications',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipNotificationsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'tooltipNotifications',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipNotificationsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'tooltipNotifications',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      tooltipNotificationsAnyContains(String value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'tooltipNotifications',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      tooltipNotificationsAnyMatches(String pattern,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'tooltipNotifications',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipStyleIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'tooltipStyle',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipStyleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tooltipStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipStyleGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tooltipStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipStyleLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tooltipStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipStyleBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tooltipStyle',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipStyleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'tooltipStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> tooltipStyleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'tooltipStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      tooltipStyleContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'tooltipStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      tooltipStyleMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'tooltipStyle',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitHashesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'traitHashes',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitHashesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitHashes',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitHashesAnyEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitHashesAnyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'traitHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitHashesAnyLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'traitHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitHashesAnyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'traitHashes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitIdsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'traitIds',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitIdsAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitIds',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitIdsAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitIdsAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'traitIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitIdsAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'traitIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitIdsAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'traitIds',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitIdsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'traitIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> traitIdsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'traitIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      traitIdsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'traitIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      traitIdsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'traitIds',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> translationBlockIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'translationBlock',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> translationBlockEqualTo(
    DestinyItemTranslationBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'translationBlock',
      value:
          _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> translationBlockGreaterThan(
    DestinyItemTranslationBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'translationBlock',
      value:
          _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> translationBlockLessThan(
    DestinyItemTranslationBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'translationBlock',
      value:
          _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> translationBlockBetween(
    DestinyItemTranslationBlockDefinition? lower,
    DestinyItemTranslationBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'translationBlock',
      lower:
          _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> translationBlockStartsWith(
    DestinyItemTranslationBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'translationBlock',
      value:
          _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> translationBlockEndsWith(
    DestinyItemTranslationBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'translationBlock',
      value:
          _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      translationBlockContains(DestinyItemTranslationBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'translationBlock',
      value:
          _destinyInventoryItemDefinitionDestinyItemTranslationBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      translationBlockMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'translationBlock',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> uiItemDisplayStyleIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'uiItemDisplayStyle',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> uiItemDisplayStyleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'uiItemDisplayStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> uiItemDisplayStyleGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'uiItemDisplayStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> uiItemDisplayStyleLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'uiItemDisplayStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> uiItemDisplayStyleBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'uiItemDisplayStyle',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> uiItemDisplayStyleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'uiItemDisplayStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> uiItemDisplayStyleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'uiItemDisplayStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      uiItemDisplayStyleContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'uiItemDisplayStyle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      uiItemDisplayStyleMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'uiItemDisplayStyle',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> valueIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'value',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> valueEqualTo(
    DestinyItemValueBlockDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'value',
      value:
          _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> valueGreaterThan(
    DestinyItemValueBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'value',
      value:
          _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> valueLessThan(
    DestinyItemValueBlockDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'value',
      value:
          _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> valueBetween(
    DestinyItemValueBlockDefinition? lower,
    DestinyItemValueBlockDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'value',
      lower:
          _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> valueStartsWith(
    DestinyItemValueBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'value',
      value:
          _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> valueEndsWith(
    DestinyItemValueBlockDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'value',
      value:
          _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      valueContains(DestinyItemValueBlockDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'value',
      value:
          _destinyInventoryItemDefinitionDestinyItemValueBlockDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QAfterFilterCondition>
      valueMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'value',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DestinyInventoryItemDefinitionQueryLinks on QueryBuilder<
    DestinyInventoryItemDefinition,
    DestinyInventoryItemDefinition,
    QFilterCondition> {}

extension DestinyInventoryItemDefinitionQueryWhereSortBy on QueryBuilder<
    DestinyInventoryItemDefinition, DestinyInventoryItemDefinition, QSortBy> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByAction() {
    return addSortByInternal('action', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByActionDesc() {
    return addSortByInternal('action', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByAllowActions() {
    return addSortByInternal('allowActions', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByAllowActionsDesc() {
    return addSortByInternal('allowActions', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByBackgroundColor() {
    return addSortByInternal('backgroundColor', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByBackgroundColorDesc() {
    return addSortByInternal('backgroundColor', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByBreakerType() {
    return addSortByInternal('breakerType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByBreakerTypeDesc() {
    return addSortByInternal('breakerType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByBreakerTypeHash() {
    return addSortByInternal('breakerTypeHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByBreakerTypeHashDesc() {
    return addSortByInternal('breakerTypeHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByClassType() {
    return addSortByInternal('classType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByClassTypeDesc() {
    return addSortByInternal('classType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByCollectibleHash() {
    return addSortByInternal('collectibleHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByCollectibleHashDesc() {
    return addSortByInternal('collectibleHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByCrafting() {
    return addSortByInternal('crafting', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByCraftingDesc() {
    return addSortByInternal('crafting', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByDefaultDamageType() {
    return addSortByInternal('defaultDamageType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByDefaultDamageTypeDesc() {
    return addSortByInternal('defaultDamageType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByDefaultDamageTypeHash() {
    return addSortByInternal('defaultDamageTypeHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByDefaultDamageTypeHashDesc() {
    return addSortByInternal('defaultDamageTypeHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByDisplaySource() {
    return addSortByInternal('displaySource', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByDisplaySourceDesc() {
    return addSortByInternal('displaySource', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByDoesPostmasterPullHaveSideEffects() {
    return addSortByInternal('doesPostmasterPullHaveSideEffects', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByDoesPostmasterPullHaveSideEffectsDesc() {
    return addSortByInternal('doesPostmasterPullHaveSideEffects', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByEmblemObjectiveHash() {
    return addSortByInternal('emblemObjectiveHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByEmblemObjectiveHashDesc() {
    return addSortByInternal('emblemObjectiveHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByEquippable() {
    return addSortByInternal('equippable', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByEquippableDesc() {
    return addSortByInternal('equippable', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByEquippingBlock() {
    return addSortByInternal('equippingBlock', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByEquippingBlockDesc() {
    return addSortByInternal('equippingBlock', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByFlavorText() {
    return addSortByInternal('flavorText', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByFlavorTextDesc() {
    return addSortByInternal('flavorText', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByGearset() {
    return addSortByInternal('gearset', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByGearsetDesc() {
    return addSortByInternal('gearset', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByIconWatermark() {
    return addSortByInternal('iconWatermark', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByIconWatermarkDesc() {
    return addSortByInternal('iconWatermark', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByIconWatermarkShelved() {
    return addSortByInternal('iconWatermarkShelved', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByIconWatermarkShelvedDesc() {
    return addSortByInternal('iconWatermarkShelved', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByInventory() {
    return addSortByInternal('inventory', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByInventoryDesc() {
    return addSortByInternal('inventory', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByIsWrapper() {
    return addSortByInternal('isWrapper', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByIsWrapperDesc() {
    return addSortByInternal('isWrapper', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByItemSubType() {
    return addSortByInternal('itemSubType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByItemSubTypeDesc() {
    return addSortByInternal('itemSubType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByItemType() {
    return addSortByInternal('itemType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByItemTypeDesc() {
    return addSortByInternal('itemType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByItemTypeAndTierDisplayName() {
    return addSortByInternal('itemTypeAndTierDisplayName', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByItemTypeAndTierDisplayNameDesc() {
    return addSortByInternal('itemTypeAndTierDisplayName', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByItemTypeDisplayName() {
    return addSortByInternal('itemTypeDisplayName', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByItemTypeDisplayNameDesc() {
    return addSortByInternal('itemTypeDisplayName', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByLoreHash() {
    return addSortByInternal('loreHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByLoreHashDesc() {
    return addSortByInternal('loreHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByMetrics() {
    return addSortByInternal('metrics', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByMetricsDesc() {
    return addSortByInternal('metrics', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByNonTransferrable() {
    return addSortByInternal('nonTransferrable', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByNonTransferrableDesc() {
    return addSortByInternal('nonTransferrable', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByObjectives() {
    return addSortByInternal('objectives', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByObjectivesDesc() {
    return addSortByInternal('objectives', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByPlug() {
    return addSortByInternal('plug', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByPlugDesc() {
    return addSortByInternal('plug', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByPreview() {
    return addSortByInternal('preview', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByPreviewDesc() {
    return addSortByInternal('preview', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByQuality() {
    return addSortByInternal('quality', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByQualityDesc() {
    return addSortByInternal('quality', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySack() {
    return addSortByInternal('sack', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySackDesc() {
    return addSortByInternal('sack', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByScreenshot() {
    return addSortByInternal('screenshot', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByScreenshotDesc() {
    return addSortByInternal('screenshot', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySeasonHash() {
    return addSortByInternal('seasonHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySeasonHashDesc() {
    return addSortByInternal('seasonHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySecondaryIcon() {
    return addSortByInternal('secondaryIcon', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySecondaryIconDesc() {
    return addSortByInternal('secondaryIcon', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySecondaryOverlay() {
    return addSortByInternal('secondaryOverlay', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySecondaryOverlayDesc() {
    return addSortByInternal('secondaryOverlay', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySecondarySpecial() {
    return addSortByInternal('secondarySpecial', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySecondarySpecialDesc() {
    return addSortByInternal('secondarySpecial', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySetData() {
    return addSortByInternal('setData', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySetDataDesc() {
    return addSortByInternal('setData', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySockets() {
    return addSortByInternal('sockets', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySocketsDesc() {
    return addSortByInternal('sockets', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySourceData() {
    return addSortByInternal('sourceData', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySourceDataDesc() {
    return addSortByInternal('sourceData', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySpecialItemType() {
    return addSortByInternal('specialItemType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySpecialItemTypeDesc() {
    return addSortByInternal('specialItemType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByStats() {
    return addSortByInternal('stats', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByStatsDesc() {
    return addSortByInternal('stats', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySummary() {
    return addSortByInternal('summary', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySummaryDesc() {
    return addSortByInternal('summary', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySummaryItemHash() {
    return addSortByInternal('summaryItemHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySummaryItemHashDesc() {
    return addSortByInternal('summaryItemHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByTalentGrid() {
    return addSortByInternal('talentGrid', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByTalentGridDesc() {
    return addSortByInternal('talentGrid', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByTooltipStyle() {
    return addSortByInternal('tooltipStyle', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByTooltipStyleDesc() {
    return addSortByInternal('tooltipStyle', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByTranslationBlock() {
    return addSortByInternal('translationBlock', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByTranslationBlockDesc() {
    return addSortByInternal('translationBlock', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByUiItemDisplayStyle() {
    return addSortByInternal('uiItemDisplayStyle', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByUiItemDisplayStyleDesc() {
    return addSortByInternal('uiItemDisplayStyle', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByValue() {
    return addSortByInternal('value', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByValueDesc() {
    return addSortByInternal('value', Sort.desc);
  }
}

extension DestinyInventoryItemDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyInventoryItemDefinition,
    DestinyInventoryItemDefinition,
    QSortThenBy> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByAction() {
    return addSortByInternal('action', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByActionDesc() {
    return addSortByInternal('action', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByAllowActions() {
    return addSortByInternal('allowActions', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByAllowActionsDesc() {
    return addSortByInternal('allowActions', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByBackgroundColor() {
    return addSortByInternal('backgroundColor', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByBackgroundColorDesc() {
    return addSortByInternal('backgroundColor', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByBreakerType() {
    return addSortByInternal('breakerType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByBreakerTypeDesc() {
    return addSortByInternal('breakerType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByBreakerTypeHash() {
    return addSortByInternal('breakerTypeHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByBreakerTypeHashDesc() {
    return addSortByInternal('breakerTypeHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByClassType() {
    return addSortByInternal('classType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByClassTypeDesc() {
    return addSortByInternal('classType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByCollectibleHash() {
    return addSortByInternal('collectibleHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByCollectibleHashDesc() {
    return addSortByInternal('collectibleHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByCrafting() {
    return addSortByInternal('crafting', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByCraftingDesc() {
    return addSortByInternal('crafting', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByDefaultDamageType() {
    return addSortByInternal('defaultDamageType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByDefaultDamageTypeDesc() {
    return addSortByInternal('defaultDamageType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByDefaultDamageTypeHash() {
    return addSortByInternal('defaultDamageTypeHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByDefaultDamageTypeHashDesc() {
    return addSortByInternal('defaultDamageTypeHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByDisplaySource() {
    return addSortByInternal('displaySource', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByDisplaySourceDesc() {
    return addSortByInternal('displaySource', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByDoesPostmasterPullHaveSideEffects() {
    return addSortByInternal('doesPostmasterPullHaveSideEffects', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByDoesPostmasterPullHaveSideEffectsDesc() {
    return addSortByInternal('doesPostmasterPullHaveSideEffects', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByEmblemObjectiveHash() {
    return addSortByInternal('emblemObjectiveHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByEmblemObjectiveHashDesc() {
    return addSortByInternal('emblemObjectiveHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByEquippable() {
    return addSortByInternal('equippable', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByEquippableDesc() {
    return addSortByInternal('equippable', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByEquippingBlock() {
    return addSortByInternal('equippingBlock', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByEquippingBlockDesc() {
    return addSortByInternal('equippingBlock', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByFlavorText() {
    return addSortByInternal('flavorText', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByFlavorTextDesc() {
    return addSortByInternal('flavorText', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByGearset() {
    return addSortByInternal('gearset', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByGearsetDesc() {
    return addSortByInternal('gearset', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByIconWatermark() {
    return addSortByInternal('iconWatermark', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByIconWatermarkDesc() {
    return addSortByInternal('iconWatermark', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByIconWatermarkShelved() {
    return addSortByInternal('iconWatermarkShelved', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByIconWatermarkShelvedDesc() {
    return addSortByInternal('iconWatermarkShelved', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByInventory() {
    return addSortByInternal('inventory', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByInventoryDesc() {
    return addSortByInternal('inventory', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByIsWrapper() {
    return addSortByInternal('isWrapper', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByIsWrapperDesc() {
    return addSortByInternal('isWrapper', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByItemSubType() {
    return addSortByInternal('itemSubType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByItemSubTypeDesc() {
    return addSortByInternal('itemSubType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByItemType() {
    return addSortByInternal('itemType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByItemTypeDesc() {
    return addSortByInternal('itemType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByItemTypeAndTierDisplayName() {
    return addSortByInternal('itemTypeAndTierDisplayName', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByItemTypeAndTierDisplayNameDesc() {
    return addSortByInternal('itemTypeAndTierDisplayName', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByItemTypeDisplayName() {
    return addSortByInternal('itemTypeDisplayName', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByItemTypeDisplayNameDesc() {
    return addSortByInternal('itemTypeDisplayName', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByLoreHash() {
    return addSortByInternal('loreHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByLoreHashDesc() {
    return addSortByInternal('loreHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByMetrics() {
    return addSortByInternal('metrics', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByMetricsDesc() {
    return addSortByInternal('metrics', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByNonTransferrable() {
    return addSortByInternal('nonTransferrable', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByNonTransferrableDesc() {
    return addSortByInternal('nonTransferrable', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByObjectives() {
    return addSortByInternal('objectives', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByObjectivesDesc() {
    return addSortByInternal('objectives', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByPlug() {
    return addSortByInternal('plug', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByPlugDesc() {
    return addSortByInternal('plug', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByPreview() {
    return addSortByInternal('preview', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByPreviewDesc() {
    return addSortByInternal('preview', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByQuality() {
    return addSortByInternal('quality', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByQualityDesc() {
    return addSortByInternal('quality', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySack() {
    return addSortByInternal('sack', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySackDesc() {
    return addSortByInternal('sack', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByScreenshot() {
    return addSortByInternal('screenshot', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByScreenshotDesc() {
    return addSortByInternal('screenshot', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySeasonHash() {
    return addSortByInternal('seasonHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySeasonHashDesc() {
    return addSortByInternal('seasonHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySecondaryIcon() {
    return addSortByInternal('secondaryIcon', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySecondaryIconDesc() {
    return addSortByInternal('secondaryIcon', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySecondaryOverlay() {
    return addSortByInternal('secondaryOverlay', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySecondaryOverlayDesc() {
    return addSortByInternal('secondaryOverlay', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySecondarySpecial() {
    return addSortByInternal('secondarySpecial', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySecondarySpecialDesc() {
    return addSortByInternal('secondarySpecial', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySetData() {
    return addSortByInternal('setData', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySetDataDesc() {
    return addSortByInternal('setData', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySockets() {
    return addSortByInternal('sockets', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySocketsDesc() {
    return addSortByInternal('sockets', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySourceData() {
    return addSortByInternal('sourceData', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySourceDataDesc() {
    return addSortByInternal('sourceData', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySpecialItemType() {
    return addSortByInternal('specialItemType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySpecialItemTypeDesc() {
    return addSortByInternal('specialItemType', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByStats() {
    return addSortByInternal('stats', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByStatsDesc() {
    return addSortByInternal('stats', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySummary() {
    return addSortByInternal('summary', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySummaryDesc() {
    return addSortByInternal('summary', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySummaryItemHash() {
    return addSortByInternal('summaryItemHash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySummaryItemHashDesc() {
    return addSortByInternal('summaryItemHash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByTalentGrid() {
    return addSortByInternal('talentGrid', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByTalentGridDesc() {
    return addSortByInternal('talentGrid', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByTooltipStyle() {
    return addSortByInternal('tooltipStyle', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByTooltipStyleDesc() {
    return addSortByInternal('tooltipStyle', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByTranslationBlock() {
    return addSortByInternal('translationBlock', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByTranslationBlockDesc() {
    return addSortByInternal('translationBlock', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByUiItemDisplayStyle() {
    return addSortByInternal('uiItemDisplayStyle', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByUiItemDisplayStyleDesc() {
    return addSortByInternal('uiItemDisplayStyle', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByValue() {
    return addSortByInternal('value', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByValueDesc() {
    return addSortByInternal('value', Sort.desc);
  }
}

extension DestinyInventoryItemDefinitionQueryWhereDistinct on QueryBuilder<
    DestinyInventoryItemDefinition, DestinyInventoryItemDefinition, QDistinct> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByAction({bool caseSensitive = true}) {
    return addDistinctByInternal('action', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByAllowActions() {
    return addDistinctByInternal('allowActions');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByBackgroundColor({bool caseSensitive = true}) {
    return addDistinctByInternal('backgroundColor',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByBreakerType() {
    return addDistinctByInternal('breakerType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByBreakerTypeHash() {
    return addDistinctByInternal('breakerTypeHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByClassType() {
    return addDistinctByInternal('classType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByCollectibleHash() {
    return addDistinctByInternal('collectibleHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByCrafting({bool caseSensitive = true}) {
    return addDistinctByInternal('crafting', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByDefaultDamageType() {
    return addDistinctByInternal('defaultDamageType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByDefaultDamageTypeHash() {
    return addDistinctByInternal('defaultDamageTypeHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByDisplayProperties({bool caseSensitive = true}) {
    return addDistinctByInternal('displayProperties',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByDisplaySource({bool caseSensitive = true}) {
    return addDistinctByInternal('displaySource', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByDoesPostmasterPullHaveSideEffects() {
    return addDistinctByInternal('doesPostmasterPullHaveSideEffects');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByEmblemObjectiveHash() {
    return addDistinctByInternal('emblemObjectiveHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByEquippable() {
    return addDistinctByInternal('equippable');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByEquippingBlock({bool caseSensitive = true}) {
    return addDistinctByInternal('equippingBlock',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByFlavorText({bool caseSensitive = true}) {
    return addDistinctByInternal('flavorText', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByGearset({bool caseSensitive = true}) {
    return addDistinctByInternal('gearset', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByIconWatermark({bool caseSensitive = true}) {
    return addDistinctByInternal('iconWatermark', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByIconWatermarkShelved({bool caseSensitive = true}) {
    return addDistinctByInternal('iconWatermarkShelved',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByInventory({bool caseSensitive = true}) {
    return addDistinctByInternal('inventory', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByIsWrapper() {
    return addDistinctByInternal('isWrapper');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByItemSubType() {
    return addDistinctByInternal('itemSubType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByItemType() {
    return addDistinctByInternal('itemType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
          QDistinct>
      distinctByItemTypeAndTierDisplayName({bool caseSensitive = true}) {
    return addDistinctByInternal('itemTypeAndTierDisplayName',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByItemTypeDisplayName({bool caseSensitive = true}) {
    return addDistinctByInternal('itemTypeDisplayName',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByLoreHash() {
    return addDistinctByInternal('loreHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByMetrics({bool caseSensitive = true}) {
    return addDistinctByInternal('metrics', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByNonTransferrable() {
    return addDistinctByInternal('nonTransferrable');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByObjectives({bool caseSensitive = true}) {
    return addDistinctByInternal('objectives', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByPlug({bool caseSensitive = true}) {
    return addDistinctByInternal('plug', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByPreview({bool caseSensitive = true}) {
    return addDistinctByInternal('preview', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByQuality({bool caseSensitive = true}) {
    return addDistinctByInternal('quality', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySack({bool caseSensitive = true}) {
    return addDistinctByInternal('sack', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByScreenshot({bool caseSensitive = true}) {
    return addDistinctByInternal('screenshot', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySeasonHash() {
    return addDistinctByInternal('seasonHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySecondaryIcon({bool caseSensitive = true}) {
    return addDistinctByInternal('secondaryIcon', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySecondaryOverlay({bool caseSensitive = true}) {
    return addDistinctByInternal('secondaryOverlay',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySecondarySpecial({bool caseSensitive = true}) {
    return addDistinctByInternal('secondarySpecial',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySetData({bool caseSensitive = true}) {
    return addDistinctByInternal('setData', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySockets({bool caseSensitive = true}) {
    return addDistinctByInternal('sockets', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySourceData({bool caseSensitive = true}) {
    return addDistinctByInternal('sourceData', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySpecialItemType() {
    return addDistinctByInternal('specialItemType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByStats({bool caseSensitive = true}) {
    return addDistinctByInternal('stats', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySummary({bool caseSensitive = true}) {
    return addDistinctByInternal('summary', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySummaryItemHash() {
    return addDistinctByInternal('summaryItemHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByTalentGrid({bool caseSensitive = true}) {
    return addDistinctByInternal('talentGrid', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByTooltipStyle({bool caseSensitive = true}) {
    return addDistinctByInternal('tooltipStyle', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByTranslationBlock({bool caseSensitive = true}) {
    return addDistinctByInternal('translationBlock',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByUiItemDisplayStyle({bool caseSensitive = true}) {
    return addDistinctByInternal('uiItemDisplayStyle',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByValue({bool caseSensitive = true}) {
    return addDistinctByInternal('value', caseSensitive: caseSensitive);
  }
}

extension DestinyInventoryItemDefinitionQueryProperty on QueryBuilder<
    DestinyInventoryItemDefinition,
    DestinyInventoryItemDefinition,
    QQueryProperty> {
  QueryBuilder<DestinyInventoryItemDefinition,
      DestinyItemActionBlockDefinition?, QQueryOperations> actionProperty() {
    return addPropertyNameInternal('action');
  }

  QueryBuilder<DestinyInventoryItemDefinition, bool?, QQueryOperations>
      allowActionsProperty() {
    return addPropertyNameInternal('allowActions');
  }

  QueryBuilder<DestinyInventoryItemDefinition, List<DestinyAnimationReference>?,
      QQueryOperations> animationsProperty() {
    return addPropertyNameInternal('animations');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyColor?, QQueryOperations>
      backgroundColorProperty() {
    return addPropertyNameInternal('backgroundColor');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyBreakerType?,
      QQueryOperations> breakerTypeProperty() {
    return addPropertyNameInternal('breakerType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, int?, QQueryOperations>
      breakerTypeHashProperty() {
    return addPropertyNameInternal('breakerTypeHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyClass?, QQueryOperations>
      classTypeProperty() {
    return addPropertyNameInternal('classType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, int?, QQueryOperations>
      collectibleHashProperty() {
    return addPropertyNameInternal('collectibleHash');
  }

  QueryBuilder<
      DestinyInventoryItemDefinition,
      DestinyItemCraftingBlockDefinition?,
      QQueryOperations> craftingProperty() {
    return addPropertyNameInternal('crafting');
  }

  QueryBuilder<DestinyInventoryItemDefinition, List<int>?, QQueryOperations>
      damageTypeHashesProperty() {
    return addPropertyNameInternal('damageTypeHashes');
  }

  QueryBuilder<DestinyInventoryItemDefinition, List<DamageType>?,
      QQueryOperations> damageTypesProperty() {
    return addPropertyNameInternal('damageTypes');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DamageType?, QQueryOperations>
      defaultDamageTypeProperty() {
    return addPropertyNameInternal('defaultDamageType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, int?, QQueryOperations>
      defaultDamageTypeHashProperty() {
    return addPropertyNameInternal('defaultDamageTypeHash');
  }

  QueryBuilder<
      DestinyInventoryItemDefinition,
      DestinyDisplayPropertiesDefinition?,
      QQueryOperations> displayPropertiesProperty() {
    return addPropertyNameInternal('displayProperties');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      displaySourceProperty() {
    return addPropertyNameInternal('displaySource');
  }

  QueryBuilder<DestinyInventoryItemDefinition, bool?, QQueryOperations>
      doesPostmasterPullHaveSideEffectsProperty() {
    return addPropertyNameInternal('doesPostmasterPullHaveSideEffects');
  }

  QueryBuilder<DestinyInventoryItemDefinition, int?, QQueryOperations>
      emblemObjectiveHashProperty() {
    return addPropertyNameInternal('emblemObjectiveHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, bool?, QQueryOperations>
      equippableProperty() {
    return addPropertyNameInternal('equippable');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyEquippingBlockDefinition?,
      QQueryOperations> equippingBlockProperty() {
    return addPropertyNameInternal('equippingBlock');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      flavorTextProperty() {
    return addPropertyNameInternal('flavorText');
  }

  QueryBuilder<DestinyInventoryItemDefinition,
      DestinyItemGearsetBlockDefinition?, QQueryOperations> gearsetProperty() {
    return addPropertyNameInternal('gearset');
  }

  QueryBuilder<DestinyInventoryItemDefinition, int?, QQueryOperations>
      hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      iconWatermarkProperty() {
    return addPropertyNameInternal('iconWatermark');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      iconWatermarkShelvedProperty() {
    return addPropertyNameInternal('iconWatermarkShelved');
  }

  QueryBuilder<DestinyInventoryItemDefinition, int?, QQueryOperations>
      indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<
      DestinyInventoryItemDefinition,
      DestinyItemInventoryBlockDefinition?,
      QQueryOperations> inventoryProperty() {
    return addPropertyNameInternal('inventory');
  }

  QueryBuilder<
      DestinyInventoryItemDefinition,
      List<DestinyItemInvestmentStatDefinition>?,
      QQueryOperations> investmentStatsProperty() {
    return addPropertyNameInternal('investmentStats');
  }

  QueryBuilder<DestinyInventoryItemDefinition, bool?, QQueryOperations>
      isWrapperProperty() {
    return addPropertyNameInternal('isWrapper');
  }

  QueryBuilder<DestinyInventoryItemDefinition, List<int>?, QQueryOperations>
      itemCategoryHashesProperty() {
    return addPropertyNameInternal('itemCategoryHashes');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyItemSubType?,
      QQueryOperations> itemSubTypeProperty() {
    return addPropertyNameInternal('itemSubType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyItemType?,
      QQueryOperations> itemTypeProperty() {
    return addPropertyNameInternal('itemType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      itemTypeAndTierDisplayNameProperty() {
    return addPropertyNameInternal('itemTypeAndTierDisplayName');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      itemTypeDisplayNameProperty() {
    return addPropertyNameInternal('itemTypeDisplayName');
  }

  QueryBuilder<DestinyInventoryItemDefinition, List<HyperlinkReference>?,
      QQueryOperations> linksProperty() {
    return addPropertyNameInternal('links');
  }

  QueryBuilder<DestinyInventoryItemDefinition, int?, QQueryOperations>
      loreHashProperty() {
    return addPropertyNameInternal('loreHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition,
      DestinyItemMetricBlockDefinition?, QQueryOperations> metricsProperty() {
    return addPropertyNameInternal('metrics');
  }

  QueryBuilder<DestinyInventoryItemDefinition, bool?, QQueryOperations>
      nonTransferrableProperty() {
    return addPropertyNameInternal('nonTransferrable');
  }

  QueryBuilder<
      DestinyInventoryItemDefinition,
      DestinyItemObjectiveBlockDefinition?,
      QQueryOperations> objectivesProperty() {
    return addPropertyNameInternal('objectives');
  }

  QueryBuilder<DestinyInventoryItemDefinition,
      List<DestinyItemPerkEntryDefinition>?, QQueryOperations> perksProperty() {
    return addPropertyNameInternal('perks');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyItemPlugDefinition?,
      QQueryOperations> plugProperty() {
    return addPropertyNameInternal('plug');
  }

  QueryBuilder<DestinyInventoryItemDefinition,
      DestinyItemPreviewBlockDefinition?, QQueryOperations> previewProperty() {
    return addPropertyNameInternal('preview');
  }

  QueryBuilder<DestinyInventoryItemDefinition,
      DestinyItemQualityBlockDefinition?, QQueryOperations> qualityProperty() {
    return addPropertyNameInternal('quality');
  }

  QueryBuilder<DestinyInventoryItemDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyItemSackBlockDefinition?,
      QQueryOperations> sackProperty() {
    return addPropertyNameInternal('sack');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      screenshotProperty() {
    return addPropertyNameInternal('screenshot');
  }

  QueryBuilder<DestinyInventoryItemDefinition, int?, QQueryOperations>
      seasonHashProperty() {
    return addPropertyNameInternal('seasonHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      secondaryIconProperty() {
    return addPropertyNameInternal('secondaryIcon');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      secondaryOverlayProperty() {
    return addPropertyNameInternal('secondaryOverlay');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      secondarySpecialProperty() {
    return addPropertyNameInternal('secondarySpecial');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyItemSetBlockDefinition?,
      QQueryOperations> setDataProperty() {
    return addPropertyNameInternal('setData');
  }

  QueryBuilder<DestinyInventoryItemDefinition,
      DestinyItemSocketBlockDefinition?, QQueryOperations> socketsProperty() {
    return addPropertyNameInternal('sockets');
  }

  QueryBuilder<
      DestinyInventoryItemDefinition,
      DestinyItemSourceBlockDefinition?,
      QQueryOperations> sourceDataProperty() {
    return addPropertyNameInternal('sourceData');
  }

  QueryBuilder<DestinyInventoryItemDefinition, SpecialItemType?,
      QQueryOperations> specialItemTypeProperty() {
    return addPropertyNameInternal('specialItemType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyItemStatBlockDefinition?,
      QQueryOperations> statsProperty() {
    return addPropertyNameInternal('stats');
  }

  QueryBuilder<DestinyInventoryItemDefinition,
      DestinyItemSummaryBlockDefinition?, QQueryOperations> summaryProperty() {
    return addPropertyNameInternal('summary');
  }

  QueryBuilder<DestinyInventoryItemDefinition, int?, QQueryOperations>
      summaryItemHashProperty() {
    return addPropertyNameInternal('summaryItemHash');
  }

  QueryBuilder<
      DestinyInventoryItemDefinition,
      DestinyItemTalentGridBlockDefinition?,
      QQueryOperations> talentGridProperty() {
    return addPropertyNameInternal('talentGrid');
  }

  QueryBuilder<
      DestinyInventoryItemDefinition,
      List<DestinyItemTooltipNotification>?,
      QQueryOperations> tooltipNotificationsProperty() {
    return addPropertyNameInternal('tooltipNotifications');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      tooltipStyleProperty() {
    return addPropertyNameInternal('tooltipStyle');
  }

  QueryBuilder<DestinyInventoryItemDefinition, List<int>?, QQueryOperations>
      traitHashesProperty() {
    return addPropertyNameInternal('traitHashes');
  }

  QueryBuilder<DestinyInventoryItemDefinition, List<String>?, QQueryOperations>
      traitIdsProperty() {
    return addPropertyNameInternal('traitIds');
  }

  QueryBuilder<
      DestinyInventoryItemDefinition,
      DestinyItemTranslationBlockDefinition?,
      QQueryOperations> translationBlockProperty() {
    return addPropertyNameInternal('translationBlock');
  }

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      uiItemDisplayStyleProperty() {
    return addPropertyNameInternal('uiItemDisplayStyle');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyItemValueBlockDefinition?,
      QQueryOperations> valueProperty() {
    return addPropertyNameInternal('value');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyInventoryItemDefinition _$DestinyInventoryItemDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyInventoryItemDefinition()
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..tooltipNotifications = (json['tooltipNotifications'] as List<dynamic>?)
          ?.map((e) => DestinyItemTooltipNotification.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..collectibleHash = json['collectibleHash'] as int?
      ..iconWatermark = json['iconWatermark'] as String?
      ..iconWatermarkShelved = json['iconWatermarkShelved'] as String?
      ..secondaryIcon = json['secondaryIcon'] as String?
      ..secondaryOverlay = json['secondaryOverlay'] as String?
      ..secondarySpecial = json['secondarySpecial'] as String?
      ..backgroundColor = json['backgroundColor'] == null
          ? null
          : DestinyColor.fromJson(
              json['backgroundColor'] as Map<String, dynamic>)
      ..screenshot = json['screenshot'] as String?
      ..itemTypeDisplayName = json['itemTypeDisplayName'] as String?
      ..flavorText = json['flavorText'] as String?
      ..uiItemDisplayStyle = json['uiItemDisplayStyle'] as String?
      ..itemTypeAndTierDisplayName =
          json['itemTypeAndTierDisplayName'] as String?
      ..displaySource = json['displaySource'] as String?
      ..tooltipStyle = json['tooltipStyle'] as String?
      ..action = json['action'] == null
          ? null
          : DestinyItemActionBlockDefinition.fromJson(
              json['action'] as Map<String, dynamic>)
      ..crafting = json['crafting'] == null
          ? null
          : DestinyItemCraftingBlockDefinition.fromJson(
              json['crafting'] as Map<String, dynamic>)
      ..inventory = json['inventory'] == null
          ? null
          : DestinyItemInventoryBlockDefinition.fromJson(
              json['inventory'] as Map<String, dynamic>)
      ..setData = json['setData'] == null
          ? null
          : DestinyItemSetBlockDefinition.fromJson(
              json['setData'] as Map<String, dynamic>)
      ..stats = json['stats'] == null
          ? null
          : DestinyItemStatBlockDefinition.fromJson(
              json['stats'] as Map<String, dynamic>)
      ..emblemObjectiveHash = json['emblemObjectiveHash'] as int?
      ..equippingBlock = json['equippingBlock'] == null
          ? null
          : DestinyEquippingBlockDefinition.fromJson(
              json['equippingBlock'] as Map<String, dynamic>)
      ..translationBlock = json['translationBlock'] == null
          ? null
          : DestinyItemTranslationBlockDefinition.fromJson(
              json['translationBlock'] as Map<String, dynamic>)
      ..preview = json['preview'] == null
          ? null
          : DestinyItemPreviewBlockDefinition.fromJson(
              json['preview'] as Map<String, dynamic>)
      ..quality = json['quality'] == null
          ? null
          : DestinyItemQualityBlockDefinition.fromJson(
              json['quality'] as Map<String, dynamic>)
      ..value = json['value'] == null
          ? null
          : DestinyItemValueBlockDefinition.fromJson(
              json['value'] as Map<String, dynamic>)
      ..sourceData = json['sourceData'] == null
          ? null
          : DestinyItemSourceBlockDefinition.fromJson(
              json['sourceData'] as Map<String, dynamic>)
      ..objectives = json['objectives'] == null
          ? null
          : DestinyItemObjectiveBlockDefinition.fromJson(
              json['objectives'] as Map<String, dynamic>)
      ..metrics = json['metrics'] == null
          ? null
          : DestinyItemMetricBlockDefinition.fromJson(
              json['metrics'] as Map<String, dynamic>)
      ..plug = json['plug'] == null
          ? null
          : DestinyItemPlugDefinition.fromJson(
              json['plug'] as Map<String, dynamic>)
      ..gearset = json['gearset'] == null
          ? null
          : DestinyItemGearsetBlockDefinition.fromJson(
              json['gearset'] as Map<String, dynamic>)
      ..sack = json['sack'] == null
          ? null
          : DestinyItemSackBlockDefinition.fromJson(
              json['sack'] as Map<String, dynamic>)
      ..sockets = json['sockets'] == null
          ? null
          : DestinyItemSocketBlockDefinition.fromJson(
              json['sockets'] as Map<String, dynamic>)
      ..summary = json['summary'] == null
          ? null
          : DestinyItemSummaryBlockDefinition.fromJson(
              json['summary'] as Map<String, dynamic>)
      ..talentGrid = json['talentGrid'] == null
          ? null
          : DestinyItemTalentGridBlockDefinition.fromJson(
              json['talentGrid'] as Map<String, dynamic>)
      ..investmentStats = (json['investmentStats'] as List<dynamic>?)
          ?.map((e) => DestinyItemInvestmentStatDefinition.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..perks = (json['perks'] as List<dynamic>?)
          ?.map((e) => DestinyItemPerkEntryDefinition.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..loreHash = json['loreHash'] as int?
      ..summaryItemHash = json['summaryItemHash'] as int?
      ..animations = (json['animations'] as List<dynamic>?)
          ?.map((e) =>
              DestinyAnimationReference.fromJson(e as Map<String, dynamic>))
          .toList()
      ..allowActions = json['allowActions'] as bool?
      ..links = (json['links'] as List<dynamic>?)
          ?.map((e) => HyperlinkReference.fromJson(e as Map<String, dynamic>))
          .toList()
      ..doesPostmasterPullHaveSideEffects =
          json['doesPostmasterPullHaveSideEffects'] as bool?
      ..nonTransferrable = json['nonTransferrable'] as bool?
      ..itemCategoryHashes = (json['itemCategoryHashes'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList()
      ..specialItemType = decodeSpecialItemType(json['specialItemType'])
      ..itemType = decodeDestinyItemType(json['itemType'])
      ..itemSubType = decodeDestinyItemSubType(json['itemSubType'])
      ..classType = decodeDestinyClass(json['classType'])
      ..breakerType = decodeDestinyBreakerType(json['breakerType'])
      ..breakerTypeHash = json['breakerTypeHash'] as int?
      ..equippable = json['equippable'] as bool?
      ..damageTypeHashes = (json['damageTypeHashes'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList()
      ..damageTypes = (json['damageTypes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$DamageTypeEnumMap, e))
          .toList()
      ..defaultDamageType = decodeDamageType(json['defaultDamageType'])
      ..defaultDamageTypeHash = json['defaultDamageTypeHash'] as int?
      ..seasonHash = json['seasonHash'] as int?
      ..isWrapper = json['isWrapper'] as bool?
      ..traitIds =
          (json['traitIds'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..traitHashes =
          (json['traitHashes'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..hash = json['hash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinyInventoryItemDefinitionToJson(
        DestinyInventoryItemDefinition instance) =>
    <String, dynamic>{
      'displayProperties': instance.displayProperties,
      'tooltipNotifications': instance.tooltipNotifications,
      'collectibleHash': instance.collectibleHash,
      'iconWatermark': instance.iconWatermark,
      'iconWatermarkShelved': instance.iconWatermarkShelved,
      'secondaryIcon': instance.secondaryIcon,
      'secondaryOverlay': instance.secondaryOverlay,
      'secondarySpecial': instance.secondarySpecial,
      'backgroundColor': instance.backgroundColor,
      'screenshot': instance.screenshot,
      'itemTypeDisplayName': instance.itemTypeDisplayName,
      'flavorText': instance.flavorText,
      'uiItemDisplayStyle': instance.uiItemDisplayStyle,
      'itemTypeAndTierDisplayName': instance.itemTypeAndTierDisplayName,
      'displaySource': instance.displaySource,
      'tooltipStyle': instance.tooltipStyle,
      'action': instance.action,
      'crafting': instance.crafting,
      'inventory': instance.inventory,
      'setData': instance.setData,
      'stats': instance.stats,
      'emblemObjectiveHash': instance.emblemObjectiveHash,
      'equippingBlock': instance.equippingBlock,
      'translationBlock': instance.translationBlock,
      'preview': instance.preview,
      'quality': instance.quality,
      'value': instance.value,
      'sourceData': instance.sourceData,
      'objectives': instance.objectives,
      'metrics': instance.metrics,
      'plug': instance.plug,
      'gearset': instance.gearset,
      'sack': instance.sack,
      'sockets': instance.sockets,
      'summary': instance.summary,
      'talentGrid': instance.talentGrid,
      'investmentStats': instance.investmentStats,
      'perks': instance.perks,
      'loreHash': instance.loreHash,
      'summaryItemHash': instance.summaryItemHash,
      'animations': instance.animations,
      'allowActions': instance.allowActions,
      'links': instance.links,
      'doesPostmasterPullHaveSideEffects':
          instance.doesPostmasterPullHaveSideEffects,
      'nonTransferrable': instance.nonTransferrable,
      'itemCategoryHashes': instance.itemCategoryHashes,
      'specialItemType': encodeSpecialItemType(instance.specialItemType),
      'itemType': encodeDestinyItemType(instance.itemType),
      'itemSubType': encodeDestinyItemSubType(instance.itemSubType),
      'classType': encodeDestinyClass(instance.classType),
      'breakerType': encodeDestinyBreakerType(instance.breakerType),
      'breakerTypeHash': instance.breakerTypeHash,
      'equippable': instance.equippable,
      'damageTypeHashes': instance.damageTypeHashes,
      'damageTypes':
          instance.damageTypes?.map((e) => _$DamageTypeEnumMap[e]).toList(),
      'defaultDamageType': encodeDamageType(instance.defaultDamageType),
      'defaultDamageTypeHash': instance.defaultDamageTypeHash,
      'seasonHash': instance.seasonHash,
      'isWrapper': instance.isWrapper,
      'traitIds': instance.traitIds,
      'traitHashes': instance.traitHashes,
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };

const _$DamageTypeEnumMap = {
  DamageType.None: 0,
  DamageType.Kinetic: 1,
  DamageType.Arc: 2,
  DamageType.Thermal: 3,
  DamageType.Void: 4,
  DamageType.Raid: 5,
  DamageType.Stasis: 6,
  DamageType.ProtectedInvalidEnumValue: 999999999,
};
