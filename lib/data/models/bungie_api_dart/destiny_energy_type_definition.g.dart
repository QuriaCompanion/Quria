// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_energy_type_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers

extension GetDestinyEnergyTypeDefinitionCollection on Isar {
  IsarCollection<DestinyEnergyTypeDefinition>
      get destinyEnergyTypeDefinitions => getCollection();
}

const DestinyEnergyTypeDefinitionSchema = CollectionSchema(
  name: 'DestinyEnergyTypeDefinition',
  schema:
      '{"name":"DestinyEnergyTypeDefinition","idName":"hash","properties":[{"name":"capacityStatHash","type":"Long"},{"name":"costStatHash","type":"Long"},{"name":"displayProperties","type":"String"},{"name":"enumValue","type":"Long"},{"name":"index","type":"Long"},{"name":"redacted","type":"Bool"},{"name":"showIcon","type":"Bool"},{"name":"transparentIconPath","type":"String"}],"indexes":[],"links":[]}',
  idName: 'hash',
  propertyIds: {
    'capacityStatHash': 0,
    'costStatHash': 1,
    'displayProperties': 2,
    'enumValue': 3,
    'index': 4,
    'redacted': 5,
    'showIcon': 6,
    'transparentIconPath': 7
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _destinyEnergyTypeDefinitionGetId,
  setId: _destinyEnergyTypeDefinitionSetId,
  getLinks: _destinyEnergyTypeDefinitionGetLinks,
  attachLinks: _destinyEnergyTypeDefinitionAttachLinks,
  serializeNative: _destinyEnergyTypeDefinitionSerializeNative,
  deserializeNative: _destinyEnergyTypeDefinitionDeserializeNative,
  deserializePropNative: _destinyEnergyTypeDefinitionDeserializePropNative,
  serializeWeb: _destinyEnergyTypeDefinitionSerializeWeb,
  deserializeWeb: _destinyEnergyTypeDefinitionDeserializeWeb,
  deserializePropWeb: _destinyEnergyTypeDefinitionDeserializePropWeb,
  version: 4,
);

int? _destinyEnergyTypeDefinitionGetId(DestinyEnergyTypeDefinition object) {
  if (object.hash == Isar.autoIncrement) {
    return null;
  } else {
    return object.hash;
  }
}

void _destinyEnergyTypeDefinitionSetId(
    DestinyEnergyTypeDefinition object, int id) {
  object.hash = id;
}

List<IsarLinkBase> _destinyEnergyTypeDefinitionGetLinks(
    DestinyEnergyTypeDefinition object) {
  return [];
}

const _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter =
    DestinyDisplayPropertiesDefinitionConverter();
const _destinyEnergyTypeDefinitionDestinyEnergyTypeConverter =
    DestinyEnergyTypeConverter();

void _destinyEnergyTypeDefinitionSerializeNative(
    IsarCollection<DestinyEnergyTypeDefinition> collection,
    IsarCObject cObj,
    DestinyEnergyTypeDefinition object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.capacityStatHash;
  final _capacityStatHash = value0;
  final value1 = object.costStatHash;
  final _costStatHash = value1;
  final value2 =
      _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties);
  IsarUint8List? _displayProperties;
  if (value2 != null) {
    _displayProperties = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_displayProperties?.length ?? 0) as int;
  final value3 = _destinyEnergyTypeDefinitionDestinyEnergyTypeConverter
      .toIsar(object.enumValue);
  final _enumValue = value3;
  final value4 = object.index;
  final _index = value4;
  final value5 = object.redacted;
  final _redacted = value5;
  final value6 = object.showIcon;
  final _showIcon = value6;
  final value7 = object.transparentIconPath;
  IsarUint8List? _transparentIconPath;
  if (value7 != null) {
    _transparentIconPath = IsarBinaryWriter.utf8Encoder.convert(value7);
  }
  dynamicSize += (_transparentIconPath?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  cObj.buffer = alloc(size);
  cObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _capacityStatHash);
  writer.writeLong(offsets[1], _costStatHash);
  writer.writeBytes(offsets[2], _displayProperties);
  writer.writeLong(offsets[3], _enumValue);
  writer.writeLong(offsets[4], _index);
  writer.writeBool(offsets[5], _redacted);
  writer.writeBool(offsets[6], _showIcon);
  writer.writeBytes(offsets[7], _transparentIconPath);
}

