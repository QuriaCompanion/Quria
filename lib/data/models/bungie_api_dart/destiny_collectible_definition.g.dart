// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_collectible_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetDestinyCollectibleDefinitionCollection on Isar {
  IsarCollection<DestinyCollectibleDefinition>
      get destinyCollectibleDefinitions {
    return getCollection('DestinyCollectibleDefinition');
  }
}

final DestinyCollectibleDefinitionSchema = CollectionSchema(
  name: 'DestinyCollectibleDefinition',
  schema:
      '{"name":"DestinyCollectibleDefinition","idName":"itemHash","properties":[{"name":"hash","type":"Long"},{"name":"index","type":"Long"},{"name":"parentNodeHashes","type":"LongList"},{"name":"presentationNodeType","type":"Long"},{"name":"redacted","type":"Bool"},{"name":"scope","type":"Long"},{"name":"sourceHash","type":"Long"},{"name":"sourceString","type":"String"},{"name":"traitHashes","type":"LongList"},{"name":"traitIds","type":"StringList"}],"indexes":[],"links":[]}',
  nativeAdapter: const _DestinyCollectibleDefinitionNativeAdapter(),
  webAdapter: const _DestinyCollectibleDefinitionWebAdapter(),
  idName: 'itemHash',
  propertyIds: {
    'hash': 0,
    'index': 1,
    'parentNodeHashes': 2,
    'presentationNodeType': 3,
    'redacted': 4,
    'scope': 5,
    'sourceHash': 6,
    'sourceString': 7,
    'traitHashes': 8,
    'traitIds': 9
  },
  listProperties: {'parentNodeHashes', 'traitHashes', 'traitIds'},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.itemHash == Isar.autoIncrement) {
      return null;
    } else {
      return obj.itemHash;
    }
  },
  setId: (obj, id) => obj.itemHash = id,
  getLinks: (obj) => [],
  version: 2,
);

const _destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter =
    DestinyPresentationNodeTypeConverter();
const _destinyCollectibleDefinitionDestinyScopeConverter =
    DestinyScopeConverter();

class _DestinyCollectibleDefinitionWebAdapter
    extends IsarWebTypeAdapter<DestinyCollectibleDefinition> {
  const _DestinyCollectibleDefinitionWebAdapter();

  @override
  Object serialize(IsarCollection<DestinyCollectibleDefinition> collection,
      DestinyCollectibleDefinition object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
    IsarNative.jsObjectSet(jsObj, 'index', object.index);
    IsarNative.jsObjectSet(jsObj, 'itemHash', object.itemHash);
    IsarNative.jsObjectSet(jsObj, 'parentNodeHashes', object.parentNodeHashes);
    IsarNative.jsObjectSet(
        jsObj,
        'presentationNodeType',
        _destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
            .toIsar(object.presentationNodeType));
    IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
    IsarNative.jsObjectSet(
        jsObj,
        'scope',
        _destinyCollectibleDefinitionDestinyScopeConverter
            .toIsar(object.scope));
    IsarNative.jsObjectSet(jsObj, 'sourceHash', object.sourceHash);
    IsarNative.jsObjectSet(jsObj, 'sourceString', object.sourceString);
    IsarNative.jsObjectSet(jsObj, 'traitHashes', object.traitHashes);
    IsarNative.jsObjectSet(jsObj, 'traitIds', object.traitIds);
    return jsObj;
  }

  @override
  DestinyCollectibleDefinition deserialize(
      IsarCollection<DestinyCollectibleDefinition> collection, dynamic jsObj) {
    final object = DestinyCollectibleDefinition();
    object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
    object.index = IsarNative.jsObjectGet(jsObj, 'index');
    object.itemHash = IsarNative.jsObjectGet(jsObj, 'itemHash');
    object.parentNodeHashes =
        (IsarNative.jsObjectGet(jsObj, 'parentNodeHashes') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>();
    object.presentationNodeType =
        _destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'presentationNodeType'));
    object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
    object.scope = _destinyCollectibleDefinitionDestinyScopeConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'scope'));
    object.sourceHash = IsarNative.jsObjectGet(jsObj, 'sourceHash');
    object.sourceString = IsarNative.jsObjectGet(jsObj, 'sourceString');
    object.traitHashes = (IsarNative.jsObjectGet(jsObj, 'traitHashes') as List?)
        ?.map((e) => e ?? double.negativeInfinity)
        .toList()
        .cast<int>();
    object.traitIds = (IsarNative.jsObjectGet(jsObj, 'traitIds') as List?)
        ?.map((e) => e ?? '')
        .toList()
        .cast<String>();
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'hash':
        return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
      case 'index':
        return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
      case 'itemHash':
        return (IsarNative.jsObjectGet(jsObj, 'itemHash')) as P;
      case 'parentNodeHashes':
        return ((IsarNative.jsObjectGet(jsObj, 'parentNodeHashes') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>()) as P;
      case 'presentationNodeType':
        return (_destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(
                IsarNative.jsObjectGet(jsObj, 'presentationNodeType'))) as P;
      case 'redacted':
        return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
      case 'scope':
        return (_destinyCollectibleDefinitionDestinyScopeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'scope'))) as P;
      case 'sourceHash':
        return (IsarNative.jsObjectGet(jsObj, 'sourceHash')) as P;
      case 'sourceString':
        return (IsarNative.jsObjectGet(jsObj, 'sourceString')) as P;
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
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinyCollectibleDefinition object) {}
}

