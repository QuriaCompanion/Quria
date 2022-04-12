// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_inventory_item_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetDestinyInventoryItemDefinitionCollection on Isar {
  IsarCollection<DestinyInventoryItemDefinition>
      get destinyInventoryItemDefinitions {
    return getCollection('DestinyInventoryItemDefinition');
  }
}

final DestinyInventoryItemDefinitionSchema = CollectionSchema(
  name: 'DestinyInventoryItemDefinition',
  schema:
      '{"name":"DestinyInventoryItemDefinition","idName":"hash","properties":[{"name":"allowActions","type":"Bool"},{"name":"animations","type":"StringList"},{"name":"breakerType","type":"Long"},{"name":"breakerTypeHash","type":"Long"},{"name":"classType","type":"Long"},{"name":"collectibleHash","type":"Long"},{"name":"damageTypeHashes","type":"LongList"},{"name":"damageTypes","type":"LongList"},{"name":"defaultDamageType","type":"Long"},{"name":"defaultDamageTypeHash","type":"Long"},{"name":"displaySource","type":"String"},{"name":"doesPostmasterPullHaveSideEffects","type":"Bool"},{"name":"emblemObjectiveHash","type":"Long"},{"name":"equippable","type":"Bool"},{"name":"flavorText","type":"String"},{"name":"iconWatermark","type":"String"},{"name":"iconWatermarkShelved","type":"String"},{"name":"index","type":"Long"},{"name":"investmentStats","type":"StringList"},{"name":"isWrapper","type":"Bool"},{"name":"itemCategoryHashes","type":"LongList"},{"name":"itemSubType","type":"Long"},{"name":"itemType","type":"Long"},{"name":"itemTypeAndTierDisplayName","type":"String"},{"name":"itemTypeDisplayName","type":"String"},{"name":"links","type":"StringList"},{"name":"loreHash","type":"Long"},{"name":"nonTransferrable","type":"Bool"},{"name":"perks","type":"StringList"},{"name":"redacted","type":"Bool"},{"name":"screenshot","type":"String"},{"name":"seasonHash","type":"Long"},{"name":"secondaryIcon","type":"String"},{"name":"secondaryOverlay","type":"String"},{"name":"secondarySpecial","type":"String"},{"name":"specialItemType","type":"Long"},{"name":"summaryItemHash","type":"Long"},{"name":"tooltipNotifications","type":"StringList"},{"name":"tooltipStyle","type":"String"},{"name":"traitHashes","type":"LongList"},{"name":"traitIds","type":"StringList"},{"name":"uiItemDisplayStyle","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _DestinyInventoryItemDefinitionNativeAdapter(),
  webAdapter: const _DestinyInventoryItemDefinitionWebAdapter(),
  idName: 'hash',
  propertyIds: {
    'allowActions': 0,
    'animations': 1,
    'breakerType': 2,
    'breakerTypeHash': 3,
    'classType': 4,
    'collectibleHash': 5,
    'damageTypeHashes': 6,
    'damageTypes': 7,
    'defaultDamageType': 8,
    'defaultDamageTypeHash': 9,
    'displaySource': 10,
    'doesPostmasterPullHaveSideEffects': 11,
    'emblemObjectiveHash': 12,
    'equippable': 13,
    'flavorText': 14,
    'iconWatermark': 15,
    'iconWatermarkShelved': 16,
    'index': 17,
    'investmentStats': 18,
    'isWrapper': 19,
    'itemCategoryHashes': 20,
    'itemSubType': 21,
    'itemType': 22,
    'itemTypeAndTierDisplayName': 23,
    'itemTypeDisplayName': 24,
    'links': 25,
    'loreHash': 26,
    'nonTransferrable': 27,
    'perks': 28,
    'redacted': 29,
    'screenshot': 30,
    'seasonHash': 31,
    'secondaryIcon': 32,
    'secondaryOverlay': 33,
    'secondarySpecial': 34,
    'specialItemType': 35,
    'summaryItemHash': 36,
    'tooltipNotifications': 37,
    'tooltipStyle': 38,
    'traitHashes': 39,
    'traitIds': 40,
    'uiItemDisplayStyle': 41
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
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.hash == Isar.autoIncrement) {
      return null;
    } else {
      return obj.hash;
    }
  },
  setId: (obj, id) => obj.hash = id,
  getLinks: (obj) => [],
  version: 2,
);

const _destinyInventoryItemDefinitionClassListNullableConverter =
    ClassListNullableConverter();
const _destinyInventoryItemDefinitionDestinyBreakerTypeConverter =
    DestinyBreakerTypeConverter();
const _destinyInventoryItemDefinitionDestinyClassConverter =
    DestinyClassConverter();
const _destinyInventoryItemDefinitionDamageTypesConverter =
    DamageTypesConverter();
const _destinyInventoryItemDefinitionDamageTypeConverter =
    DamageTypeConverter();
const _destinyInventoryItemDefinitionDestinyItemSubTypeConverter =
    DestinyItemSubTypeConverter();
const _destinyInventoryItemDefinitionDestinyItemTypeConverter =
    DestinyItemTypeConverter();
const _destinyInventoryItemDefinitionSpecialItemTypeConverter =
    SpecialItemTypeConverter();

