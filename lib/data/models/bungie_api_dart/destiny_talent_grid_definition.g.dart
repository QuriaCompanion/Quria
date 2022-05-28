// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_talent_grid_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers

extension GetDestinyTalentGridDefinitionCollection on Isar {
  IsarCollection<DestinyTalentGridDefinition>
      get destinyTalentGridDefinitions => getCollection();
}

const DestinyTalentGridDefinitionSchema = CollectionSchema(
  name: 'DestinyTalentGridDefinition',
  schema:
      '{"name":"DestinyTalentGridDefinition","idName":"hash","properties":[{"name":"exclusiveSets","type":"StringList"},{"name":"gridLevelPerColumn","type":"Long"},{"name":"groups","type":"String"},{"name":"independentNodeIndexes","type":"LongList"},{"name":"index","type":"Long"},{"name":"maxGridLevel","type":"Long"},{"name":"nodeCategories","type":"StringList"},{"name":"nodes","type":"StringList"},{"name":"progressionHash","type":"Long"},{"name":"redacted","type":"Bool"}],"indexes":[],"links":[]}',
  idName: 'hash',
  propertyIds: {
    'exclusiveSets': 0,
    'gridLevelPerColumn': 1,
    'groups': 2,
    'independentNodeIndexes': 3,
    'index': 4,
    'maxGridLevel': 5,
    'nodeCategories': 6,
    'nodes': 7,
    'progressionHash': 8,
    'redacted': 9
  },
  listProperties: {
    'exclusiveSets',
    'independentNodeIndexes',
    'nodeCategories',
    'nodes'
  },
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _destinyTalentGridDefinitionGetId,
  setId: _destinyTalentGridDefinitionSetId,
  getLinks: _destinyTalentGridDefinitionGetLinks,
  attachLinks: _destinyTalentGridDefinitionAttachLinks,
  serializeNative: _destinyTalentGridDefinitionSerializeNative,
  deserializeNative: _destinyTalentGridDefinitionDeserializeNative,
  deserializePropNative: _destinyTalentGridDefinitionDeserializePropNative,
  serializeWeb: _destinyTalentGridDefinitionSerializeWeb,
  deserializeWeb: _destinyTalentGridDefinitionDeserializeWeb,
  deserializePropWeb: _destinyTalentGridDefinitionDeserializePropWeb,
  version: 4,
);

int? _destinyTalentGridDefinitionGetId(DestinyTalentGridDefinition object) {
  if (object.hash == Isar.autoIncrement) {
    return null;
  } else {
    return object.hash;
  }
}

void _destinyTalentGridDefinitionSetId(
    DestinyTalentGridDefinition object, int id) {
  object.hash = id;
}

List<IsarLinkBase> _destinyTalentGridDefinitionGetLinks(
    DestinyTalentGridDefinition object) {
  return [];
}

const _destinyTalentGridDefinitionDestinyTalentNodeExclusiveSetDefinitionListConverter =
    DestinyTalentNodeExclusiveSetDefinitionListConverter();
const _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter =
    DestinyTalentExclusiveGroupMapConverter();
const _destinyTalentGridDefinitionDestinyTalentNodeCategoryListConverter =
    DestinyTalentNodeCategoryListConverter();
const _destinyTalentGridDefinitionDestinyTalentNodeDefinitionListConverter =
    DestinyTalentNodeDefinitionListConverter();