class _DestinyCollectibleDefinitionNativeAdapter
    extends IsarNativeTypeAdapter<DestinyCollectibleDefinition> {
  const _DestinyCollectibleDefinitionNativeAdapter();

  @override
  void serialize(
      IsarCollection<DestinyCollectibleDefinition> collection,
      IsarRawObject rawObj,
      DestinyCollectibleDefinition object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.hash;
    final _hash = value0;
    final value1 = object.index;
    final _index = value1;
    final value2 = object.parentNodeHashes;
    dynamicSize += (value2?.length ?? 0) * 8;
    final _parentNodeHashes = value2;
    final value3 =
        _destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
            .toIsar(object.presentationNodeType);
    final _presentationNodeType = value3;
    final value4 = object.redacted;
    final _redacted = value4;
    final value5 =
        _destinyCollectibleDefinitionDestinyScopeConverter.toIsar(object.scope);
    final _scope = value5;
    final value6 = object.sourceHash;
    final _sourceHash = value6;
    final value7 = object.sourceString;
    IsarUint8List? _sourceString;
    if (value7 != null) {
      _sourceString = IsarBinaryWriter.utf8Encoder.convert(value7);
    }
    dynamicSize += (_sourceString?.length ?? 0) as int;
    final value8 = object.traitHashes;
    dynamicSize += (value8?.length ?? 0) * 8;
    final _traitHashes = value8;
    final value9 = object.traitIds;
    dynamicSize += (value9?.length ?? 0) * 8;
    List<IsarUint8List?>? bytesList9;
    if (value9 != null) {
      bytesList9 = [];
      for (var str in value9) {
        final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
        bytesList9.add(bytes);
        dynamicSize += bytes.length as int;
      }
    }
    final _traitIds = bytesList9;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _hash);
    writer.writeLong(offsets[1], _index);
    writer.writeLongList(offsets[2], _parentNodeHashes);
    writer.writeLong(offsets[3], _presentationNodeType);
    writer.writeBool(offsets[4], _redacted);
    writer.writeLong(offsets[5], _scope);
    writer.writeLong(offsets[6], _sourceHash);
    writer.writeBytes(offsets[7], _sourceString);
    writer.writeLongList(offsets[8], _traitHashes);
    writer.writeStringList(offsets[9], _traitIds);
  }

  @override
  DestinyCollectibleDefinition deserialize(
      IsarCollection<DestinyCollectibleDefinition> collection,
      int id,
      IsarBinaryReader reader,
      List<int> offsets) {
    final object = DestinyCollectibleDefinition();
    object.hash = reader.readLongOrNull(offsets[0]);
    object.index = reader.readLongOrNull(offsets[1]);
    object.itemHash = id;
    object.parentNodeHashes = reader.readLongList(offsets[2]);
    object.presentationNodeType =
        _destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(reader.readLongOrNull(offsets[3]));
    object.redacted = reader.readBoolOrNull(offsets[4]);
    object.scope = _destinyCollectibleDefinitionDestinyScopeConverter
        .fromIsar(reader.readLongOrNull(offsets[5]));
    object.sourceHash = reader.readLongOrNull(offsets[6]);
    object.sourceString = reader.readStringOrNull(offsets[7]);
    object.traitHashes = reader.readLongList(offsets[8]);
    object.traitIds = reader.readStringList(offsets[9]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readLongOrNull(offset)) as P;
      case 1:
        return (reader.readLongOrNull(offset)) as P;
      case 2:
        return (reader.readLongList(offset)) as P;
      case 3:
        return (_destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 4:
        return (reader.readBoolOrNull(offset)) as P;
      case 5:
        return (_destinyCollectibleDefinitionDestinyScopeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 6:
        return (reader.readLongOrNull(offset)) as P;
      case 7:
        return (reader.readStringOrNull(offset)) as P;
      case 8:
        return (reader.readLongList(offset)) as P;
      case 9:
        return (reader.readStringList(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, DestinyCollectibleDefinition object) {}
}

extension DestinyCollectibleDefinitionQueryWhereSort on QueryBuilder<
    DestinyCollectibleDefinition, DestinyCollectibleDefinition, QWhere> {
  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterWhere> anyItemHash() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension DestinyCollectibleDefinitionQueryWhere on QueryBuilder<
    DestinyCollectibleDefinition, DestinyCollectibleDefinition, QWhereClause> {
  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterWhereClause> itemHashEqualTo(int? itemHash) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [itemHash],
      includeLower: true,
      upper: [itemHash],
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterWhereClause> itemHashNotEqualTo(int? itemHash) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [itemHash],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [itemHash],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [itemHash],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [itemHash],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterWhereClause> itemHashGreaterThan(
    int? itemHash, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [itemHash],
      includeLower: include,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterWhereClause> itemHashLessThan(
    int? itemHash, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [itemHash],
      includeUpper: include,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterWhereClause> itemHashBetween(
    int? lowerItemHash,
    int? upperItemHash, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerItemHash],
      includeLower: includeLower,
      upper: [upperItemHash],
      includeUpper: includeUpper,
    ));
  }
}

extension DestinyCollectibleDefinitionQueryFilter on QueryBuilder<
    DestinyCollectibleDefinition,
    DestinyCollectibleDefinition,
    QFilterCondition> {
  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> hashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> itemHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'itemHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> itemHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'itemHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> itemHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'itemHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> itemHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'itemHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> itemHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'itemHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> parentNodeHashesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'parentNodeHashes',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> parentNodeHashesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'parentNodeHashes',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> parentNodeHashesAnyEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'parentNodeHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> parentNodeHashesAnyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'parentNodeHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> parentNodeHashesAnyLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'parentNodeHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> parentNodeHashesAnyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'parentNodeHashes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> presentationNodeTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'presentationNodeType',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
          QAfterFilterCondition>
      presentationNodeTypeEqualTo(DestinyPresentationNodeType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'presentationNodeType',
      value: _destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> presentationNodeTypeGreaterThan(
    DestinyPresentationNodeType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'presentationNodeType',
      value: _destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> presentationNodeTypeLessThan(
    DestinyPresentationNodeType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'presentationNodeType',
      value: _destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> presentationNodeTypeBetween(
    DestinyPresentationNodeType? lower,
    DestinyPresentationNodeType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'presentationNodeType',
      lower: _destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
          .toIsar(lower),
      includeLower: includeLower,
      upper: _destinyCollectibleDefinitionDestinyPresentationNodeTypeConverter
          .toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> scopeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'scope',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> scopeEqualTo(DestinyScope? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'scope',
      value: _destinyCollectibleDefinitionDestinyScopeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> scopeGreaterThan(
    DestinyScope? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'scope',
      value: _destinyCollectibleDefinitionDestinyScopeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> scopeLessThan(
    DestinyScope? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'scope',
      value: _destinyCollectibleDefinitionDestinyScopeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> scopeBetween(
    DestinyScope? lower,
    DestinyScope? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'scope',
      lower: _destinyCollectibleDefinitionDestinyScopeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _destinyCollectibleDefinitionDestinyScopeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'sourceHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sourceHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sourceHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sourceHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sourceHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceStringIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'sourceString',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceStringEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sourceString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceStringGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sourceString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceStringLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sourceString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceStringBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sourceString',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sourceString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> sourceStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sourceString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
          QAfterFilterCondition>
      sourceStringContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sourceString',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
          QAfterFilterCondition>
      sourceStringMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sourceString',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> traitHashesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'traitHashes',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> traitHashesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitHashes',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> traitHashesAnyEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitHashes',
      value: value,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> traitIdsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'traitIds',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterFilterCondition> traitIdsAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitIds',
      value: null,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
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

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
          QAfterFilterCondition>
      traitIdsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'traitIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
          QAfterFilterCondition>
      traitIdsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'traitIds',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DestinyCollectibleDefinitionQueryLinks on QueryBuilder<
    DestinyCollectibleDefinition,
    DestinyCollectibleDefinition,
    QFilterCondition> {}

extension DestinyCollectibleDefinitionQueryWhereSortBy on QueryBuilder<
    DestinyCollectibleDefinition, DestinyCollectibleDefinition, QSortBy> {
  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByItemHash() {
    return addSortByInternal('itemHash', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByItemHashDesc() {
    return addSortByInternal('itemHash', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByPresentationNodeType() {
    return addSortByInternal('presentationNodeType', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByPresentationNodeTypeDesc() {
    return addSortByInternal('presentationNodeType', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByScope() {
    return addSortByInternal('scope', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortByScopeDesc() {
    return addSortByInternal('scope', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortBySourceHash() {
    return addSortByInternal('sourceHash', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortBySourceHashDesc() {
    return addSortByInternal('sourceHash', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortBySourceString() {
    return addSortByInternal('sourceString', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> sortBySourceStringDesc() {
    return addSortByInternal('sourceString', Sort.desc);
  }
}

extension DestinyCollectibleDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyCollectibleDefinition, DestinyCollectibleDefinition, QSortThenBy> {
  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByItemHash() {
    return addSortByInternal('itemHash', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByItemHashDesc() {
    return addSortByInternal('itemHash', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByPresentationNodeType() {
    return addSortByInternal('presentationNodeType', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByPresentationNodeTypeDesc() {
    return addSortByInternal('presentationNodeType', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByScope() {
    return addSortByInternal('scope', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenByScopeDesc() {
    return addSortByInternal('scope', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenBySourceHash() {
    return addSortByInternal('sourceHash', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenBySourceHashDesc() {
    return addSortByInternal('sourceHash', Sort.desc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenBySourceString() {
    return addSortByInternal('sourceString', Sort.asc);
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QAfterSortBy> thenBySourceStringDesc() {
    return addSortByInternal('sourceString', Sort.desc);
  }
}

extension DestinyCollectibleDefinitionQueryWhereDistinct on QueryBuilder<
    DestinyCollectibleDefinition, DestinyCollectibleDefinition, QDistinct> {
  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QDistinct> distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QDistinct> distinctByItemHash() {
    return addDistinctByInternal('itemHash');
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QDistinct> distinctByPresentationNodeType() {
    return addDistinctByInternal('presentationNodeType');
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QDistinct> distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QDistinct> distinctByScope() {
    return addDistinctByInternal('scope');
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QDistinct> distinctBySourceHash() {
    return addDistinctByInternal('sourceHash');
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyCollectibleDefinition,
      QDistinct> distinctBySourceString({bool caseSensitive = true}) {
    return addDistinctByInternal('sourceString', caseSensitive: caseSensitive);
  }
}

extension DestinyCollectibleDefinitionQueryProperty on QueryBuilder<
    DestinyCollectibleDefinition,
    DestinyCollectibleDefinition,
    QQueryProperty> {
  QueryBuilder<DestinyCollectibleDefinition, int?, QQueryOperations>
      hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyCollectibleDefinition, int?, QQueryOperations>
      indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinyCollectibleDefinition, int?, QQueryOperations>
      itemHashProperty() {
    return addPropertyNameInternal('itemHash');
  }

  QueryBuilder<DestinyCollectibleDefinition, List<int>?, QQueryOperations>
      parentNodeHashesProperty() {
    return addPropertyNameInternal('parentNodeHashes');
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyPresentationNodeType?,
      QQueryOperations> presentationNodeTypeProperty() {
    return addPropertyNameInternal('presentationNodeType');
  }

  QueryBuilder<DestinyCollectibleDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }

  QueryBuilder<DestinyCollectibleDefinition, DestinyScope?, QQueryOperations>
      scopeProperty() {
    return addPropertyNameInternal('scope');
  }

  QueryBuilder<DestinyCollectibleDefinition, int?, QQueryOperations>
      sourceHashProperty() {
    return addPropertyNameInternal('sourceHash');
  }

  QueryBuilder<DestinyCollectibleDefinition, String?, QQueryOperations>
      sourceStringProperty() {
    return addPropertyNameInternal('sourceString');
  }

  QueryBuilder<DestinyCollectibleDefinition, List<int>?, QQueryOperations>
      traitHashesProperty() {
    return addPropertyNameInternal('traitHashes');
  }

  QueryBuilder<DestinyCollectibleDefinition, List<String>?, QQueryOperations>
      traitIdsProperty() {
    return addPropertyNameInternal('traitIds');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyCollectibleDefinition _$DestinyCollectibleDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyCollectibleDefinition()
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..scope = decodeDestinyScope(json['scope'])
      ..sourceString = json['sourceString'] as String?
      ..sourceHash = json['sourceHash'] as int?
      ..itemHash = json['itemHash'] as int?
      ..acquisitionInfo = json['acquisitionInfo'] == null
          ? null
          : DestinyCollectibleAcquisitionBlock.fromJson(
              json['acquisitionInfo'] as Map<String, dynamic>)
      ..stateInfo = json['stateInfo'] == null
          ? null
          : DestinyCollectibleStateBlock.fromJson(
              json['stateInfo'] as Map<String, dynamic>)
      ..presentationInfo = json['presentationInfo'] == null
          ? null
          : DestinyPresentationChildBlock.fromJson(
              json['presentationInfo'] as Map<String, dynamic>)
      ..presentationNodeType =
          decodeDestinyPresentationNodeType(json['presentationNodeType'])
      ..traitIds =
          (json['traitIds'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..traitHashes =
          (json['traitHashes'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..parentNodeHashes = (json['parentNodeHashes'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList()
      ..hash = json['hash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinyCollectibleDefinitionToJson(
        DestinyCollectibleDefinition instance) =>
    <String, dynamic>{
      'displayProperties': instance.displayProperties,
      'scope': encodeDestinyScope(instance.scope),
      'sourceString': instance.sourceString,
      'sourceHash': instance.sourceHash,
      'itemHash': instance.itemHash,
      'acquisitionInfo': instance.acquisitionInfo,
      'stateInfo': instance.stateInfo,
      'presentationInfo': instance.presentationInfo,
      'presentationNodeType':
          encodeDestinyPresentationNodeType(instance.presentationNodeType),
      'traitIds': instance.traitIds,
      'traitHashes': instance.traitHashes,
      'parentNodeHashes': instance.parentNodeHashes,
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