DestinyEnergyTypeDefinition _destinyEnergyTypeDefinitionDeserializeNative(
    IsarCollection<DestinyEnergyTypeDefinition> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = DestinyEnergyTypeDefinition();
  object.capacityStatHash = reader.readLongOrNull(offsets[0]);
  object.costStatHash = reader.readLongOrNull(offsets[1]);
  object.displayProperties =
      _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[2]));
  object.enumValue = _destinyEnergyTypeDefinitionDestinyEnergyTypeConverter
      .fromIsar(reader.readLongOrNull(offsets[3]));
  object.hash = id;
  object.index = reader.readLongOrNull(offsets[4]);
  object.redacted = reader.readBoolOrNull(offsets[5]);
  object.showIcon = reader.readBoolOrNull(offsets[6]);
  object.transparentIconPath = reader.readStringOrNull(offsets[7]);
  return object;
}

P _destinyEnergyTypeDefinitionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (_destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 3:
      return (_destinyEnergyTypeDefinitionDestinyEnergyTypeConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _destinyEnergyTypeDefinitionSerializeWeb(
    IsarCollection<DestinyEnergyTypeDefinition> collection,
    DestinyEnergyTypeDefinition object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'capacityStatHash', object.capacityStatHash);
  IsarNative.jsObjectSet(jsObj, 'costStatHash', object.costStatHash);
  IsarNative.jsObjectSet(
      jsObj,
      'displayProperties',
      _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties));
  IsarNative.jsObjectSet(
      jsObj,
      'enumValue',
      _destinyEnergyTypeDefinitionDestinyEnergyTypeConverter
          .toIsar(object.enumValue));
  IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
  IsarNative.jsObjectSet(jsObj, 'index', object.index);
  IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
  IsarNative.jsObjectSet(jsObj, 'showIcon', object.showIcon);
  IsarNative.jsObjectSet(
      jsObj, 'transparentIconPath', object.transparentIconPath);
  return jsObj;
}

DestinyEnergyTypeDefinition _destinyEnergyTypeDefinitionDeserializeWeb(
    IsarCollection<DestinyEnergyTypeDefinition> collection, dynamic jsObj) {
  final object = DestinyEnergyTypeDefinition();
  object.capacityStatHash = IsarNative.jsObjectGet(jsObj, 'capacityStatHash');
  object.costStatHash = IsarNative.jsObjectGet(jsObj, 'costStatHash');
  object.displayProperties =
      _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'));
  object.enumValue = _destinyEnergyTypeDefinitionDestinyEnergyTypeConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'enumValue'));
  object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
  object.index = IsarNative.jsObjectGet(jsObj, 'index');
  object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
  object.showIcon = IsarNative.jsObjectGet(jsObj, 'showIcon');
  object.transparentIconPath =
      IsarNative.jsObjectGet(jsObj, 'transparentIconPath');
  return object;
}

P _destinyEnergyTypeDefinitionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'capacityStatHash':
      return (IsarNative.jsObjectGet(jsObj, 'capacityStatHash')) as P;
    case 'costStatHash':
      return (IsarNative.jsObjectGet(jsObj, 'costStatHash')) as P;
    case 'displayProperties':
      return (_destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'))) as P;
    case 'enumValue':
      return (_destinyEnergyTypeDefinitionDestinyEnergyTypeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'enumValue'))) as P;
    case 'hash':
      return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
    case 'index':
      return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
    case 'redacted':
      return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
    case 'showIcon':
      return (IsarNative.jsObjectGet(jsObj, 'showIcon')) as P;
    case 'transparentIconPath':
      return (IsarNative.jsObjectGet(jsObj, 'transparentIconPath')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _destinyEnergyTypeDefinitionAttachLinks(
    IsarCollection col, int id, DestinyEnergyTypeDefinition object) {}

extension DestinyEnergyTypeDefinitionQueryWhereSort on QueryBuilder<
    DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition, QWhere> {
  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterWhere> anyHash() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DestinyEnergyTypeDefinitionQueryWhere on QueryBuilder<
    DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition, QWhereClause> {
  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterWhereClause> hashEqualTo(int hash) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: hash,
      includeLower: true,
      upper: hash,
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterWhereClause> hashGreaterThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: hash, includeLower: include),
    );
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterWhereClause> hashLessThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: hash, includeUpper: include),
    );
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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

