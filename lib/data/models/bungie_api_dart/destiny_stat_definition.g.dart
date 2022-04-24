// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_stat_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetDestinyStatDefinitionCollection on Isar {
  IsarCollection<DestinyStatDefinition> get destinyStatDefinitions {
    return getCollection('DestinyStatDefinition');
  }
}

final DestinyStatDefinitionSchema = CollectionSchema(
  name: 'DestinyStatDefinition',
  schema:
      '{"name":"DestinyStatDefinition","idName":"hash","properties":[{"name":"displayProperties","type":"String"},{"name":"hasComputedBlock","type":"Bool"},{"name":"index","type":"Long"},{"name":"redacted","type":"Bool"},{"name":"statCategory","type":"Long"}],"indexes":[],"links":[]}',
  nativeAdapter: const _DestinyStatDefinitionNativeAdapter(),
  webAdapter: const _DestinyStatDefinitionWebAdapter(),
  idName: 'hash',
  propertyIds: {
    'displayProperties': 0,
    'hasComputedBlock': 1,
    'index': 2,
    'redacted': 3,
    'statCategory': 4
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

const _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter =
    DestinyDisplayPropertiesDefinitionConverter();
const _destinyStatDefinitionDestinyStatCategoryConverter =
    DestinyStatCategoryConverter();

class _DestinyStatDefinitionWebAdapter
    extends IsarWebTypeAdapter<DestinyStatDefinition> {
  const _DestinyStatDefinitionWebAdapter();

  @override
  Object serialize(IsarCollection<DestinyStatDefinition> collection,
      DestinyStatDefinition object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(
        jsObj,
        'displayProperties',
        _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
            .toIsar(object.displayProperties));
    IsarNative.jsObjectSet(jsObj, 'hasComputedBlock', object.hasComputedBlock);
    IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
    IsarNative.jsObjectSet(jsObj, 'index', object.index);
    IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
    IsarNative.jsObjectSet(
        jsObj,
        'statCategory',
        _destinyStatDefinitionDestinyStatCategoryConverter
            .toIsar(object.statCategory));
    return jsObj;
  }

  @override
  DestinyStatDefinition deserialize(
      IsarCollection<DestinyStatDefinition> collection, dynamic jsObj) {
    final object = DestinyStatDefinition();
    object.displayProperties =
        _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'));
    object.hasComputedBlock = IsarNative.jsObjectGet(jsObj, 'hasComputedBlock');
    object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
    object.index = IsarNative.jsObjectGet(jsObj, 'index');
    object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
    object.statCategory = _destinyStatDefinitionDestinyStatCategoryConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'statCategory'));
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'displayProperties':
        return (_destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'))) as P;
      case 'hasComputedBlock':
        return (IsarNative.jsObjectGet(jsObj, 'hasComputedBlock')) as P;
      case 'hash':
        return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
      case 'index':
        return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
      case 'redacted':
        return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
      case 'statCategory':
        return (_destinyStatDefinitionDestinyStatCategoryConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'statCategory'))) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinyStatDefinition object) {}
}

class _DestinyStatDefinitionNativeAdapter
    extends IsarNativeTypeAdapter<DestinyStatDefinition> {
  const _DestinyStatDefinitionNativeAdapter();

  @override
  void serialize(
      IsarCollection<DestinyStatDefinition> collection,
      IsarRawObject rawObj,
      DestinyStatDefinition object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 =
        _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
            .toIsar(object.displayProperties);
    IsarUint8List? _displayProperties;
    if (value0 != null) {
      _displayProperties = IsarBinaryWriter.utf8Encoder.convert(value0);
    }
    dynamicSize += (_displayProperties?.length ?? 0) as int;
    final value1 = object.hasComputedBlock;
    final _hasComputedBlock = value1;
    final value2 = object.index;
    final _index = value2;
    final value3 = object.redacted;
    final _redacted = value3;
    final value4 = _destinyStatDefinitionDestinyStatCategoryConverter
        .toIsar(object.statCategory);
    final _statCategory = value4;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _displayProperties);
    writer.writeBool(offsets[1], _hasComputedBlock);
    writer.writeLong(offsets[2], _index);
    writer.writeBool(offsets[3], _redacted);
    writer.writeLong(offsets[4], _statCategory);
  }

  @override
  DestinyStatDefinition deserialize(
      IsarCollection<DestinyStatDefinition> collection,
      int id,
      IsarBinaryReader reader,
      List<int> offsets) {
    final object = DestinyStatDefinition();
    object.displayProperties =
        _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(reader.readStringOrNull(offsets[0]));
    object.hasComputedBlock = reader.readBoolOrNull(offsets[1]);
    object.hash = id;
    object.index = reader.readLongOrNull(offsets[2]);
    object.redacted = reader.readBoolOrNull(offsets[3]);
    object.statCategory = _destinyStatDefinitionDestinyStatCategoryConverter
        .fromIsar(reader.readLongOrNull(offsets[4]));
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (_destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(reader.readStringOrNull(offset))) as P;
      case 1:
        return (reader.readBoolOrNull(offset)) as P;
      case 2:
        return (reader.readLongOrNull(offset)) as P;
      case 3:
        return (reader.readBoolOrNull(offset)) as P;
      case 4:
        return (_destinyStatDefinitionDestinyStatCategoryConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinyStatDefinition object) {}
}

