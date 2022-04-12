// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_sandbox_perk_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetDestinySandboxPerkDefinitionCollection on Isar {
  IsarCollection<DestinySandboxPerkDefinition>
      get destinySandboxPerkDefinitions {
    return getCollection('DestinySandboxPerkDefinition');
  }
}

final DestinySandboxPerkDefinitionSchema = CollectionSchema(
  name: 'DestinySandboxPerkDefinition',
  schema:
      '{"name":"DestinySandboxPerkDefinition","idName":"hash","properties":[{"name":"damageType","type":"Long"},{"name":"damageTypeHash","type":"Long"},{"name":"index","type":"Long"},{"name":"isDisplayable","type":"Bool"},{"name":"perkIdentifier","type":"String"},{"name":"redacted","type":"Bool"}],"indexes":[],"links":[]}',
  nativeAdapter: const _DestinySandboxPerkDefinitionNativeAdapter(),
  webAdapter: const _DestinySandboxPerkDefinitionWebAdapter(),
  idName: 'hash',
  propertyIds: {
    'damageType': 0,
    'damageTypeHash': 1,
    'index': 2,
    'isDisplayable': 3,
    'perkIdentifier': 4,
    'redacted': 5
  },
  listProperties: {},
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

const _destinySandboxPerkDefinitionDamageTypeConverter = DamageTypeConverter();

class _DestinySandboxPerkDefinitionWebAdapter
    extends IsarWebTypeAdapter<DestinySandboxPerkDefinition> {
  const _DestinySandboxPerkDefinitionWebAdapter();

  @override
  Object serialize(IsarCollection<DestinySandboxPerkDefinition> collection,
      DestinySandboxPerkDefinition object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(
        jsObj,
        'damageType',
        _destinySandboxPerkDefinitionDamageTypeConverter
            .toIsar(object.damageType));
    IsarNative.jsObjectSet(jsObj, 'damageTypeHash', object.damageTypeHash);
    IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
    IsarNative.jsObjectSet(jsObj, 'index', object.index);
    IsarNative.jsObjectSet(jsObj, 'isDisplayable', object.isDisplayable);
    IsarNative.jsObjectSet(jsObj, 'perkIdentifier', object.perkIdentifier);
    IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
    return jsObj;
  }

  @override
  DestinySandboxPerkDefinition deserialize(
      IsarCollection<DestinySandboxPerkDefinition> collection, dynamic jsObj) {
    final object = DestinySandboxPerkDefinition();
    object.damageType = _destinySandboxPerkDefinitionDamageTypeConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'damageType'));
    object.damageTypeHash = IsarNative.jsObjectGet(jsObj, 'damageTypeHash');
    object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
    object.index = IsarNative.jsObjectGet(jsObj, 'index');
    object.isDisplayable = IsarNative.jsObjectGet(jsObj, 'isDisplayable');
    object.perkIdentifier = IsarNative.jsObjectGet(jsObj, 'perkIdentifier');
    object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'damageType':
        return (_destinySandboxPerkDefinitionDamageTypeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'damageType'))) as P;
      case 'damageTypeHash':
        return (IsarNative.jsObjectGet(jsObj, 'damageTypeHash')) as P;
      case 'hash':
        return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
      case 'index':
        return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
      case 'isDisplayable':
        return (IsarNative.jsObjectGet(jsObj, 'isDisplayable')) as P;
      case 'perkIdentifier':
        return (IsarNative.jsObjectGet(jsObj, 'perkIdentifier')) as P;
      case 'redacted':
        return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinySandboxPerkDefinition object) {}
}

