// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_class_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetDestinyClassDefinitionCollection on Isar {
  IsarCollection<DestinyClassDefinition> get destinyClassDefinitions {
    return getCollection('DestinyClassDefinition');
  }
}

final DestinyClassDefinitionSchema = CollectionSchema(
  name: 'DestinyClassDefinition',
  schema:
      '{"name":"DestinyClassDefinition","idName":"hash","properties":[{"name":"genderedClassNames","type":"String"},{"name":"genderedClassNamesByGenderHash","type":"String"},{"name":"index","type":"Long"},{"name":"mentorVendorHash","type":"Long"},{"name":"redacted","type":"Bool"}],"indexes":[],"links":[]}',
  nativeAdapter: const _DestinyClassDefinitionNativeAdapter(),
  webAdapter: const _DestinyClassDefinitionWebAdapter(),
  idName: 'hash',
  propertyIds: {
    'genderedClassNames': 0,
    'genderedClassNamesByGenderHash': 1,
    'index': 2,
    'mentorVendorHash': 3,
    'redacted': 4
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

const _destinyClassDefinitionMapConverter = MapConverter();

class _DestinyClassDefinitionWebAdapter
    extends IsarWebTypeAdapter<DestinyClassDefinition> {
  const _DestinyClassDefinitionWebAdapter();

  @override
  Object serialize(IsarCollection<DestinyClassDefinition> collection,
      DestinyClassDefinition object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'genderedClassNames',
        _destinyClassDefinitionMapConverter.toIsar(object.genderedClassNames));
    IsarNative.jsObjectSet(
        jsObj,
        'genderedClassNamesByGenderHash',
        _destinyClassDefinitionMapConverter
            .toIsar(object.genderedClassNamesByGenderHash));
    IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
    IsarNative.jsObjectSet(jsObj, 'index', object.index);
    IsarNative.jsObjectSet(jsObj, 'mentorVendorHash', object.mentorVendorHash);
    IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
    return jsObj;
  }

  @override
  DestinyClassDefinition deserialize(
      IsarCollection<DestinyClassDefinition> collection, dynamic jsObj) {
    final object = DestinyClassDefinition();
    object.genderedClassNames = _destinyClassDefinitionMapConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'genderedClassNames'));
    object.genderedClassNamesByGenderHash =
        _destinyClassDefinitionMapConverter.fromIsar(
            IsarNative.jsObjectGet(jsObj, 'genderedClassNamesByGenderHash'));
    object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
    object.index = IsarNative.jsObjectGet(jsObj, 'index');
    object.mentorVendorHash = IsarNative.jsObjectGet(jsObj, 'mentorVendorHash');
    object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'genderedClassNames':
        return (_destinyClassDefinitionMapConverter.fromIsar(
            IsarNative.jsObjectGet(jsObj, 'genderedClassNames'))) as P;
      case 'genderedClassNamesByGenderHash':
        return (_destinyClassDefinitionMapConverter.fromIsar(
            IsarNative.jsObjectGet(
                jsObj, 'genderedClassNamesByGenderHash'))) as P;
      case 'hash':
        return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
      case 'index':
        return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
      case 'mentorVendorHash':
        return (IsarNative.jsObjectGet(jsObj, 'mentorVendorHash')) as P;
      case 'redacted':
        return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinyClassDefinition object) {}
}