void _destinyTalentGridDefinitionSerializeNative(
    IsarCollection<DestinyTalentGridDefinition> collection,
    IsarCObject cObj,
    DestinyTalentGridDefinition object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 =
      _destinyTalentGridDefinitionDestinyTalentNodeExclusiveSetDefinitionListConverter
          .toIsar(object.exclusiveSets);
  dynamicSize += (value0?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList0;
  if (value0 != null) {
    bytesList0 = [];
    for (var str in value0) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList0.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _exclusiveSets = bytesList0;
  final value1 = object.gridLevelPerColumn;
  final _gridLevelPerColumn = value1;
  final value2 =
      _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .toIsar(object.groups);
  IsarUint8List? _groups;
  if (value2 != null) {
    _groups = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_groups?.length ?? 0) as int;
  final value3 = object.independentNodeIndexes;
  dynamicSize += (value3?.length ?? 0) * 8;
  final _independentNodeIndexes = value3;
  final value4 = object.index;
  final _index = value4;
  final value5 = object.maxGridLevel;
  final _maxGridLevel = value5;
  final value6 =
      _destinyTalentGridDefinitionDestinyTalentNodeCategoryListConverter
          .toIsar(object.nodeCategories);
  dynamicSize += (value6?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList6;
  if (value6 != null) {
    bytesList6 = [];
    for (var str in value6) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList6.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _nodeCategories = bytesList6;
  final value7 =
      _destinyTalentGridDefinitionDestinyTalentNodeDefinitionListConverter
          .toIsar(object.nodes);
  dynamicSize += (value7?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList7;
  if (value7 != null) {
    bytesList7 = [];
    for (var str in value7) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList7.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _nodes = bytesList7;
  final value8 = object.progressionHash;
  final _progressionHash = value8;
  final value9 = object.redacted;
  final _redacted = value9;
  final size = staticSize + dynamicSize;

  cObj.buffer = alloc(size);
  cObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeStringList(offsets[0], _exclusiveSets);
  writer.writeLong(offsets[1], _gridLevelPerColumn);
  writer.writeBytes(offsets[2], _groups);
  writer.writeLongList(offsets[3], _independentNodeIndexes);
  writer.writeLong(offsets[4], _index);
  writer.writeLong(offsets[5], _maxGridLevel);
  writer.writeStringList(offsets[6], _nodeCategories);
  writer.writeStringList(offsets[7], _nodes);
  writer.writeLong(offsets[8], _progressionHash);
  writer.writeBool(offsets[9], _redacted);
}

DestinyTalentGridDefinition _destinyTalentGridDefinitionDeserializeNative(
    IsarCollection<DestinyTalentGridDefinition> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = DestinyTalentGridDefinition();
  object.exclusiveSets =
      _destinyTalentGridDefinitionDestinyTalentNodeExclusiveSetDefinitionListConverter
          .fromIsar(reader.readStringList(offsets[0]));
  object.gridLevelPerColumn = reader.readLongOrNull(offsets[1]);
  object.groups =
      _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .fromIsar(reader.readStringOrNull(offsets[2]));
  object.hash = id;
  object.independentNodeIndexes = reader.readLongList(offsets[3]);
  object.index = reader.readLongOrNull(offsets[4]);
  object.maxGridLevel = reader.readLongOrNull(offsets[5]);
  object.nodeCategories =
      _destinyTalentGridDefinitionDestinyTalentNodeCategoryListConverter
          .fromIsar(reader.readStringList(offsets[6]));
  object.nodes =
      _destinyTalentGridDefinitionDestinyTalentNodeDefinitionListConverter
          .fromIsar(reader.readStringList(offsets[7]));
  object.progressionHash = reader.readLongOrNull(offsets[8]);
  object.redacted = reader.readBoolOrNull(offsets[9]);
  return object;
}

P _destinyTalentGridDefinitionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (_destinyTalentGridDefinitionDestinyTalentNodeExclusiveSetDefinitionListConverter
          .fromIsar(reader.readStringList(offset))) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (_destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 3:
      return (reader.readLongList(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (_destinyTalentGridDefinitionDestinyTalentNodeCategoryListConverter
          .fromIsar(reader.readStringList(offset))) as P;
    case 7:
      return (_destinyTalentGridDefinitionDestinyTalentNodeDefinitionListConverter
          .fromIsar(reader.readStringList(offset))) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _destinyTalentGridDefinitionSerializeWeb(
    IsarCollection<DestinyTalentGridDefinition> collection,
    DestinyTalentGridDefinition object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj,
      'exclusiveSets',
      _destinyTalentGridDefinitionDestinyTalentNodeExclusiveSetDefinitionListConverter
          .toIsar(object.exclusiveSets));
  IsarNative.jsObjectSet(
      jsObj, 'gridLevelPerColumn', object.gridLevelPerColumn);
  IsarNative.jsObjectSet(
      jsObj,
      'groups',
      _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .toIsar(object.groups));
  IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
  IsarNative.jsObjectSet(
      jsObj, 'independentNodeIndexes', object.independentNodeIndexes);
  IsarNative.jsObjectSet(jsObj, 'index', object.index);
  IsarNative.jsObjectSet(jsObj, 'maxGridLevel', object.maxGridLevel);
  IsarNative.jsObjectSet(
      jsObj,
      'nodeCategories',
      _destinyTalentGridDefinitionDestinyTalentNodeCategoryListConverter
          .toIsar(object.nodeCategories));
  IsarNative.jsObjectSet(
      jsObj,
      'nodes',
      _destinyTalentGridDefinitionDestinyTalentNodeDefinitionListConverter
          .toIsar(object.nodes));
  IsarNative.jsObjectSet(jsObj, 'progressionHash', object.progressionHash);
  IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
  return jsObj;
}

DestinyTalentGridDefinition _destinyTalentGridDefinitionDeserializeWeb(
    IsarCollection<DestinyTalentGridDefinition> collection, dynamic jsObj) {
  final object = DestinyTalentGridDefinition();
  object.exclusiveSets =
      _destinyTalentGridDefinitionDestinyTalentNodeExclusiveSetDefinitionListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'exclusiveSets') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>());
  object.gridLevelPerColumn =
      IsarNative.jsObjectGet(jsObj, 'gridLevelPerColumn');
  object.groups =
      _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'groups'));
  object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
  object.independentNodeIndexes =
      (IsarNative.jsObjectGet(jsObj, 'independentNodeIndexes') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<int>();
  object.index = IsarNative.jsObjectGet(jsObj, 'index');
  object.maxGridLevel = IsarNative.jsObjectGet(jsObj, 'maxGridLevel');
  object.nodeCategories =
      _destinyTalentGridDefinitionDestinyTalentNodeCategoryListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'nodeCategories') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>());
  object.nodes =
      _destinyTalentGridDefinitionDestinyTalentNodeDefinitionListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'nodes') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>());
  object.progressionHash = IsarNative.jsObjectGet(jsObj, 'progressionHash');
  object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
  return object;
}

P _destinyTalentGridDefinitionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'exclusiveSets':
      return (_destinyTalentGridDefinitionDestinyTalentNodeExclusiveSetDefinitionListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'exclusiveSets') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>())) as P;
    case 'gridLevelPerColumn':
      return (IsarNative.jsObjectGet(jsObj, 'gridLevelPerColumn')) as P;
    case 'groups':
      return (_destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'groups'))) as P;
    case 'hash':
      return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
    case 'independentNodeIndexes':
      return ((IsarNative.jsObjectGet(jsObj, 'independentNodeIndexes') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<int>()) as P;
    case 'index':
      return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
    case 'maxGridLevel':
      return (IsarNative.jsObjectGet(jsObj, 'maxGridLevel')) as P;
    case 'nodeCategories':
      return (_destinyTalentGridDefinitionDestinyTalentNodeCategoryListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'nodeCategories') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>())) as P;
    case 'nodes':
      return (_destinyTalentGridDefinitionDestinyTalentNodeDefinitionListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'nodes') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>())) as P;
    case 'progressionHash':
      return (IsarNative.jsObjectGet(jsObj, 'progressionHash')) as P;
    case 'redacted':
      return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _destinyTalentGridDefinitionAttachLinks(
    IsarCollection col, int id, DestinyTalentGridDefinition object) {}