class _DestinySandboxPerkDefinitionNativeAdapter
    extends IsarNativeTypeAdapter<DestinySandboxPerkDefinition> {
  const _DestinySandboxPerkDefinitionNativeAdapter();

  @override
  void serialize(
      IsarCollection<DestinySandboxPerkDefinition> collection,
      IsarRawObject rawObj,
      DestinySandboxPerkDefinition object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = _destinySandboxPerkDefinitionDamageTypeConverter
        .toIsar(object.damageType);
    final _damageType = value0;
    final value1 = object.damageTypeHash;
    final _damageTypeHash = value1;
    final value2 = object.index;
    final _index = value2;
    final value3 = object.isDisplayable;
    final _isDisplayable = value3;
    final value4 = object.perkIdentifier;
    IsarUint8List? _perkIdentifier;
    if (value4 != null) {
      _perkIdentifier = IsarBinaryWriter.utf8Encoder.convert(value4);
    }
    dynamicSize += (_perkIdentifier?.length ?? 0) as int;
    final value5 = object.redacted;
    final _redacted = value5;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _damageType);
    writer.writeLong(offsets[1], _damageTypeHash);
    writer.writeLong(offsets[2], _index);
    writer.writeBool(offsets[3], _isDisplayable);
    writer.writeBytes(offsets[4], _perkIdentifier);
    writer.writeBool(offsets[5], _redacted);
  }

  @override
  DestinySandboxPerkDefinition deserialize(
      IsarCollection<DestinySandboxPerkDefinition> collection,
      int id,
      IsarBinaryReader reader,
      List<int> offsets) {
    final object = DestinySandboxPerkDefinition();
    object.damageType = _destinySandboxPerkDefinitionDamageTypeConverter
        .fromIsar(reader.readLongOrNull(offsets[0]));
    object.damageTypeHash = reader.readLongOrNull(offsets[1]);
    object.hash = id;
    object.index = reader.readLongOrNull(offsets[2]);
    object.isDisplayable = reader.readBoolOrNull(offsets[3]);
    object.perkIdentifier = reader.readStringOrNull(offsets[4]);
    object.redacted = reader.readBoolOrNull(offsets[5]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (_destinySandboxPerkDefinitionDamageTypeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 1:
        return (reader.readLongOrNull(offset)) as P;
      case 2:
        return (reader.readLongOrNull(offset)) as P;
      case 3:
        return (reader.readBoolOrNull(offset)) as P;
      case 4:
        return (reader.readStringOrNull(offset)) as P;
      case 5:
        return (reader.readBoolOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinySandboxPerkDefinition object) {}
}

extension DestinySandboxPerkDefinitionQueryWhereSort on QueryBuilder<
    DestinySandboxPerkDefinition, DestinySandboxPerkDefinition, QWhere> {
  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterWhere> anyHash() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension DestinySandboxPerkDefinitionQueryWhere on QueryBuilder<
    DestinySandboxPerkDefinition, DestinySandboxPerkDefinition, QWhereClause> {
  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterWhereClause> hashEqualTo(int? hash) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [hash],
      includeLower: true,
      upper: [hash],
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

extension DestinySandboxPerkDefinitionQueryFilter on QueryBuilder<
    DestinySandboxPerkDefinition,
    DestinySandboxPerkDefinition,
    QFilterCondition> {
  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> damageTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'damageType',
      value: null,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> damageTypeEqualTo(DamageType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'damageType',
      value: _destinySandboxPerkDefinitionDamageTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> damageTypeGreaterThan(
    DamageType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'damageType',
      value: _destinySandboxPerkDefinitionDamageTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> damageTypeLessThan(
    DamageType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'damageType',
      value: _destinySandboxPerkDefinitionDamageTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> damageTypeBetween(
    DamageType? lower,
    DamageType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'damageType',
      lower: _destinySandboxPerkDefinitionDamageTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _destinySandboxPerkDefinitionDamageTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> damageTypeHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'damageTypeHash',
      value: null,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> damageTypeHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'damageTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> damageTypeHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'damageTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> damageTypeHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'damageTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> damageTypeHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'damageTypeHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> hashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> isDisplayableIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'isDisplayable',
      value: null,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> isDisplayableEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isDisplayable',
      value: value,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkIdentifierIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'perkIdentifier',
      value: null,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkIdentifierEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'perkIdentifier',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkIdentifierGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'perkIdentifier',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkIdentifierLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'perkIdentifier',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkIdentifierBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'perkIdentifier',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkIdentifierStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'perkIdentifier',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkIdentifierEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'perkIdentifier',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
          QAfterFilterCondition>
      perkIdentifierContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'perkIdentifier',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
          QAfterFilterCondition>
      perkIdentifierMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'perkIdentifier',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }
}

extension DestinySandboxPerkDefinitionQueryLinks on QueryBuilder<
    DestinySandboxPerkDefinition,
    DestinySandboxPerkDefinition,
    QFilterCondition> {}

extension DestinySandboxPerkDefinitionQueryWhereSortBy on QueryBuilder<
    DestinySandboxPerkDefinition, DestinySandboxPerkDefinition, QSortBy> {
  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByDamageType() {
    return addSortByInternal('damageType', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByDamageTypeDesc() {
    return addSortByInternal('damageType', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByDamageTypeHash() {
    return addSortByInternal('damageTypeHash', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByDamageTypeHashDesc() {
    return addSortByInternal('damageTypeHash', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByIsDisplayable() {
    return addSortByInternal('isDisplayable', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByIsDisplayableDesc() {
    return addSortByInternal('isDisplayable', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByPerkIdentifier() {
    return addSortByInternal('perkIdentifier', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByPerkIdentifierDesc() {
    return addSortByInternal('perkIdentifier', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }
}

extension DestinySandboxPerkDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinySandboxPerkDefinition, DestinySandboxPerkDefinition, QSortThenBy> {
  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByDamageType() {
    return addSortByInternal('damageType', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByDamageTypeDesc() {
    return addSortByInternal('damageType', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByDamageTypeHash() {
    return addSortByInternal('damageTypeHash', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByDamageTypeHashDesc() {
    return addSortByInternal('damageTypeHash', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByIsDisplayable() {
    return addSortByInternal('isDisplayable', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByIsDisplayableDesc() {
    return addSortByInternal('isDisplayable', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByPerkIdentifier() {
    return addSortByInternal('perkIdentifier', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByPerkIdentifierDesc() {
    return addSortByInternal('perkIdentifier', Sort.desc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }
}

extension DestinySandboxPerkDefinitionQueryWhereDistinct on QueryBuilder<
    DestinySandboxPerkDefinition, DestinySandboxPerkDefinition, QDistinct> {
  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QDistinct> distinctByDamageType() {
    return addDistinctByInternal('damageType');
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QDistinct> distinctByDamageTypeHash() {
    return addDistinctByInternal('damageTypeHash');
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QDistinct> distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QDistinct> distinctByIsDisplayable() {
    return addDistinctByInternal('isDisplayable');
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QDistinct> distinctByPerkIdentifier({bool caseSensitive = true}) {
    return addDistinctByInternal('perkIdentifier',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QDistinct> distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }
}

extension DestinySandboxPerkDefinitionQueryProperty on QueryBuilder<
    DestinySandboxPerkDefinition,
    DestinySandboxPerkDefinition,
    QQueryProperty> {
  QueryBuilder<DestinySandboxPerkDefinition, DamageType?, QQueryOperations>
      damageTypeProperty() {
    return addPropertyNameInternal('damageType');
  }

  QueryBuilder<DestinySandboxPerkDefinition, int?, QQueryOperations>
      damageTypeHashProperty() {
    return addPropertyNameInternal('damageTypeHash');
  }

  QueryBuilder<DestinySandboxPerkDefinition, int?, QQueryOperations>
      hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinySandboxPerkDefinition, int?, QQueryOperations>
      indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinySandboxPerkDefinition, bool?, QQueryOperations>
      isDisplayableProperty() {
    return addPropertyNameInternal('isDisplayable');
  }

  QueryBuilder<DestinySandboxPerkDefinition, String?, QQueryOperations>
      perkIdentifierProperty() {
    return addPropertyNameInternal('perkIdentifier');
  }

  QueryBuilder<DestinySandboxPerkDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinySandboxPerkDefinition _$DestinySandboxPerkDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinySandboxPerkDefinition()
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..perkIdentifier = json['perkIdentifier'] as String?
      ..isDisplayable = json['isDisplayable'] as bool?
      ..damageType = decodeDamageType(json['damageType'])
      ..damageTypeHash = json['damageTypeHash'] as int?
      ..perkGroups = json['perkGroups'] == null
          ? null
          : DestinyTalentNodeStepGroups.fromJson(
              json['perkGroups'] as Map<String, dynamic>)
      ..hash = json['hash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinySandboxPerkDefinitionToJson(
        DestinySandboxPerkDefinition instance) =>
    <String, dynamic>{
      'displayProperties': instance.displayProperties,
      'perkIdentifier': instance.perkIdentifier,
      'isDisplayable': instance.isDisplayable,
      'damageType': encodeDamageType(instance.damageType),
      'damageTypeHash': instance.damageTypeHash,
      'perkGroups': instance.perkGroups,
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