extension DestinyEnergyTypeDefinitionQueryFilter on QueryBuilder<
    DestinyEnergyTypeDefinition,
    DestinyEnergyTypeDefinition,
    QFilterCondition> {
  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> capacityStatHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'capacityStatHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> capacityStatHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'capacityStatHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> capacityStatHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'capacityStatHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> capacityStatHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'capacityStatHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> capacityStatHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'capacityStatHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> costStatHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'costStatHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> costStatHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'costStatHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> costStatHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'costStatHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> costStatHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'costStatHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> costStatHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'costStatHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> displayPropertiesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displayProperties',
      value: null,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> displayPropertiesEqualTo(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayProperties',
      value:
          _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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
          _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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
          _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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
          _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> displayPropertiesStartsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displayProperties',
      value:
          _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> displayPropertiesEndsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displayProperties',
      value:
          _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
          QAfterFilterCondition>
      displayPropertiesContains(DestinyDisplayPropertiesDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displayProperties',
      value:
          _destinyEnergyTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
          QAfterFilterCondition>
      displayPropertiesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displayProperties',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> enumValueIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'enumValue',
      value: null,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> enumValueEqualTo(DestinyEnergyType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'enumValue',
      value:
          _destinyEnergyTypeDefinitionDestinyEnergyTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> enumValueGreaterThan(
    DestinyEnergyType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'enumValue',
      value:
          _destinyEnergyTypeDefinitionDestinyEnergyTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> enumValueLessThan(
    DestinyEnergyType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'enumValue',
      value:
          _destinyEnergyTypeDefinitionDestinyEnergyTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> enumValueBetween(
    DestinyEnergyType? lower,
    DestinyEnergyType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'enumValue',
      lower:
          _destinyEnergyTypeDefinitionDestinyEnergyTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyEnergyTypeDefinitionDestinyEnergyTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> hashEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
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

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> showIconIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'showIcon',
      value: null,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> showIconEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'showIcon',
      value: value,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> transparentIconPathIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'transparentIconPath',
      value: null,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> transparentIconPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'transparentIconPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> transparentIconPathGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'transparentIconPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> transparentIconPathLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'transparentIconPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> transparentIconPathBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'transparentIconPath',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> transparentIconPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'transparentIconPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterFilterCondition> transparentIconPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'transparentIconPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
          QAfterFilterCondition>
      transparentIconPathContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'transparentIconPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
          QAfterFilterCondition>
      transparentIconPathMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'transparentIconPath',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DestinyEnergyTypeDefinitionQueryLinks on QueryBuilder<
    DestinyEnergyTypeDefinition,
    DestinyEnergyTypeDefinition,
    QFilterCondition> {}

extension DestinyEnergyTypeDefinitionQueryWhereSortBy on QueryBuilder<
    DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition, QSortBy> {
  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByCapacityStatHash() {
    return addSortByInternal('capacityStatHash', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByCapacityStatHashDesc() {
    return addSortByInternal('capacityStatHash', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByCostStatHash() {
    return addSortByInternal('costStatHash', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByCostStatHashDesc() {
    return addSortByInternal('costStatHash', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByEnumValue() {
    return addSortByInternal('enumValue', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByEnumValueDesc() {
    return addSortByInternal('enumValue', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByShowIcon() {
    return addSortByInternal('showIcon', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByShowIconDesc() {
    return addSortByInternal('showIcon', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByTransparentIconPath() {
    return addSortByInternal('transparentIconPath', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> sortByTransparentIconPathDesc() {
    return addSortByInternal('transparentIconPath', Sort.desc);
  }
}

extension DestinyEnergyTypeDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition, QSortThenBy> {
  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByCapacityStatHash() {
    return addSortByInternal('capacityStatHash', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByCapacityStatHashDesc() {
    return addSortByInternal('capacityStatHash', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByCostStatHash() {
    return addSortByInternal('costStatHash', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByCostStatHashDesc() {
    return addSortByInternal('costStatHash', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByEnumValue() {
    return addSortByInternal('enumValue', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByEnumValueDesc() {
    return addSortByInternal('enumValue', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByShowIcon() {
    return addSortByInternal('showIcon', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByShowIconDesc() {
    return addSortByInternal('showIcon', Sort.desc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByTransparentIconPath() {
    return addSortByInternal('transparentIconPath', Sort.asc);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QAfterSortBy> thenByTransparentIconPathDesc() {
    return addSortByInternal('transparentIconPath', Sort.desc);
  }
}

extension DestinyEnergyTypeDefinitionQueryWhereDistinct on QueryBuilder<
    DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition, QDistinct> {
  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QDistinct> distinctByCapacityStatHash() {
    return addDistinctByInternal('capacityStatHash');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QDistinct> distinctByCostStatHash() {
    return addDistinctByInternal('costStatHash');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QDistinct> distinctByDisplayProperties({bool caseSensitive = true}) {
    return addDistinctByInternal('displayProperties',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QDistinct> distinctByEnumValue() {
    return addDistinctByInternal('enumValue');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QDistinct> distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QDistinct> distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QDistinct> distinctByShowIcon() {
    return addDistinctByInternal('showIcon');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition,
      QDistinct> distinctByTransparentIconPath({bool caseSensitive = true}) {
    return addDistinctByInternal('transparentIconPath',
        caseSensitive: caseSensitive);
  }
}

extension DestinyEnergyTypeDefinitionQueryProperty on QueryBuilder<
    DestinyEnergyTypeDefinition, DestinyEnergyTypeDefinition, QQueryProperty> {
  QueryBuilder<DestinyEnergyTypeDefinition, int?, QQueryOperations>
      capacityStatHashProperty() {
    return addPropertyNameInternal('capacityStatHash');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, int?, QQueryOperations>
      costStatHashProperty() {
    return addPropertyNameInternal('costStatHash');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyDisplayPropertiesDefinition?,
      QQueryOperations> displayPropertiesProperty() {
    return addPropertyNameInternal('displayProperties');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, DestinyEnergyType?,
      QQueryOperations> enumValueProperty() {
    return addPropertyNameInternal('enumValue');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, int?, QQueryOperations>
      hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, int?, QQueryOperations>
      indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, bool?, QQueryOperations>
      showIconProperty() {
    return addPropertyNameInternal('showIcon');
  }

  QueryBuilder<DestinyEnergyTypeDefinition, String?, QQueryOperations>
      transparentIconPathProperty() {
    return addPropertyNameInternal('transparentIconPath');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyEnergyTypeDefinition _$DestinyEnergyTypeDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyEnergyTypeDefinition()
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..transparentIconPath = json['transparentIconPath'] as String?
      ..showIcon = json['showIcon'] as bool?
      ..enumValue = decodeDestinyEnergyType(json['enumValue'])
      ..capacityStatHash = json['capacityStatHash'] as int?
      ..costStatHash = json['costStatHash'] as int?
      ..hash = json['hash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinyEnergyTypeDefinitionToJson(
        DestinyEnergyTypeDefinition instance) =>
    <String, dynamic>{
      'displayProperties': instance.displayProperties,
      'transparentIconPath': instance.transparentIconPath,
      'showIcon': instance.showIcon,
      'enumValue': encodeDestinyEnergyType(instance.enumValue),
      'capacityStatHash': instance.capacityStatHash,
      'costStatHash': instance.costStatHash,
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