class _DestinyInventoryItemDefinitionWebAdapter
    extends IsarWebTypeAdapter<DestinyInventoryItemDefinition> {
  const _DestinyInventoryItemDefinitionWebAdapter();

  @override
  Object serialize(IsarCollection<DestinyInventoryItemDefinition> collection,
      DestinyInventoryItemDefinition object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'allowActions', object.allowActions);
    IsarNative.jsObjectSet(
        jsObj,
        'animations',
        _destinyInventoryItemDefinitionClassListNullableConverter
            .toIsar(object.animations));
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
    IsarNative.jsObjectSet(jsObj, 'damageTypeHashes', object.damageTypeHashes);
    IsarNative.jsObjectSet(
        jsObj,
        'damageTypes',
        _destinyInventoryItemDefinitionDamageTypesConverter
            .toIsar(object.damageTypes));
    IsarNative.jsObjectSet(
        jsObj,
        'defaultDamageType',
        _destinyInventoryItemDefinitionDamageTypeConverter
            .toIsar(object.defaultDamageType));
    IsarNative.jsObjectSet(
        jsObj, 'defaultDamageTypeHash', object.defaultDamageTypeHash);
    IsarNative.jsObjectSet(jsObj, 'displaySource', object.displaySource);
    IsarNative.jsObjectSet(jsObj, 'doesPostmasterPullHaveSideEffects',
        object.doesPostmasterPullHaveSideEffects);
    IsarNative.jsObjectSet(
        jsObj, 'emblemObjectiveHash', object.emblemObjectiveHash);
    IsarNative.jsObjectSet(jsObj, 'equippable', object.equippable);
    IsarNative.jsObjectSet(jsObj, 'flavorText', object.flavorText);
    IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
    IsarNative.jsObjectSet(jsObj, 'iconWatermark', object.iconWatermark);
    IsarNative.jsObjectSet(
        jsObj, 'iconWatermarkShelved', object.iconWatermarkShelved);
    IsarNative.jsObjectSet(jsObj, 'index', object.index);
    IsarNative.jsObjectSet(
        jsObj,
        'investmentStats',
        _destinyInventoryItemDefinitionClassListNullableConverter
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
        _destinyInventoryItemDefinitionClassListNullableConverter
            .toIsar(object.links));
    IsarNative.jsObjectSet(jsObj, 'loreHash', object.loreHash);
    IsarNative.jsObjectSet(jsObj, 'nonTransferrable', object.nonTransferrable);
    IsarNative.jsObjectSet(
        jsObj,
        'perks',
        _destinyInventoryItemDefinitionClassListNullableConverter
            .toIsar(object.perks));
    IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
    IsarNative.jsObjectSet(jsObj, 'screenshot', object.screenshot);
    IsarNative.jsObjectSet(jsObj, 'seasonHash', object.seasonHash);
    IsarNative.jsObjectSet(jsObj, 'secondaryIcon', object.secondaryIcon);
    IsarNative.jsObjectSet(jsObj, 'secondaryOverlay', object.secondaryOverlay);
    IsarNative.jsObjectSet(jsObj, 'secondarySpecial', object.secondarySpecial);
    IsarNative.jsObjectSet(
        jsObj,
        'specialItemType',
        _destinyInventoryItemDefinitionSpecialItemTypeConverter
            .toIsar(object.specialItemType));
    IsarNative.jsObjectSet(jsObj, 'summaryItemHash', object.summaryItemHash);
    IsarNative.jsObjectSet(
        jsObj,
        'tooltipNotifications',
        _destinyInventoryItemDefinitionClassListNullableConverter
            .toIsar(object.tooltipNotifications));
    IsarNative.jsObjectSet(jsObj, 'tooltipStyle', object.tooltipStyle);
    IsarNative.jsObjectSet(jsObj, 'traitHashes', object.traitHashes);
    IsarNative.jsObjectSet(jsObj, 'traitIds', object.traitIds);
    IsarNative.jsObjectSet(
        jsObj, 'uiItemDisplayStyle', object.uiItemDisplayStyle);
    return jsObj;
  }

  @override
  DestinyInventoryItemDefinition deserialize(
      IsarCollection<DestinyInventoryItemDefinition> collection,
      dynamic jsObj) {
    final object = DestinyInventoryItemDefinition();
    object.allowActions = IsarNative.jsObjectGet(jsObj, 'allowActions');
    object.animations =
        _destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar((IsarNative.jsObjectGet(jsObj, 'animations') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>())
            ?.cast<DestinyAnimationReference>();
    object.breakerType =
        _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'breakerType'));
    object.breakerTypeHash = IsarNative.jsObjectGet(jsObj, 'breakerTypeHash');
    object.classType = _destinyInventoryItemDefinitionDestinyClassConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'classType'));
    object.collectibleHash = IsarNative.jsObjectGet(jsObj, 'collectibleHash');
    object.damageTypeHashes =
        (IsarNative.jsObjectGet(jsObj, 'damageTypeHashes') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>();
    object.damageTypes = _destinyInventoryItemDefinitionDamageTypesConverter
        .fromIsar((IsarNative.jsObjectGet(jsObj, 'damageTypes') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>());
    object.defaultDamageType =
        _destinyInventoryItemDefinitionDamageTypeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'defaultDamageType'));
    object.defaultDamageTypeHash =
        IsarNative.jsObjectGet(jsObj, 'defaultDamageTypeHash');
    object.displaySource = IsarNative.jsObjectGet(jsObj, 'displaySource');
    object.doesPostmasterPullHaveSideEffects =
        IsarNative.jsObjectGet(jsObj, 'doesPostmasterPullHaveSideEffects');
    object.emblemObjectiveHash =
        IsarNative.jsObjectGet(jsObj, 'emblemObjectiveHash');
    object.equippable = IsarNative.jsObjectGet(jsObj, 'equippable');
    object.flavorText = IsarNative.jsObjectGet(jsObj, 'flavorText');
    object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
    object.iconWatermark = IsarNative.jsObjectGet(jsObj, 'iconWatermark');
    object.iconWatermarkShelved =
        IsarNative.jsObjectGet(jsObj, 'iconWatermarkShelved');
    object.index = IsarNative.jsObjectGet(jsObj, 'index');
    object.investmentStats =
        _destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(
                (IsarNative.jsObjectGet(jsObj, 'investmentStats') as List?)
                    ?.map((e) => e ?? '')
                    .toList()
                    .cast<String>())
            ?.cast<DestinyItemInvestmentStatDefinition>();
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
    object.links = _destinyInventoryItemDefinitionClassListNullableConverter
        .fromIsar((IsarNative.jsObjectGet(jsObj, 'links') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>())
        ?.cast<HyperlinkReference>();
    object.loreHash = IsarNative.jsObjectGet(jsObj, 'loreHash');
    object.nonTransferrable = IsarNative.jsObjectGet(jsObj, 'nonTransferrable');
    object.perks = _destinyInventoryItemDefinitionClassListNullableConverter
        .fromIsar((IsarNative.jsObjectGet(jsObj, 'perks') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>())
        ?.cast<DestinyItemPerkEntryDefinition>();
    object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
    object.screenshot = IsarNative.jsObjectGet(jsObj, 'screenshot');
    object.seasonHash = IsarNative.jsObjectGet(jsObj, 'seasonHash');
    object.secondaryIcon = IsarNative.jsObjectGet(jsObj, 'secondaryIcon');
    object.secondaryOverlay = IsarNative.jsObjectGet(jsObj, 'secondaryOverlay');
    object.secondarySpecial = IsarNative.jsObjectGet(jsObj, 'secondarySpecial');
    object.specialItemType =
        _destinyInventoryItemDefinitionSpecialItemTypeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'specialItemType'));
    object.summaryItemHash = IsarNative.jsObjectGet(jsObj, 'summaryItemHash');
    object.tooltipNotifications =
        _destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(
                (IsarNative.jsObjectGet(jsObj, 'tooltipNotifications') as List?)
                    ?.map((e) => e ?? '')
                    .toList()
                    .cast<String>())
            ?.cast<DestinyItemTooltipNotification>();
    object.tooltipStyle = IsarNative.jsObjectGet(jsObj, 'tooltipStyle');
    object.traitHashes = (IsarNative.jsObjectGet(jsObj, 'traitHashes') as List?)
        ?.map((e) => e ?? double.negativeInfinity)
        .toList()
        .cast<int>();
    object.traitIds = (IsarNative.jsObjectGet(jsObj, 'traitIds') as List?)
        ?.map((e) => e ?? '')
        .toList()
        .cast<String>();
    object.uiItemDisplayStyle =
        IsarNative.jsObjectGet(jsObj, 'uiItemDisplayStyle');
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'allowActions':
        return (IsarNative.jsObjectGet(jsObj, 'allowActions')) as P;
      case 'animations':
        return (_destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar((IsarNative.jsObjectGet(jsObj, 'animations') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>())) as P;
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
      case 'damageTypeHashes':
        return ((IsarNative.jsObjectGet(jsObj, 'damageTypeHashes') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>()) as P;
      case 'damageTypes':
        return (_destinyInventoryItemDefinitionDamageTypesConverter.fromIsar(
            (IsarNative.jsObjectGet(jsObj, 'damageTypes') as List?)
                ?.map((e) => e ?? double.negativeInfinity)
                .toList()
                .cast<int>())) as P;
      case 'defaultDamageType':
        return (_destinyInventoryItemDefinitionDamageTypeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'defaultDamageType'))) as P;
      case 'defaultDamageTypeHash':
        return (IsarNative.jsObjectGet(jsObj, 'defaultDamageTypeHash')) as P;
      case 'displaySource':
        return (IsarNative.jsObjectGet(jsObj, 'displaySource')) as P;
      case 'doesPostmasterPullHaveSideEffects':
        return (IsarNative.jsObjectGet(
            jsObj, 'doesPostmasterPullHaveSideEffects')) as P;
      case 'emblemObjectiveHash':
        return (IsarNative.jsObjectGet(jsObj, 'emblemObjectiveHash')) as P;
      case 'equippable':
        return (IsarNative.jsObjectGet(jsObj, 'equippable')) as P;
      case 'flavorText':
        return (IsarNative.jsObjectGet(jsObj, 'flavorText')) as P;
      case 'hash':
        return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
      case 'iconWatermark':
        return (IsarNative.jsObjectGet(jsObj, 'iconWatermark')) as P;
      case 'iconWatermarkShelved':
        return (IsarNative.jsObjectGet(jsObj, 'iconWatermarkShelved')) as P;
      case 'index':
        return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
      case 'investmentStats':
        return (_destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(
                (IsarNative.jsObjectGet(jsObj, 'investmentStats') as List?)
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
        return (IsarNative.jsObjectGet(jsObj, 'itemTypeAndTierDisplayName'))
            as P;
      case 'itemTypeDisplayName':
        return (IsarNative.jsObjectGet(jsObj, 'itemTypeDisplayName')) as P;
      case 'links':
        return (_destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar((IsarNative.jsObjectGet(jsObj, 'links') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>())) as P;
      case 'loreHash':
        return (IsarNative.jsObjectGet(jsObj, 'loreHash')) as P;
      case 'nonTransferrable':
        return (IsarNative.jsObjectGet(jsObj, 'nonTransferrable')) as P;
      case 'perks':
        return (_destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar((IsarNative.jsObjectGet(jsObj, 'perks') as List?)
                ?.map((e) => e ?? '')
                .toList()
                .cast<String>())) as P;
      case 'redacted':
        return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
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
      case 'specialItemType':
        return (_destinyInventoryItemDefinitionSpecialItemTypeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'specialItemType'))) as P;
      case 'summaryItemHash':
        return (IsarNative.jsObjectGet(jsObj, 'summaryItemHash')) as P;
      case 'tooltipNotifications':
        return (_destinyInventoryItemDefinitionClassListNullableConverter
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
      case 'uiItemDisplayStyle':
        return (IsarNative.jsObjectGet(jsObj, 'uiItemDisplayStyle')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinyInventoryItemDefinition object) {}
}

class _DestinyInventoryItemDefinitionNativeAdapter
    extends IsarNativeTypeAdapter<DestinyInventoryItemDefinition> {
  const _DestinyInventoryItemDefinitionNativeAdapter();

  @override
  void serialize(
      IsarCollection<DestinyInventoryItemDefinition> collection,
      IsarRawObject rawObj,
      DestinyInventoryItemDefinition object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.allowActions;
    final _allowActions = value0;
    final value1 = _destinyInventoryItemDefinitionClassListNullableConverter
        .toIsar(object.animations);
    dynamicSize += (value1?.length ?? 0) * 8;
    List<IsarUint8List?>? bytesList1;
    if (value1 != null) {
      bytesList1 = [];
      for (var str in value1) {
        final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
        bytesList1.add(bytes);
        dynamicSize += bytes.length as int;
      }
    }
    final _animations = bytesList1;
    final value2 = _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
        .toIsar(object.breakerType);
    final _breakerType = value2;
    final value3 = object.breakerTypeHash;
    final _breakerTypeHash = value3;
    final value4 = _destinyInventoryItemDefinitionDestinyClassConverter
        .toIsar(object.classType);
    final _classType = value4;
    final value5 = object.collectibleHash;
    final _collectibleHash = value5;
    final value6 = object.damageTypeHashes;
    dynamicSize += (value6?.length ?? 0) * 8;
    final _damageTypeHashes = value6;
    final value7 = _destinyInventoryItemDefinitionDamageTypesConverter
        .toIsar(object.damageTypes);
    dynamicSize += (value7?.length ?? 0) * 8;
    final _damageTypes = value7;
    final value8 = _destinyInventoryItemDefinitionDamageTypeConverter
        .toIsar(object.defaultDamageType);
    final _defaultDamageType = value8;
    final value9 = object.defaultDamageTypeHash;
    final _defaultDamageTypeHash = value9;
    final value10 = object.displaySource;
    IsarUint8List? _displaySource;
    if (value10 != null) {
      _displaySource = IsarBinaryWriter.utf8Encoder.convert(value10);
    }
    dynamicSize += (_displaySource?.length ?? 0) as int;
    final value11 = object.doesPostmasterPullHaveSideEffects;
    final _doesPostmasterPullHaveSideEffects = value11;
    final value12 = object.emblemObjectiveHash;
    final _emblemObjectiveHash = value12;
    final value13 = object.equippable;
    final _equippable = value13;
    final value14 = object.flavorText;
    IsarUint8List? _flavorText;
    if (value14 != null) {
      _flavorText = IsarBinaryWriter.utf8Encoder.convert(value14);
    }
    dynamicSize += (_flavorText?.length ?? 0) as int;
    final value15 = object.iconWatermark;
    IsarUint8List? _iconWatermark;
    if (value15 != null) {
      _iconWatermark = IsarBinaryWriter.utf8Encoder.convert(value15);
    }
    dynamicSize += (_iconWatermark?.length ?? 0) as int;
    final value16 = object.iconWatermarkShelved;
    IsarUint8List? _iconWatermarkShelved;
    if (value16 != null) {
      _iconWatermarkShelved = IsarBinaryWriter.utf8Encoder.convert(value16);
    }
    dynamicSize += (_iconWatermarkShelved?.length ?? 0) as int;
    final value17 = object.index;
    final _index = value17;
    final value18 = _destinyInventoryItemDefinitionClassListNullableConverter
        .toIsar(object.investmentStats);
    dynamicSize += (value18?.length ?? 0) * 8;
    List<IsarUint8List?>? bytesList18;
    if (value18 != null) {
      bytesList18 = [];
      for (var str in value18) {
        final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
        bytesList18.add(bytes);
        dynamicSize += bytes.length as int;
      }
    }
    final _investmentStats = bytesList18;
    final value19 = object.isWrapper;
    final _isWrapper = value19;
    final value20 = object.itemCategoryHashes;
    dynamicSize += (value20?.length ?? 0) * 8;
    final _itemCategoryHashes = value20;
    final value21 = _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
        .toIsar(object.itemSubType);
    final _itemSubType = value21;
    final value22 = _destinyInventoryItemDefinitionDestinyItemTypeConverter
        .toIsar(object.itemType);
    final _itemType = value22;
    final value23 = object.itemTypeAndTierDisplayName;
    IsarUint8List? _itemTypeAndTierDisplayName;
    if (value23 != null) {
      _itemTypeAndTierDisplayName =
          IsarBinaryWriter.utf8Encoder.convert(value23);
    }
    dynamicSize += (_itemTypeAndTierDisplayName?.length ?? 0) as int;
    final value24 = object.itemTypeDisplayName;
    IsarUint8List? _itemTypeDisplayName;
    if (value24 != null) {
      _itemTypeDisplayName = IsarBinaryWriter.utf8Encoder.convert(value24);
    }
    dynamicSize += (_itemTypeDisplayName?.length ?? 0) as int;
    final value25 = _destinyInventoryItemDefinitionClassListNullableConverter
        .toIsar(object.links);
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
    final _links = bytesList25;
    final value26 = object.loreHash;
    final _loreHash = value26;
    final value27 = object.nonTransferrable;
    final _nonTransferrable = value27;
    final value28 = _destinyInventoryItemDefinitionClassListNullableConverter
        .toIsar(object.perks);
    dynamicSize += (value28?.length ?? 0) * 8;
    List<IsarUint8List?>? bytesList28;
    if (value28 != null) {
      bytesList28 = [];
      for (var str in value28) {
        final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
        bytesList28.add(bytes);
        dynamicSize += bytes.length as int;
      }
    }
    final _perks = bytesList28;
    final value29 = object.redacted;
    final _redacted = value29;
    final value30 = object.screenshot;
    IsarUint8List? _screenshot;
    if (value30 != null) {
      _screenshot = IsarBinaryWriter.utf8Encoder.convert(value30);
    }
    dynamicSize += (_screenshot?.length ?? 0) as int;
    final value31 = object.seasonHash;
    final _seasonHash = value31;
    final value32 = object.secondaryIcon;
    IsarUint8List? _secondaryIcon;
    if (value32 != null) {
      _secondaryIcon = IsarBinaryWriter.utf8Encoder.convert(value32);
    }
    dynamicSize += (_secondaryIcon?.length ?? 0) as int;
    final value33 = object.secondaryOverlay;
    IsarUint8List? _secondaryOverlay;
    if (value33 != null) {
      _secondaryOverlay = IsarBinaryWriter.utf8Encoder.convert(value33);
    }
    dynamicSize += (_secondaryOverlay?.length ?? 0) as int;
    final value34 = object.secondarySpecial;
    IsarUint8List? _secondarySpecial;
    if (value34 != null) {
      _secondarySpecial = IsarBinaryWriter.utf8Encoder.convert(value34);
    }
    dynamicSize += (_secondarySpecial?.length ?? 0) as int;
    final value35 = _destinyInventoryItemDefinitionSpecialItemTypeConverter
        .toIsar(object.specialItemType);
    final _specialItemType = value35;
    final value36 = object.summaryItemHash;
    final _summaryItemHash = value36;
    final value37 = _destinyInventoryItemDefinitionClassListNullableConverter
        .toIsar(object.tooltipNotifications);
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
    final _tooltipNotifications = bytesList37;
    final value38 = object.tooltipStyle;
    IsarUint8List? _tooltipStyle;
    if (value38 != null) {
      _tooltipStyle = IsarBinaryWriter.utf8Encoder.convert(value38);
    }
    dynamicSize += (_tooltipStyle?.length ?? 0) as int;
    final value39 = object.traitHashes;
    dynamicSize += (value39?.length ?? 0) * 8;
    final _traitHashes = value39;
    final value40 = object.traitIds;
    dynamicSize += (value40?.length ?? 0) * 8;
    List<IsarUint8List?>? bytesList40;
    if (value40 != null) {
      bytesList40 = [];
      for (var str in value40) {
        final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
        bytesList40.add(bytes);
        dynamicSize += bytes.length as int;
      }
    }
    final _traitIds = bytesList40;
    final value41 = object.uiItemDisplayStyle;
    IsarUint8List? _uiItemDisplayStyle;
    if (value41 != null) {
      _uiItemDisplayStyle = IsarBinaryWriter.utf8Encoder.convert(value41);
    }
    dynamicSize += (_uiItemDisplayStyle?.length ?? 0) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBool(offsets[0], _allowActions);
    writer.writeStringList(offsets[1], _animations);
    writer.writeLong(offsets[2], _breakerType);
    writer.writeLong(offsets[3], _breakerTypeHash);
    writer.writeLong(offsets[4], _classType);
    writer.writeLong(offsets[5], _collectibleHash);
    writer.writeLongList(offsets[6], _damageTypeHashes);
    writer.writeLongList(offsets[7], _damageTypes);
    writer.writeLong(offsets[8], _defaultDamageType);
    writer.writeLong(offsets[9], _defaultDamageTypeHash);
    writer.writeBytes(offsets[10], _displaySource);
    writer.writeBool(offsets[11], _doesPostmasterPullHaveSideEffects);
    writer.writeLong(offsets[12], _emblemObjectiveHash);
    writer.writeBool(offsets[13], _equippable);
    writer.writeBytes(offsets[14], _flavorText);
    writer.writeBytes(offsets[15], _iconWatermark);
    writer.writeBytes(offsets[16], _iconWatermarkShelved);
    writer.writeLong(offsets[17], _index);
    writer.writeStringList(offsets[18], _investmentStats);
    writer.writeBool(offsets[19], _isWrapper);
    writer.writeLongList(offsets[20], _itemCategoryHashes);
    writer.writeLong(offsets[21], _itemSubType);
    writer.writeLong(offsets[22], _itemType);
    writer.writeBytes(offsets[23], _itemTypeAndTierDisplayName);
    writer.writeBytes(offsets[24], _itemTypeDisplayName);
    writer.writeStringList(offsets[25], _links);
    writer.writeLong(offsets[26], _loreHash);
    writer.writeBool(offsets[27], _nonTransferrable);
    writer.writeStringList(offsets[28], _perks);
    writer.writeBool(offsets[29], _redacted);
    writer.writeBytes(offsets[30], _screenshot);
    writer.writeLong(offsets[31], _seasonHash);
    writer.writeBytes(offsets[32], _secondaryIcon);
    writer.writeBytes(offsets[33], _secondaryOverlay);
    writer.writeBytes(offsets[34], _secondarySpecial);
    writer.writeLong(offsets[35], _specialItemType);
    writer.writeLong(offsets[36], _summaryItemHash);
    writer.writeStringList(offsets[37], _tooltipNotifications);
    writer.writeBytes(offsets[38], _tooltipStyle);
    writer.writeLongList(offsets[39], _traitHashes);
    writer.writeStringList(offsets[40], _traitIds);
    writer.writeBytes(offsets[41], _uiItemDisplayStyle);
  }

  @override
  DestinyInventoryItemDefinition deserialize(
      IsarCollection<DestinyInventoryItemDefinition> collection,
      int id,
      IsarBinaryReader reader,
      List<int> offsets) {
    final object = DestinyInventoryItemDefinition();
    object.allowActions = reader.readBoolOrNull(offsets[0]);
    object.animations =
        _destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(reader.readStringList(offsets[1]))
            ?.cast<DestinyAnimationReference>();
    object.breakerType =
        _destinyInventoryItemDefinitionDestinyBreakerTypeConverter
            .fromIsar(reader.readLongOrNull(offsets[2]));
    object.breakerTypeHash = reader.readLongOrNull(offsets[3]);
    object.classType = _destinyInventoryItemDefinitionDestinyClassConverter
        .fromIsar(reader.readLongOrNull(offsets[4]));
    object.collectibleHash = reader.readLongOrNull(offsets[5]);
    object.damageTypeHashes = reader.readLongList(offsets[6]);
    object.damageTypes = _destinyInventoryItemDefinitionDamageTypesConverter
        .fromIsar(reader.readLongList(offsets[7]));
    object.defaultDamageType =
        _destinyInventoryItemDefinitionDamageTypeConverter
            .fromIsar(reader.readLongOrNull(offsets[8]));
    object.defaultDamageTypeHash = reader.readLongOrNull(offsets[9]);
    object.displaySource = reader.readStringOrNull(offsets[10]);
    object.doesPostmasterPullHaveSideEffects =
        reader.readBoolOrNull(offsets[11]);
    object.emblemObjectiveHash = reader.readLongOrNull(offsets[12]);
    object.equippable = reader.readBoolOrNull(offsets[13]);
    object.flavorText = reader.readStringOrNull(offsets[14]);
    object.hash = id;
    object.iconWatermark = reader.readStringOrNull(offsets[15]);
    object.iconWatermarkShelved = reader.readStringOrNull(offsets[16]);
    object.index = reader.readLongOrNull(offsets[17]);
    object.investmentStats =
        _destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(reader.readStringList(offsets[18]))
            ?.cast<DestinyItemInvestmentStatDefinition>();
    object.isWrapper = reader.readBoolOrNull(offsets[19]);
    object.itemCategoryHashes = reader.readLongList(offsets[20]);
    object.itemSubType =
        _destinyInventoryItemDefinitionDestinyItemSubTypeConverter
            .fromIsar(reader.readLongOrNull(offsets[21]));
    object.itemType = _destinyInventoryItemDefinitionDestinyItemTypeConverter
        .fromIsar(reader.readLongOrNull(offsets[22]));
    object.itemTypeAndTierDisplayName = reader.readStringOrNull(offsets[23]);
    object.itemTypeDisplayName = reader.readStringOrNull(offsets[24]);
    object.links = _destinyInventoryItemDefinitionClassListNullableConverter
        .fromIsar(reader.readStringList(offsets[25]))
        ?.cast<HyperlinkReference>();
    object.loreHash = reader.readLongOrNull(offsets[26]);
    object.nonTransferrable = reader.readBoolOrNull(offsets[27]);
    object.perks = _destinyInventoryItemDefinitionClassListNullableConverter
        .fromIsar(reader.readStringList(offsets[28]))
        ?.cast<DestinyItemPerkEntryDefinition>();
    object.redacted = reader.readBoolOrNull(offsets[29]);
    object.screenshot = reader.readStringOrNull(offsets[30]);
    object.seasonHash = reader.readLongOrNull(offsets[31]);
    object.secondaryIcon = reader.readStringOrNull(offsets[32]);
    object.secondaryOverlay = reader.readStringOrNull(offsets[33]);
    object.secondarySpecial = reader.readStringOrNull(offsets[34]);
    object.specialItemType =
        _destinyInventoryItemDefinitionSpecialItemTypeConverter
            .fromIsar(reader.readLongOrNull(offsets[35]));
    object.summaryItemHash = reader.readLongOrNull(offsets[36]);
    object.tooltipNotifications =
        _destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(reader.readStringList(offsets[37]))
            ?.cast<DestinyItemTooltipNotification>();
    object.tooltipStyle = reader.readStringOrNull(offsets[38]);
    object.traitHashes = reader.readLongList(offsets[39]);
    object.traitIds = reader.readStringList(offsets[40]);
    object.uiItemDisplayStyle = reader.readStringOrNull(offsets[41]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readBoolOrNull(offset)) as P;
      case 1:
        return (_destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(reader.readStringList(offset))) as P;
      case 2:
        return (_destinyInventoryItemDefinitionDestinyBreakerTypeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 3:
        return (reader.readLongOrNull(offset)) as P;
      case 4:
        return (_destinyInventoryItemDefinitionDestinyClassConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 5:
        return (reader.readLongOrNull(offset)) as P;
      case 6:
        return (reader.readLongList(offset)) as P;
      case 7:
        return (_destinyInventoryItemDefinitionDamageTypesConverter
            .fromIsar(reader.readLongList(offset))) as P;
      case 8:
        return (_destinyInventoryItemDefinitionDamageTypeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 9:
        return (reader.readLongOrNull(offset)) as P;
      case 10:
        return (reader.readStringOrNull(offset)) as P;
      case 11:
        return (reader.readBoolOrNull(offset)) as P;
      case 12:
        return (reader.readLongOrNull(offset)) as P;
      case 13:
        return (reader.readBoolOrNull(offset)) as P;
      case 14:
        return (reader.readStringOrNull(offset)) as P;
      case 15:
        return (reader.readStringOrNull(offset)) as P;
      case 16:
        return (reader.readStringOrNull(offset)) as P;
      case 17:
        return (reader.readLongOrNull(offset)) as P;
      case 18:
        return (_destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(reader.readStringList(offset))) as P;
      case 19:
        return (reader.readBoolOrNull(offset)) as P;
      case 20:
        return (reader.readLongList(offset)) as P;
      case 21:
        return (_destinyInventoryItemDefinitionDestinyItemSubTypeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 22:
        return (_destinyInventoryItemDefinitionDestinyItemTypeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 23:
        return (reader.readStringOrNull(offset)) as P;
      case 24:
        return (reader.readStringOrNull(offset)) as P;
      case 25:
        return (_destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(reader.readStringList(offset))) as P;
      case 26:
        return (reader.readLongOrNull(offset)) as P;
      case 27:
        return (reader.readBoolOrNull(offset)) as P;
      case 28:
        return (_destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(reader.readStringList(offset))) as P;
      case 29:
        return (reader.readBoolOrNull(offset)) as P;
      case 30:
        return (reader.readStringOrNull(offset)) as P;
      case 31:
        return (reader.readLongOrNull(offset)) as P;
      case 32:
        return (reader.readStringOrNull(offset)) as P;
      case 33:
        return (reader.readStringOrNull(offset)) as P;
      case 34:
        return (reader.readStringOrNull(offset)) as P;
      case 35:
        return (_destinyInventoryItemDefinitionSpecialItemTypeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 36:
        return (reader.readLongOrNull(offset)) as P;
      case 37:
        return (_destinyInventoryItemDefinitionClassListNullableConverter
            .fromIsar(reader.readStringList(offset))) as P;
      case 38:
        return (reader.readStringOrNull(offset)) as P;
      case 39:
        return (reader.readLongList(offset)) as P;
      case 40:
        return (reader.readStringList(offset)) as P;
      case 41:
        return (reader.readStringOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinyInventoryItemDefinition object) {}
}

extension DestinyInventoryItemDefinitionQueryWhereSort on QueryBuilder<
    DestinyInventoryItemDefinition, DestinyInventoryItemDefinition, QWhere> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhere> anyHash() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension DestinyInventoryItemDefinitionQueryWhere on QueryBuilder<
    DestinyInventoryItemDefinition,
    DestinyInventoryItemDefinition,
    QWhereClause> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhereClause> hashEqualTo(int? hash) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [hash],
      includeLower: true,
      upper: [hash],
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhereClause> hashNotEqualTo(int? hash) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [hash],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [hash],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [hash],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [hash],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhereClause> hashGreaterThan(
    int? hash, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [hash],
      includeLower: include,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhereClause> hashLessThan(
    int? hash, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [hash],
      includeUpper: include,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterWhereClause> hashBetween(
    int? lowerHash,
    int? upperHash, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerHash],
      includeLower: includeLower,
      upper: [upperHash],
      includeUpper: includeUpper,
    ));
  }
}

extension DestinyInventoryItemDefinitionQueryFilter on QueryBuilder<
    DestinyInventoryItemDefinition,
    DestinyInventoryItemDefinition,
    QFilterCondition> {
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
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> hashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterFilterCondition> hashGreaterThan(
    int? value, {
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
    int? value, {
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
    int? lower,
    int? upper, {
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
}

extension DestinyInventoryItemDefinitionQueryLinks on QueryBuilder<
    DestinyInventoryItemDefinition,
    DestinyInventoryItemDefinition,
    QFilterCondition> {}

extension DestinyInventoryItemDefinitionQueryWhereSortBy on QueryBuilder<
    DestinyInventoryItemDefinition, DestinyInventoryItemDefinition, QSortBy> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByAllowActions() {
    return addSortByInternal('allowActions', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByAllowActionsDesc() {
    return addSortByInternal('allowActions', Sort.desc);
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
      QAfterSortBy> sortByFlavorText() {
    return addSortByInternal('flavorText', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByFlavorTextDesc() {
    return addSortByInternal('flavorText', Sort.desc);
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
      QAfterSortBy> sortByNonTransferrable() {
    return addSortByInternal('nonTransferrable', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByNonTransferrableDesc() {
    return addSortByInternal('nonTransferrable', Sort.desc);
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
      QAfterSortBy> sortBySpecialItemType() {
    return addSortByInternal('specialItemType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortBySpecialItemTypeDesc() {
    return addSortByInternal('specialItemType', Sort.desc);
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
      QAfterSortBy> sortByTooltipStyle() {
    return addSortByInternal('tooltipStyle', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByTooltipStyleDesc() {
    return addSortByInternal('tooltipStyle', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByUiItemDisplayStyle() {
    return addSortByInternal('uiItemDisplayStyle', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> sortByUiItemDisplayStyleDesc() {
    return addSortByInternal('uiItemDisplayStyle', Sort.desc);
  }
}

extension DestinyInventoryItemDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyInventoryItemDefinition,
    DestinyInventoryItemDefinition,
    QSortThenBy> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByAllowActions() {
    return addSortByInternal('allowActions', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByAllowActionsDesc() {
    return addSortByInternal('allowActions', Sort.desc);
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
      QAfterSortBy> thenByFlavorText() {
    return addSortByInternal('flavorText', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByFlavorTextDesc() {
    return addSortByInternal('flavorText', Sort.desc);
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
      QAfterSortBy> thenByNonTransferrable() {
    return addSortByInternal('nonTransferrable', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByNonTransferrableDesc() {
    return addSortByInternal('nonTransferrable', Sort.desc);
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
      QAfterSortBy> thenBySpecialItemType() {
    return addSortByInternal('specialItemType', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenBySpecialItemTypeDesc() {
    return addSortByInternal('specialItemType', Sort.desc);
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
      QAfterSortBy> thenByTooltipStyle() {
    return addSortByInternal('tooltipStyle', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByTooltipStyleDesc() {
    return addSortByInternal('tooltipStyle', Sort.desc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByUiItemDisplayStyle() {
    return addSortByInternal('uiItemDisplayStyle', Sort.asc);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QAfterSortBy> thenByUiItemDisplayStyleDesc() {
    return addSortByInternal('uiItemDisplayStyle', Sort.desc);
  }
}

extension DestinyInventoryItemDefinitionQueryWhereDistinct on QueryBuilder<
    DestinyInventoryItemDefinition, DestinyInventoryItemDefinition, QDistinct> {
  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByAllowActions() {
    return addDistinctByInternal('allowActions');
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
      QDistinct> distinctByDefaultDamageType() {
    return addDistinctByInternal('defaultDamageType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByDefaultDamageTypeHash() {
    return addDistinctByInternal('defaultDamageTypeHash');
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
      QDistinct> distinctByFlavorText({bool caseSensitive = true}) {
    return addDistinctByInternal('flavorText', caseSensitive: caseSensitive);
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
      QDistinct> distinctByNonTransferrable() {
    return addDistinctByInternal('nonTransferrable');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByRedacted() {
    return addDistinctByInternal('redacted');
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
      QDistinct> distinctBySpecialItemType() {
    return addDistinctByInternal('specialItemType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctBySummaryItemHash() {
    return addDistinctByInternal('summaryItemHash');
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByTooltipStyle({bool caseSensitive = true}) {
    return addDistinctByInternal('tooltipStyle', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryItemDefinition, DestinyInventoryItemDefinition,
      QDistinct> distinctByUiItemDisplayStyle({bool caseSensitive = true}) {
    return addDistinctByInternal('uiItemDisplayStyle',
        caseSensitive: caseSensitive);
  }
}

extension DestinyInventoryItemDefinitionQueryProperty on QueryBuilder<
    DestinyInventoryItemDefinition,
    DestinyInventoryItemDefinition,
    QQueryProperty> {
  QueryBuilder<DestinyInventoryItemDefinition, bool?, QQueryOperations>
      allowActionsProperty() {
    return addPropertyNameInternal('allowActions');
  }

  QueryBuilder<DestinyInventoryItemDefinition, List<DestinyAnimationReference>?,
      QQueryOperations> animationsProperty() {
    return addPropertyNameInternal('animations');
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

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      flavorTextProperty() {
    return addPropertyNameInternal('flavorText');
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

  QueryBuilder<DestinyInventoryItemDefinition, bool?, QQueryOperations>
      nonTransferrableProperty() {
    return addPropertyNameInternal('nonTransferrable');
  }

  QueryBuilder<DestinyInventoryItemDefinition,
      List<DestinyItemPerkEntryDefinition>?, QQueryOperations> perksProperty() {
    return addPropertyNameInternal('perks');
  }

  QueryBuilder<DestinyInventoryItemDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
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

  QueryBuilder<DestinyInventoryItemDefinition, SpecialItemType?,
      QQueryOperations> specialItemTypeProperty() {
    return addPropertyNameInternal('specialItemType');
  }

  QueryBuilder<DestinyInventoryItemDefinition, int?, QQueryOperations>
      summaryItemHashProperty() {
    return addPropertyNameInternal('summaryItemHash');
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

  QueryBuilder<DestinyInventoryItemDefinition, String?, QQueryOperations>
      uiItemDisplayStyleProperty() {
    return addPropertyNameInternal('uiItemDisplayStyle');
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
