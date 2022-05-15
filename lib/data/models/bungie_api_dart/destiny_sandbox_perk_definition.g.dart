// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_sandbox_perk_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDestinySandboxPerkDefinitionCollection on Isar {
  IsarCollection<DestinySandboxPerkDefinition>
      get destinySandboxPerkDefinitions => getCollection();
}

const DestinySandboxPerkDefinitionSchema = CollectionSchema(
  name: 'DestinySandboxPerkDefinition',
  schema:
      '{"name":"DestinySandboxPerkDefinition","idName":"hash","properties":[{"name":"damageType","type":"Long"},{"name":"damageTypeHash","type":"Long"},{"name":"displayProperties","type":"String"},{"name":"index","type":"Long"},{"name":"isDisplayable","type":"Bool"},{"name":"perkGroups","type":"String"},{"name":"perkIdentifier","type":"String"},{"name":"redacted","type":"Bool"}],"indexes":[],"links":[]}',
  idName: 'hash',
  propertyIds: {
    'damageType': 0,
    'damageTypeHash': 1,
    'displayProperties': 2,
    'index': 3,
    'isDisplayable': 4,
    'perkGroups': 5,
    'perkIdentifier': 6,
    'redacted': 7
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _destinySandboxPerkDefinitionGetId,
  setId: _destinySandboxPerkDefinitionSetId,
  getLinks: _destinySandboxPerkDefinitionGetLinks,
  attachLinks: _destinySandboxPerkDefinitionAttachLinks,
  serializeNative: _destinySandboxPerkDefinitionSerializeNative,
  deserializeNative: _destinySandboxPerkDefinitionDeserializeNative,
  deserializePropNative: _destinySandboxPerkDefinitionDeserializePropNative,
  serializeWeb: _destinySandboxPerkDefinitionSerializeWeb,
  deserializeWeb: _destinySandboxPerkDefinitionDeserializeWeb,
  deserializePropWeb: _destinySandboxPerkDefinitionDeserializePropWeb,
  version: 3,
);

int? _destinySandboxPerkDefinitionGetId(DestinySandboxPerkDefinition object) {
  if (object.hash == Isar.autoIncrement) {
    return null;
  } else {
    return object.hash;
  }
}

void _destinySandboxPerkDefinitionSetId(
    DestinySandboxPerkDefinition object, int id) {
  object.hash = id;
}

List<IsarLinkBase> _destinySandboxPerkDefinitionGetLinks(
    DestinySandboxPerkDefinition object) {
  return [];
}

const _destinySandboxPerkDefinitionDamageTypeConverter = DamageTypeConverter();
const _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter =
    DestinyDisplayPropertiesDefinitionConverter();
const _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter =
    DestinyTalentNodeStepGroupsConverter();

void _destinySandboxPerkDefinitionSerializeNative(
    IsarCollection<DestinySandboxPerkDefinition> collection,
    IsarRawObject rawObj,
    DestinySandboxPerkDefinition object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = _destinySandboxPerkDefinitionDamageTypeConverter
      .toIsar(object.damageType);
  final damageType = value0;
  final value1 = object.damageTypeHash;
  final damageTypeHash = value1;
  final value2 =
      _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties);
  IsarUint8List? displayProperties;
  if (value2 != null) {
    displayProperties = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (displayProperties?.length ?? 0) as int;
  final value3 = object.index;
  final index = value3;
  final value4 = object.isDisplayable;
  final isDisplayable = value4;
  final value5 =
      _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .toIsar(object.perkGroups);
  IsarUint8List? perkGroups;
  if (value5 != null) {
    perkGroups = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (perkGroups?.length ?? 0) as int;
  final value6 = object.perkIdentifier;
  IsarUint8List? perkIdentifier;
  if (value6 != null) {
    perkIdentifier = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (perkIdentifier?.length ?? 0) as int;
  final value7 = object.redacted;
  final redacted = value7;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], damageType);
  writer.writeLong(offsets[1], damageTypeHash);
  writer.writeBytes(offsets[2], displayProperties);
  writer.writeLong(offsets[3], index);
  writer.writeBool(offsets[4], isDisplayable);
  writer.writeBytes(offsets[5], perkGroups);
  writer.writeBytes(offsets[6], perkIdentifier);
  writer.writeBool(offsets[7], redacted);
}

DestinySandboxPerkDefinition _destinySandboxPerkDefinitionDeserializeNative(
    IsarCollection<DestinySandboxPerkDefinition> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = DestinySandboxPerkDefinition();
  object.damageType = _destinySandboxPerkDefinitionDamageTypeConverter
      .fromIsar(reader.readLongOrNull(offsets[0]));
  object.damageTypeHash = reader.readLongOrNull(offsets[1]);
  object.displayProperties =
      _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[2]));
  object.hash = id;
  object.index = reader.readLongOrNull(offsets[3]);
  object.isDisplayable = reader.readBoolOrNull(offsets[4]);
  object.perkGroups =
      _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .fromIsar(reader.readStringOrNull(offsets[5]));
  object.perkIdentifier = reader.readStringOrNull(offsets[6]);
  object.redacted = reader.readBoolOrNull(offsets[7]);
  return object;
}