extension DestinyStatDefinitionQueryWhereSort
    on QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QWhere> {
  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterWhere>
      anyHash() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension DestinyStatDefinitionQueryWhere on QueryBuilder<DestinyStatDefinition,
    DestinyStatDefinition, QWhereClause> {
  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterWhereClause>
      hashEqualTo(int? hash) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [hash],
      includeLower: true,
      upper: [hash],
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterWhereClause>
      hashNotEqualTo(int? hash) {
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

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterWhereClause>
      hashGreaterThan(
    int? hash, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [hash],
      includeLower: include,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterWhereClause>
      hashLessThan(
    int? hash, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [hash],
      includeUpper: include,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterWhereClause>
      hashBetween(
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

extension DestinyStatDefinitionQueryFilter on QueryBuilder<
    DestinyStatDefinition, DestinyStatDefinition, QFilterCondition> {
  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> displayPropertiesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displayProperties',
      value: null,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> displayPropertiesEqualTo(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayProperties',
      value: _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> displayPropertiesGreaterThan(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'displayProperties',
      value: _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> displayPropertiesLessThan(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'displayProperties',
      value: _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> displayPropertiesBetween(
    DestinyDisplayPropertiesDefinition? lower,
    DestinyDisplayPropertiesDefinition? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'displayProperties',
      lower: _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(lower),
      includeLower: includeLower,
      upper: _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> displayPropertiesStartsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displayProperties',
      value: _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> displayPropertiesEndsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displayProperties',
      value: _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
          QAfterFilterCondition>
      displayPropertiesContains(DestinyDisplayPropertiesDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displayProperties',
      value: _destinyStatDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
          QAfterFilterCondition>
      displayPropertiesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displayProperties',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> hasComputedBlockIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hasComputedBlock',
      value: null,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> hasComputedBlockEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hasComputedBlock',
      value: value,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> hashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
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

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
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

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
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

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
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

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
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

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
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

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> statCategoryIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'statCategory',
      value: null,
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> statCategoryEqualTo(DestinyStatCategory? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'statCategory',
      value: _destinyStatDefinitionDestinyStatCategoryConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> statCategoryGreaterThan(
    DestinyStatCategory? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'statCategory',
      value: _destinyStatDefinitionDestinyStatCategoryConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> statCategoryLessThan(
    DestinyStatCategory? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'statCategory',
      value: _destinyStatDefinitionDestinyStatCategoryConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition,
      QAfterFilterCondition> statCategoryBetween(
    DestinyStatCategory? lower,
    DestinyStatCategory? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'statCategory',
      lower: _destinyStatDefinitionDestinyStatCategoryConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _destinyStatDefinitionDestinyStatCategoryConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }
}

extension DestinyStatDefinitionQueryLinks on QueryBuilder<DestinyStatDefinition,
    DestinyStatDefinition, QFilterCondition> {}

extension DestinyStatDefinitionQueryWhereSortBy
    on QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QSortBy> {
  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByHasComputedBlock() {
    return addSortByInternal('hasComputedBlock', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByHasComputedBlockDesc() {
    return addSortByInternal('hasComputedBlock', Sort.desc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByStatCategory() {
    return addSortByInternal('statCategory', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      sortByStatCategoryDesc() {
    return addSortByInternal('statCategory', Sort.desc);
  }
}

extension DestinyStatDefinitionQueryWhereSortThenBy
    on QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QSortThenBy> {
  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByHasComputedBlock() {
    return addSortByInternal('hasComputedBlock', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByHasComputedBlockDesc() {
    return addSortByInternal('hasComputedBlock', Sort.desc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByStatCategory() {
    return addSortByInternal('statCategory', Sort.asc);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QAfterSortBy>
      thenByStatCategoryDesc() {
    return addSortByInternal('statCategory', Sort.desc);
  }
}

extension DestinyStatDefinitionQueryWhereDistinct
    on QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QDistinct> {
  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QDistinct>
      distinctByDisplayProperties({bool caseSensitive = true}) {
    return addDistinctByInternal('displayProperties',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QDistinct>
      distinctByHasComputedBlock() {
    return addDistinctByInternal('hasComputedBlock');
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QDistinct>
      distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QDistinct>
      distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QDistinct>
      distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatDefinition, QDistinct>
      distinctByStatCategory() {
    return addDistinctByInternal('statCategory');
  }
}

extension DestinyStatDefinitionQueryProperty on QueryBuilder<
    DestinyStatDefinition, DestinyStatDefinition, QQueryProperty> {
  QueryBuilder<DestinyStatDefinition, DestinyDisplayPropertiesDefinition?,
      QQueryOperations> displayPropertiesProperty() {
    return addPropertyNameInternal('displayProperties');
  }

  QueryBuilder<DestinyStatDefinition, bool?, QQueryOperations>
      hasComputedBlockProperty() {
    return addPropertyNameInternal('hasComputedBlock');
  }

  QueryBuilder<DestinyStatDefinition, int?, QQueryOperations> hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyStatDefinition, int?, QQueryOperations> indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinyStatDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }

  QueryBuilder<DestinyStatDefinition, DestinyStatCategory?, QQueryOperations>
      statCategoryProperty() {
    return addPropertyNameInternal('statCategory');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyStatDefinition _$DestinyStatDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyStatDefinition()
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..aggregationType =
          decodeDestinyStatAggregationType(json['aggregationType'])
      ..hasComputedBlock = json['hasComputedBlock'] as bool?
      ..statCategory = decodeDestinyStatCategory(json['statCategory'])
      ..hash = json['hash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinyStatDefinitionToJson(
        DestinyStatDefinition instance) =>
    <String, dynamic>{
      'displayProperties': instance.displayProperties,
      'aggregationType':
          encodeDestinyStatAggregationType(instance.aggregationType),
      'hasComputedBlock': instance.hasComputedBlock,
      'statCategory': encodeDestinyStatCategory(instance.statCategory),
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