class _DestinyClassDefinitionNativeAdapter
    extends IsarNativeTypeAdapter<DestinyClassDefinition> {
  const _DestinyClassDefinitionNativeAdapter();

  @override
  void serialize(
      IsarCollection<DestinyClassDefinition> collection,
      IsarRawObject rawObj,
      DestinyClassDefinition object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 =
        _destinyClassDefinitionMapConverter.toIsar(object.genderedClassNames);
    IsarUint8List? _genderedClassNames;
    if (value0 != null) {
      _genderedClassNames = IsarBinaryWriter.utf8Encoder.convert(value0);
    }
    dynamicSize += (_genderedClassNames?.length ?? 0) as int;
    final value1 = _destinyClassDefinitionMapConverter
        .toIsar(object.genderedClassNamesByGenderHash);
    IsarUint8List? _genderedClassNamesByGenderHash;
    if (value1 != null) {
      _genderedClassNamesByGenderHash =
          IsarBinaryWriter.utf8Encoder.convert(value1);
    }
    dynamicSize += (_genderedClassNamesByGenderHash?.length ?? 0) as int;
    final value2 = object.index;
    final _index = value2;
    final value3 = object.mentorVendorHash;
    final _mentorVendorHash = value3;
    final value4 = object.redacted;
    final _redacted = value4;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _genderedClassNames);
    writer.writeBytes(offsets[1], _genderedClassNamesByGenderHash);
    writer.writeLong(offsets[2], _index);
    writer.writeLong(offsets[3], _mentorVendorHash);
    writer.writeBool(offsets[4], _redacted);
  }

  @override
  DestinyClassDefinition deserialize(
      IsarCollection<DestinyClassDefinition> collection,
      int id,
      IsarBinaryReader reader,
      List<int> offsets) {
    final object = DestinyClassDefinition();
    object.genderedClassNames = _destinyClassDefinitionMapConverter
        .fromIsar(reader.readStringOrNull(offsets[0]));
    object.genderedClassNamesByGenderHash = _destinyClassDefinitionMapConverter
        .fromIsar(reader.readStringOrNull(offsets[1]));
    object.hash = id;
    object.index = reader.readLongOrNull(offsets[2]);
    object.mentorVendorHash = reader.readLongOrNull(offsets[3]);
    object.redacted = reader.readBoolOrNull(offsets[4]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (_destinyClassDefinitionMapConverter
            .fromIsar(reader.readStringOrNull(offset))) as P;
      case 1:
        return (_destinyClassDefinitionMapConverter
            .fromIsar(reader.readStringOrNull(offset))) as P;
      case 2:
        return (reader.readLongOrNull(offset)) as P;
      case 3:
        return (reader.readLongOrNull(offset)) as P;
      case 4:
        return (reader.readBoolOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinyClassDefinition object) {}
}

extension DestinyClassDefinitionQueryWhereSort
    on QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QWhere> {
  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterWhere>
      anyHash() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension DestinyClassDefinitionQueryWhere on QueryBuilder<
    DestinyClassDefinition, DestinyClassDefinition, QWhereClause> {
  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterWhereClause> hashEqualTo(int? hash) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [hash],
      includeLower: true,
      upper: [hash],
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
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

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
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

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
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

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
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

extension DestinyClassDefinitionQueryFilter on QueryBuilder<
    DestinyClassDefinition, DestinyClassDefinition, QFilterCondition> {
  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'genderedClassNames',
      value: null,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesEqualTo(
    Map<String, String>? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'genderedClassNames',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesGreaterThan(
    Map<String, String>? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'genderedClassNames',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesLessThan(
    Map<String, String>? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'genderedClassNames',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesBetween(
    Map<String, String>? lower,
    Map<String, String>? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'genderedClassNames',
      lower: _destinyClassDefinitionMapConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _destinyClassDefinitionMapConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesStartsWith(
    Map<String, String> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'genderedClassNames',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesEndsWith(
    Map<String, String> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'genderedClassNames',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
          QAfterFilterCondition>
      genderedClassNamesContains(Map<String, String> value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'genderedClassNames',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
          QAfterFilterCondition>
      genderedClassNamesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'genderedClassNames',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesByGenderHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'genderedClassNamesByGenderHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesByGenderHashEqualTo(
    Map<String, String>? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'genderedClassNamesByGenderHash',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesByGenderHashGreaterThan(
    Map<String, String>? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'genderedClassNamesByGenderHash',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesByGenderHashLessThan(
    Map<String, String>? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'genderedClassNamesByGenderHash',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesByGenderHashBetween(
    Map<String, String>? lower,
    Map<String, String>? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'genderedClassNamesByGenderHash',
      lower: _destinyClassDefinitionMapConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _destinyClassDefinitionMapConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesByGenderHashStartsWith(
    Map<String, String> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'genderedClassNamesByGenderHash',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> genderedClassNamesByGenderHashEndsWith(
    Map<String, String> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'genderedClassNamesByGenderHash',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
          QAfterFilterCondition>
      genderedClassNamesByGenderHashContains(Map<String, String> value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'genderedClassNamesByGenderHash',
      value: _destinyClassDefinitionMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
          QAfterFilterCondition>
      genderedClassNamesByGenderHashMatches(String pattern,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'genderedClassNamesByGenderHash',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> hashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
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

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
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

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
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

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
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

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
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

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
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

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> mentorVendorHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'mentorVendorHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> mentorVendorHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'mentorVendorHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> mentorVendorHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'mentorVendorHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> mentorVendorHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'mentorVendorHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> mentorVendorHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'mentorVendorHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }
}

extension DestinyClassDefinitionQueryLinks on QueryBuilder<
    DestinyClassDefinition, DestinyClassDefinition, QFilterCondition> {}

extension DestinyClassDefinitionQueryWhereSortBy
    on QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QSortBy> {
  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByGenderedClassNames() {
    return addSortByInternal('genderedClassNames', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByGenderedClassNamesDesc() {
    return addSortByInternal('genderedClassNames', Sort.desc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByGenderedClassNamesByGenderHash() {
    return addSortByInternal('genderedClassNamesByGenderHash', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByGenderedClassNamesByGenderHashDesc() {
    return addSortByInternal('genderedClassNamesByGenderHash', Sort.desc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByMentorVendorHash() {
    return addSortByInternal('mentorVendorHash', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByMentorVendorHashDesc() {
    return addSortByInternal('mentorVendorHash', Sort.desc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }
}

extension DestinyClassDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyClassDefinition, DestinyClassDefinition, QSortThenBy> {
  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByGenderedClassNames() {
    return addSortByInternal('genderedClassNames', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByGenderedClassNamesDesc() {
    return addSortByInternal('genderedClassNames', Sort.desc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByGenderedClassNamesByGenderHash() {
    return addSortByInternal('genderedClassNamesByGenderHash', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByGenderedClassNamesByGenderHashDesc() {
    return addSortByInternal('genderedClassNamesByGenderHash', Sort.desc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByMentorVendorHash() {
    return addSortByInternal('mentorVendorHash', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByMentorVendorHashDesc() {
    return addSortByInternal('mentorVendorHash', Sort.desc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QAfterSortBy>
      thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }
}

extension DestinyClassDefinitionQueryWhereDistinct
    on QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QDistinct> {
  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QDistinct>
      distinctByGenderedClassNames({bool caseSensitive = true}) {
    return addDistinctByInternal('genderedClassNames',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QDistinct>
      distinctByGenderedClassNamesByGenderHash({bool caseSensitive = true}) {
    return addDistinctByInternal('genderedClassNamesByGenderHash',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QDistinct>
      distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QDistinct>
      distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QDistinct>
      distinctByMentorVendorHash() {
    return addDistinctByInternal('mentorVendorHash');
  }

  QueryBuilder<DestinyClassDefinition, DestinyClassDefinition, QDistinct>
      distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }
}

extension DestinyClassDefinitionQueryProperty on QueryBuilder<
    DestinyClassDefinition, DestinyClassDefinition, QQueryProperty> {
  QueryBuilder<DestinyClassDefinition, Map<String, String>?, QQueryOperations>
      genderedClassNamesProperty() {
    return addPropertyNameInternal('genderedClassNames');
  }

  QueryBuilder<DestinyClassDefinition, Map<String, String>?, QQueryOperations>
      genderedClassNamesByGenderHashProperty() {
    return addPropertyNameInternal('genderedClassNamesByGenderHash');
  }

  QueryBuilder<DestinyClassDefinition, int?, QQueryOperations> hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyClassDefinition, int?, QQueryOperations> indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinyClassDefinition, int?, QQueryOperations>
      mentorVendorHashProperty() {
    return addPropertyNameInternal('mentorVendorHash');
  }

  QueryBuilder<DestinyClassDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyClassDefinition _$DestinyClassDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyClassDefinition()
      ..hash = json['hash'] as int?
      ..classType = decodeDestinyClass(json['classType'])
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..genderedClassNames =
          (json['genderedClassNames'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      )
      ..genderedClassNamesByGenderHash =
          (json['genderedClassNamesByGenderHash'] as Map<String, dynamic>?)
              ?.map(
        (k, e) => MapEntry(k, e as String),
      )
      ..mentorVendorHash = json['mentorVendorHash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinyClassDefinitionToJson(
        DestinyClassDefinition instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'classType': encodeDestinyClass(instance.classType),
      'displayProperties': instance.displayProperties,
      'genderedClassNames': instance.genderedClassNames,
      'genderedClassNamesByGenderHash': instance.genderedClassNamesByGenderHash,
      'mentorVendorHash': instance.mentorVendorHash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