P _destinySandboxPerkDefinitionDeserializePropNative<P>(
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
      return (_destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (_destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _destinySandboxPerkDefinitionSerializeWeb(
    IsarCollection<DestinySandboxPerkDefinition> collection,
    DestinySandboxPerkDefinition object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj,
      'damageType',
      _destinySandboxPerkDefinitionDamageTypeConverter
          .toIsar(object.damageType));
  IsarNative.jsObjectSet(jsObj, 'damageTypeHash', object.damageTypeHash);
  IsarNative.jsObjectSet(
      jsObj,
      'displayProperties',
      _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties));
  IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
  IsarNative.jsObjectSet(jsObj, 'index', object.index);
  IsarNative.jsObjectSet(jsObj, 'isDisplayable', object.isDisplayable);
  IsarNative.jsObjectSet(
      jsObj,
      'perkGroups',
      _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .toIsar(object.perkGroups));
  IsarNative.jsObjectSet(jsObj, 'perkIdentifier', object.perkIdentifier);
  IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
  return jsObj;
}

DestinySandboxPerkDefinition _destinySandboxPerkDefinitionDeserializeWeb(
    IsarCollection<DestinySandboxPerkDefinition> collection, dynamic jsObj) {
  final object = DestinySandboxPerkDefinition();
  object.damageType = _destinySandboxPerkDefinitionDamageTypeConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'damageType'));
  object.damageTypeHash = IsarNative.jsObjectGet(jsObj, 'damageTypeHash');
  object.displayProperties =
      _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'));
  object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
  object.index = IsarNative.jsObjectGet(jsObj, 'index');
  object.isDisplayable = IsarNative.jsObjectGet(jsObj, 'isDisplayable');
  object.perkGroups =
      _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'perkGroups'));
  object.perkIdentifier = IsarNative.jsObjectGet(jsObj, 'perkIdentifier');
  object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
  return object;
}

P _destinySandboxPerkDefinitionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'damageType':
      return (_destinySandboxPerkDefinitionDamageTypeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'damageType'))) as P;
    case 'damageTypeHash':
      return (IsarNative.jsObjectGet(jsObj, 'damageTypeHash')) as P;
    case 'displayProperties':
      return (_destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'))) as P;
    case 'hash':
      return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
    case 'index':
      return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
    case 'isDisplayable':
      return (IsarNative.jsObjectGet(jsObj, 'isDisplayable')) as P;
    case 'perkGroups':
      return (_destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'perkGroups'))) as P;
    case 'perkIdentifier':
      return (IsarNative.jsObjectGet(jsObj, 'perkIdentifier')) as P;
    case 'redacted':
      return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _destinySandboxPerkDefinitionAttachLinks(
    IsarCollection col, int id, DestinySandboxPerkDefinition object) {}

