// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_plug_set_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetDestinyPlugSetDefinitionCollection on Isar {
  IsarCollection<DestinyPlugSetDefinition> get destinyPlugSetDefinitions {
    return getCollection('DestinyPlugSetDefinition');
  }
}

final DestinyPlugSetDefinitionSchema = CollectionSchema(
  name: 'DestinyPlugSetDefinition',
  schema:
      '{"name":"DestinyPlugSetDefinition","idName":"hash","properties":[{"name":"displayProperties","type":"String"},{"name":"index","type":"Long"},{"name":"isFakePlugSet","type":"Bool"},{"name":"redacted","type":"Bool"},{"name":"reusablePlugItems","type":"StringList"}],"indexes":[],"links":[]}',
  nativeAdapter: const _DestinyPlugSetDefinitionNativeAdapter(),
  webAdapter: const _DestinyPlugSetDefinitionWebAdapter(),
  idName: 'hash',
  propertyIds: {
    'displayProperties': 0,
    'index': 1,
    'isFakePlugSet': 2,
    'redacted': 3,
    'reusablePlugItems': 4
  },
  listProperties: {'reusablePlugItems'},
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

const _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter =
    DestinyDisplayPropertiesDefinitionConverter();
const _destinyPlugSetDefinitionDestinyItemSocketEntryPlugItemRandomizedDefinitionListConverter =
    DestinyItemSocketEntryPlugItemRandomizedDefinitionListConverter();

class _DestinyPlugSetDefinitionWebAdapter
    extends IsarWebTypeAdapter<DestinyPlugSetDefinition> {
  const _DestinyPlugSetDefinitionWebAdapter();

  @override
  Object serialize(IsarCollection<DestinyPlugSetDefinition> collection,
      DestinyPlugSetDefinition object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(
        jsObj,
        'displayProperties',
        _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
            .toIsar(object.displayProperties));
    IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
    IsarNative.jsObjectSet(jsObj, 'index', object.index);
    IsarNative.jsObjectSet(jsObj, 'isFakePlugSet', object.isFakePlugSet);
    IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
    IsarNative.jsObjectSet(
        jsObj,
        'reusablePlugItems',
        _destinyPlugSetDefinitionDestinyItemSocketEntryPlugItemRandomizedDefinitionListConverter
            .toIsar(object.reusablePlugItems));
    return jsObj;
  }

  @override
  DestinyPlugSetDefinition deserialize(
      IsarCollection<DestinyPlugSetDefinition> collection, dynamic jsObj) {
    final object = DestinyPlugSetDefinition();
    object.displayProperties =
        _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'));
    object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
    object.index = IsarNative.jsObjectGet(jsObj, 'index');
    object.isFakePlugSet = IsarNative.jsObjectGet(jsObj, 'isFakePlugSet');
    object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
    object.reusablePlugItems =
        _destinyPlugSetDefinitionDestinyItemSocketEntryPlugItemRandomizedDefinitionListConverter
            .fromIsar(
                (IsarNative.jsObjectGet(jsObj, 'reusablePlugItems') as List?)
                    ?.map((e) => e ?? '')
                    .toList()
                    .cast<String>());
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'displayProperties':
        return (_destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'))) as P;
      case 'hash':
        return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
      case 'index':
        return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
      case 'isFakePlugSet':
        return (IsarNative.jsObjectGet(jsObj, 'isFakePlugSet')) as P;
      case 'redacted':
        return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
      case 'reusablePlugItems':
        return (_destinyPlugSetDefinitionDestinyItemSocketEntryPlugItemRandomizedDefinitionListConverter
            .fromIsar(
                (IsarNative.jsObjectGet(jsObj, 'reusablePlugItems') as List?)
                    ?.map((e) => e ?? '')
                    .toList()
                    .cast<String>())) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinyPlugSetDefinition object) {}
}

class _DestinyPlugSetDefinitionNativeAdapter
    extends IsarNativeTypeAdapter<DestinyPlugSetDefinition> {
  const _DestinyPlugSetDefinitionNativeAdapter();

  @override
  void serialize(
      IsarCollection<DestinyPlugSetDefinition> collection,
      IsarRawObject rawObj,
      DestinyPlugSetDefinition object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 =
        _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
            .toIsar(object.displayProperties);
    IsarUint8List? _displayProperties;
    if (value0 != null) {
      _displayProperties = IsarBinaryWriter.utf8Encoder.convert(value0);
    }
    dynamicSize += (_displayProperties?.length ?? 0) as int;
    final value1 = object.index;
    final _index = value1;
    final value2 = object.isFakePlugSet;
    final _isFakePlugSet = value2;
    final value3 = object.redacted;
    final _redacted = value3;
    final value4 =
        _destinyPlugSetDefinitionDestinyItemSocketEntryPlugItemRandomizedDefinitionListConverter
            .toIsar(object.reusablePlugItems);
    dynamicSize += (value4?.length ?? 0) * 8;
    List<IsarUint8List?>? bytesList4;
    if (value4 != null) {
      bytesList4 = [];
      for (var str in value4) {
        final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
        bytesList4.add(bytes);
        dynamicSize += bytes.length as int;
      }
    }
    final _reusablePlugItems = bytesList4;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _displayProperties);
    writer.writeLong(offsets[1], _index);
    writer.writeBool(offsets[2], _isFakePlugSet);
    writer.writeBool(offsets[3], _redacted);
    writer.writeStringList(offsets[4], _reusablePlugItems);
  }

  @override
  DestinyPlugSetDefinition deserialize(
      IsarCollection<DestinyPlugSetDefinition> collection,
      int id,
      IsarBinaryReader reader,
      List<int> offsets) {
    final object = DestinyPlugSetDefinition();
    object.displayProperties =
        _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(reader.readStringOrNull(offsets[0]));
    object.hash = id;
    object.index = reader.readLongOrNull(offsets[1]);
    object.isFakePlugSet = reader.readBoolOrNull(offsets[2]);
    object.redacted = reader.readBoolOrNull(offsets[3]);
    object.reusablePlugItems =
        _destinyPlugSetDefinitionDestinyItemSocketEntryPlugItemRandomizedDefinitionListConverter
            .fromIsar(reader.readStringList(offsets[4]));
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (_destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(reader.readStringOrNull(offset))) as P;
      case 1:
        return (reader.readLongOrNull(offset)) as P;
      case 2:
        return (reader.readBoolOrNull(offset)) as P;
      case 3:
        return (reader.readBoolOrNull(offset)) as P;
      case 4:
        return (_destinyPlugSetDefinitionDestinyItemSocketEntryPlugItemRandomizedDefinitionListConverter
            .fromIsar(reader.readStringList(offset))) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinyPlugSetDefinition object) {}
}

extension DestinyPlugSetDefinitionQueryWhereSort on QueryBuilder<
    DestinyPlugSetDefinition, DestinyPlugSetDefinition, QWhere> {
  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterWhere>
      anyHash() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension DestinyPlugSetDefinitionQueryWhere on QueryBuilder<
    DestinyPlugSetDefinition, DestinyPlugSetDefinition, QWhereClause> {
  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterWhereClause> hashEqualTo(int? hash) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [hash],
      includeLower: true,
      upper: [hash],
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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

extension DestinyPlugSetDefinitionQueryFilter on QueryBuilder<
    DestinyPlugSetDefinition, DestinyPlugSetDefinition, QFilterCondition> {
  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> displayPropertiesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displayProperties',
      value: null,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> displayPropertiesEqualTo(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayProperties',
      value:
          _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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
          _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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
          _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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
          _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> displayPropertiesStartsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displayProperties',
      value:
          _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> displayPropertiesEndsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displayProperties',
      value:
          _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
          QAfterFilterCondition>
      displayPropertiesContains(DestinyDisplayPropertiesDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displayProperties',
      value:
          _destinyPlugSetDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
          QAfterFilterCondition>
      displayPropertiesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displayProperties',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> hashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
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

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> isFakePlugSetIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'isFakePlugSet',
      value: null,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> isFakePlugSetEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isFakePlugSet',
      value: value,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> reusablePlugItemsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'reusablePlugItems',
      value: null,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> reusablePlugItemsAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'reusablePlugItems',
      value: null,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> reusablePlugItemsAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'reusablePlugItems',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> reusablePlugItemsAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'reusablePlugItems',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> reusablePlugItemsAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'reusablePlugItems',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> reusablePlugItemsAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'reusablePlugItems',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> reusablePlugItemsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'reusablePlugItems',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
      QAfterFilterCondition> reusablePlugItemsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'reusablePlugItems',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
          QAfterFilterCondition>
      reusablePlugItemsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'reusablePlugItems',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition,
          QAfterFilterCondition>
      reusablePlugItemsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'reusablePlugItems',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DestinyPlugSetDefinitionQueryLinks on QueryBuilder<
    DestinyPlugSetDefinition, DestinyPlugSetDefinition, QFilterCondition> {}

extension DestinyPlugSetDefinitionQueryWhereSortBy on QueryBuilder<
    DestinyPlugSetDefinition, DestinyPlugSetDefinition, QSortBy> {
  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      sortByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      sortByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      sortByIsFakePlugSet() {
    return addSortByInternal('isFakePlugSet', Sort.asc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      sortByIsFakePlugSetDesc() {
    return addSortByInternal('isFakePlugSet', Sort.desc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }
}

extension DestinyPlugSetDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyPlugSetDefinition, DestinyPlugSetDefinition, QSortThenBy> {
  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      thenByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      thenByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      thenByIsFakePlugSet() {
    return addSortByInternal('isFakePlugSet', Sort.asc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      thenByIsFakePlugSetDesc() {
    return addSortByInternal('isFakePlugSet', Sort.desc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QAfterSortBy>
      thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }
}

extension DestinyPlugSetDefinitionQueryWhereDistinct on QueryBuilder<
    DestinyPlugSetDefinition, DestinyPlugSetDefinition, QDistinct> {
  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QDistinct>
      distinctByDisplayProperties({bool caseSensitive = true}) {
    return addDistinctByInternal('displayProperties',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QDistinct>
      distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QDistinct>
      distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QDistinct>
      distinctByIsFakePlugSet() {
    return addDistinctByInternal('isFakePlugSet');
  }

  QueryBuilder<DestinyPlugSetDefinition, DestinyPlugSetDefinition, QDistinct>
      distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }
}

extension DestinyPlugSetDefinitionQueryProperty on QueryBuilder<
    DestinyPlugSetDefinition, DestinyPlugSetDefinition, QQueryProperty> {
  QueryBuilder<DestinyPlugSetDefinition, DestinyDisplayPropertiesDefinition?,
      QQueryOperations> displayPropertiesProperty() {
    return addPropertyNameInternal('displayProperties');
  }

  QueryBuilder<DestinyPlugSetDefinition, int?, QQueryOperations>
      hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyPlugSetDefinition, int?, QQueryOperations>
      indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinyPlugSetDefinition, bool?, QQueryOperations>
      isFakePlugSetProperty() {
    return addPropertyNameInternal('isFakePlugSet');
  }

  QueryBuilder<DestinyPlugSetDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }

  QueryBuilder<
      DestinyPlugSetDefinition,
      List<DestinyItemSocketEntryPlugItemRandomizedDefinition>?,
      QQueryOperations> reusablePlugItemsProperty() {
    return addPropertyNameInternal('reusablePlugItems');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyPlugSetDefinition _$DestinyPlugSetDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyPlugSetDefinition()
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..reusablePlugItems = (json['reusablePlugItems'] as List<dynamic>?)
          ?.map((e) =>
              DestinyItemSocketEntryPlugItemRandomizedDefinition.fromJson(
                  e as Map<String, dynamic>))
          .toList()
      ..isFakePlugSet = json['isFakePlugSet'] as bool?
      ..hash = json['hash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinyPlugSetDefinitionToJson(
        DestinyPlugSetDefinition instance) =>
    <String, dynamic>{
      'displayProperties': instance.displayProperties,
      'reusablePlugItems': instance.reusablePlugItems,
      'isFakePlugSet': instance.isFakePlugSet,
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