extension DestinyTalentGridDefinitionQueryWhereSort on QueryBuilder<
    DestinyTalentGridDefinition, DestinyTalentGridDefinition, QWhere> {
  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterWhere> anyHash() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DestinyTalentGridDefinitionQueryWhere on QueryBuilder<
    DestinyTalentGridDefinition, DestinyTalentGridDefinition, QWhereClause> {
  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterWhereClause> hashEqualTo(int hash) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: hash,
      includeLower: true,
      upper: hash,
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
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

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterWhereClause> hashGreaterThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: hash, includeLower: include),
    );
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterWhereClause> hashLessThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: hash, includeUpper: include),
    );
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
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

extension DestinyTalentGridDefinitionQueryFilter on QueryBuilder<
    DestinyTalentGridDefinition,
    DestinyTalentGridDefinition,
    QFilterCondition> {
  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> exclusiveSetsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'exclusiveSets',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> exclusiveSetsAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'exclusiveSets',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> exclusiveSetsAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'exclusiveSets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> exclusiveSetsAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'exclusiveSets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> exclusiveSetsAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'exclusiveSets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> exclusiveSetsAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'exclusiveSets',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> exclusiveSetsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'exclusiveSets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> exclusiveSetsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'exclusiveSets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
          QAfterFilterCondition>
      exclusiveSetsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'exclusiveSets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
          QAfterFilterCondition>
      exclusiveSetsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'exclusiveSets',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> gridLevelPerColumnIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'gridLevelPerColumn',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> gridLevelPerColumnEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'gridLevelPerColumn',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> gridLevelPerColumnGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'gridLevelPerColumn',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> gridLevelPerColumnLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'gridLevelPerColumn',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> gridLevelPerColumnBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'gridLevelPerColumn',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> groupsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'groups',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> groupsEqualTo(
    Map<String, DestinyTalentExclusiveGroup>? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'groups',
      value: _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> groupsGreaterThan(
    Map<String, DestinyTalentExclusiveGroup>? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'groups',
      value: _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> groupsLessThan(
    Map<String, DestinyTalentExclusiveGroup>? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'groups',
      value: _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> groupsBetween(
    Map<String, DestinyTalentExclusiveGroup>? lower,
    Map<String, DestinyTalentExclusiveGroup>? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'groups',
      lower: _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .toIsar(lower),
      includeLower: includeLower,
      upper: _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> groupsStartsWith(
    Map<String, DestinyTalentExclusiveGroup> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'groups',
      value: _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> groupsEndsWith(
    Map<String, DestinyTalentExclusiveGroup> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'groups',
      value: _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
          QAfterFilterCondition>
      groupsContains(Map<String, DestinyTalentExclusiveGroup> value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'groups',
      value: _destinyTalentGridDefinitionDestinyTalentExclusiveGroupMapConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
          QAfterFilterCondition>
      groupsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'groups',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> hashEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
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

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
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

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
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

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> independentNodeIndexesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'independentNodeIndexes',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> independentNodeIndexesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'independentNodeIndexes',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> independentNodeIndexesAnyEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'independentNodeIndexes',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> independentNodeIndexesAnyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'independentNodeIndexes',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> independentNodeIndexesAnyLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'independentNodeIndexes',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> independentNodeIndexesAnyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'independentNodeIndexes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
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

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
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

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
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

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> maxGridLevelIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'maxGridLevel',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> maxGridLevelEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'maxGridLevel',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> maxGridLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'maxGridLevel',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> maxGridLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'maxGridLevel',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> maxGridLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'maxGridLevel',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodeCategoriesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nodeCategories',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodeCategoriesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nodeCategories',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodeCategoriesAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nodeCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodeCategoriesAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nodeCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodeCategoriesAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nodeCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodeCategoriesAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nodeCategories',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodeCategoriesAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'nodeCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodeCategoriesAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'nodeCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
          QAfterFilterCondition>
      nodeCategoriesAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'nodeCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
          QAfterFilterCondition>
      nodeCategoriesAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'nodeCategories',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nodes',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nodes',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodesAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nodes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodesAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nodes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodesAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nodes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodesAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nodes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodesAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'nodes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> nodesAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'nodes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
          QAfterFilterCondition>
      nodesAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'nodes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
          QAfterFilterCondition>
      nodesAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'nodes',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> progressionHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'progressionHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> progressionHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'progressionHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> progressionHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'progressionHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> progressionHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'progressionHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> progressionHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'progressionHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }
}

extension DestinyTalentGridDefinitionQueryLinks on QueryBuilder<
    DestinyTalentGridDefinition,
    DestinyTalentGridDefinition,
    QFilterCondition> {}

extension DestinyTalentGridDefinitionQueryWhereSortBy on QueryBuilder<
    DestinyTalentGridDefinition, DestinyTalentGridDefinition, QSortBy> {
  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByGridLevelPerColumn() {
    return addSortByInternal('gridLevelPerColumn', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByGridLevelPerColumnDesc() {
    return addSortByInternal('gridLevelPerColumn', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByGroups() {
    return addSortByInternal('groups', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByGroupsDesc() {
    return addSortByInternal('groups', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByMaxGridLevel() {
    return addSortByInternal('maxGridLevel', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByMaxGridLevelDesc() {
    return addSortByInternal('maxGridLevel', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByProgressionHash() {
    return addSortByInternal('progressionHash', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByProgressionHashDesc() {
    return addSortByInternal('progressionHash', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }
}

extension DestinyTalentGridDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyTalentGridDefinition, DestinyTalentGridDefinition, QSortThenBy> {
  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByGridLevelPerColumn() {
    return addSortByInternal('gridLevelPerColumn', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByGridLevelPerColumnDesc() {
    return addSortByInternal('gridLevelPerColumn', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByGroups() {
    return addSortByInternal('groups', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByGroupsDesc() {
    return addSortByInternal('groups', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByMaxGridLevel() {
    return addSortByInternal('maxGridLevel', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByMaxGridLevelDesc() {
    return addSortByInternal('maxGridLevel', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByProgressionHash() {
    return addSortByInternal('progressionHash', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByProgressionHashDesc() {
    return addSortByInternal('progressionHash', Sort.desc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QAfterSortBy> thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }
}

extension DestinyTalentGridDefinitionQueryWhereDistinct on QueryBuilder<
    DestinyTalentGridDefinition, DestinyTalentGridDefinition, QDistinct> {
  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QDistinct> distinctByGridLevelPerColumn() {
    return addDistinctByInternal('gridLevelPerColumn');
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QDistinct> distinctByGroups({bool caseSensitive = true}) {
    return addDistinctByInternal('groups', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QDistinct> distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QDistinct> distinctByMaxGridLevel() {
    return addDistinctByInternal('maxGridLevel');
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QDistinct> distinctByProgressionHash() {
    return addDistinctByInternal('progressionHash');
  }

  QueryBuilder<DestinyTalentGridDefinition, DestinyTalentGridDefinition,
      QDistinct> distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }
}

extension DestinyTalentGridDefinitionQueryProperty on QueryBuilder<
    DestinyTalentGridDefinition, DestinyTalentGridDefinition, QQueryProperty> {
  QueryBuilder<
      DestinyTalentGridDefinition,
      List<DestinyTalentNodeExclusiveSetDefinition>?,
      QQueryOperations> exclusiveSetsProperty() {
    return addPropertyNameInternal('exclusiveSets');
  }

  QueryBuilder<DestinyTalentGridDefinition, int?, QQueryOperations>
      gridLevelPerColumnProperty() {
    return addPropertyNameInternal('gridLevelPerColumn');
  }

  QueryBuilder<
      DestinyTalentGridDefinition,
      Map<String, DestinyTalentExclusiveGroup>?,
      QQueryOperations> groupsProperty() {
    return addPropertyNameInternal('groups');
  }

  QueryBuilder<DestinyTalentGridDefinition, int?, QQueryOperations>
      hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyTalentGridDefinition, List<int>?, QQueryOperations>
      independentNodeIndexesProperty() {
    return addPropertyNameInternal('independentNodeIndexes');
  }

  QueryBuilder<DestinyTalentGridDefinition, int?, QQueryOperations>
      indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinyTalentGridDefinition, int?, QQueryOperations>
      maxGridLevelProperty() {
    return addPropertyNameInternal('maxGridLevel');
  }

  QueryBuilder<DestinyTalentGridDefinition, List<DestinyTalentNodeCategory>?,
      QQueryOperations> nodeCategoriesProperty() {
    return addPropertyNameInternal('nodeCategories');
  }

  QueryBuilder<DestinyTalentGridDefinition, List<DestinyTalentNodeDefinition>?,
      QQueryOperations> nodesProperty() {
    return addPropertyNameInternal('nodes');
  }

  QueryBuilder<DestinyTalentGridDefinition, int?, QQueryOperations>
      progressionHashProperty() {
    return addPropertyNameInternal('progressionHash');
  }

  QueryBuilder<DestinyTalentGridDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyTalentGridDefinition _$DestinyTalentGridDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyTalentGridDefinition()
      ..maxGridLevel = json['maxGridLevel'] as int?
      ..gridLevelPerColumn = json['gridLevelPerColumn'] as int?
      ..progressionHash = json['progressionHash'] as int?
      ..nodes = (json['nodes'] as List<dynamic>?)
          ?.map((e) =>
              DestinyTalentNodeDefinition.fromJson(e as Map<String, dynamic>))
          .toList()
      ..exclusiveSets = (json['exclusiveSets'] as List<dynamic>?)
          ?.map((e) => DestinyTalentNodeExclusiveSetDefinition.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..independentNodeIndexes =
          (json['independentNodeIndexes'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..groups = (json['groups'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, DestinyTalentExclusiveGroup.fromJson(e as Map<String, dynamic>)),
      )
      ..nodeCategories = (json['nodeCategories'] as List<dynamic>?)
          ?.map((e) =>
              DestinyTalentNodeCategory.fromJson(e as Map<String, dynamic>))
          .toList()
      ..hash = json['hash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinyTalentGridDefinitionToJson(
        DestinyTalentGridDefinition instance) =>
    <String, dynamic>{
      'maxGridLevel': instance.maxGridLevel,
      'gridLevelPerColumn': instance.gridLevelPerColumn,
      'progressionHash': instance.progressionHash,
      'nodes': instance.nodes,
      'exclusiveSets': instance.exclusiveSets,
      'independentNodeIndexes': instance.independentNodeIndexes,
      'groups': instance.groups,
      'nodeCategories': instance.nodeCategories,
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