extension DestinySandboxPerkDefinitionQueryWhereSort on QueryBuilder<
    DestinySandboxPerkDefinition, DestinySandboxPerkDefinition, QWhere> {
  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterWhere> anyHash() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DestinySandboxPerkDefinitionQueryWhere on QueryBuilder<
    DestinySandboxPerkDefinition, DestinySandboxPerkDefinition, QWhereClause> {
  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterWhereClause> hashEqualTo(int hash) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: hash,
      includeLower: true,
      upper: hash,
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterWhereClause> hashGreaterThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: hash, includeLower: include),
    );
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterWhereClause> hashLessThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: hash, includeUpper: include),
    );
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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
      QAfterFilterCondition> displayPropertiesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displayProperties',
      value: null,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> displayPropertiesEqualTo(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayProperties',
      value:
          _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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
          _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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
          _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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
          _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> displayPropertiesStartsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displayProperties',
      value:
          _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> displayPropertiesEndsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displayProperties',
      value:
          _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
          QAfterFilterCondition>
      displayPropertiesContains(DestinyDisplayPropertiesDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displayProperties',
      value:
          _destinySandboxPerkDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
          QAfterFilterCondition>
      displayPropertiesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displayProperties',
      value: pattern,
      caseSensitive: caseSensitive,
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
      QAfterFilterCondition> hashEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
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
      QAfterFilterCondition> perkGroupsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'perkGroups',
      value: null,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkGroupsEqualTo(
    DestinyTalentNodeStepGroups? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'perkGroups',
      value: _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkGroupsGreaterThan(
    DestinyTalentNodeStepGroups? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'perkGroups',
      value: _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkGroupsLessThan(
    DestinyTalentNodeStepGroups? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'perkGroups',
      value: _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkGroupsBetween(
    DestinyTalentNodeStepGroups? lower,
    DestinyTalentNodeStepGroups? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'perkGroups',
      lower: _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .toIsar(lower),
      includeLower: includeLower,
      upper: _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkGroupsStartsWith(
    DestinyTalentNodeStepGroups value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'perkGroups',
      value: _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterFilterCondition> perkGroupsEndsWith(
    DestinyTalentNodeStepGroups value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'perkGroups',
      value: _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
          QAfterFilterCondition>
      perkGroupsContains(DestinyTalentNodeStepGroups value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'perkGroups',
      value: _destinySandboxPerkDefinitionDestinyTalentNodeStepGroupsConverter
          .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
          QAfterFilterCondition>
      perkGroupsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'perkGroups',
      value: pattern,
      caseSensitive: caseSensitive,
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
      QAfterSortBy> sortByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
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
      QAfterSortBy> sortByPerkGroups() {
    return addSortByInternal('perkGroups', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> sortByPerkGroupsDesc() {
    return addSortByInternal('perkGroups', Sort.desc);
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
      QAfterSortBy> thenByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
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
      QAfterSortBy> thenByPerkGroups() {
    return addSortByInternal('perkGroups', Sort.asc);
  }

  QueryBuilder<DestinySandboxPerkDefinition, DestinySandboxPerkDefinition,
      QAfterSortBy> thenByPerkGroupsDesc() {
    return addSortByInternal('perkGroups', Sort.desc);
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
      QDistinct> distinctByDisplayProperties({bool caseSensitive = true}) {
    return addDistinctByInternal('displayProperties',
        caseSensitive: caseSensitive);
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
      QDistinct> distinctByPerkGroups({bool caseSensitive = true}) {
    return addDistinctByInternal('perkGroups', caseSensitive: caseSensitive);
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

  QueryBuilder<
      DestinySandboxPerkDefinition,
      DestinyDisplayPropertiesDefinition?,
      QQueryOperations> displayPropertiesProperty() {
    return addPropertyNameInternal('displayProperties');
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

  QueryBuilder<DestinySandboxPerkDefinition, DestinyTalentNodeStepGroups?,
      QQueryOperations> perkGroupsProperty() {
    return addPropertyNameInternal('perkGroups');
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
