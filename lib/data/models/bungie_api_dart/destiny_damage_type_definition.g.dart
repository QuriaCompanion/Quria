// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_damage_type_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers

extension GetDestinyDamageTypeDefinitionCollection on Isar {
  IsarCollection<DestinyDamageTypeDefinition>
      get destinyDamageTypeDefinitions => getCollection();
}

const DestinyDamageTypeDefinitionSchema = CollectionSchema(
  name: 'DestinyDamageTypeDefinition',
  schema:
      '{"name":"DestinyDamageTypeDefinition","idName":"hash","properties":[{"name":"displayProperties","type":"String"},{"name":"enumValue","type":"Long"},{"name":"index","type":"Long"},{"name":"redacted","type":"Bool"},{"name":"showIcon","type":"Bool"},{"name":"transparentIconPath","type":"String"}],"indexes":[],"links":[]}',
  idName: 'hash',
  propertyIds: {
    'displayProperties': 0,
    'enumValue': 1,
    'index': 2,
    'redacted': 3,
    'showIcon': 4,
    'transparentIconPath': 5
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _destinyDamageTypeDefinitionGetId,
  setId: _destinyDamageTypeDefinitionSetId,
  getLinks: _destinyDamageTypeDefinitionGetLinks,
  attachLinks: _destinyDamageTypeDefinitionAttachLinks,
  serializeNative: _destinyDamageTypeDefinitionSerializeNative,
  deserializeNative: _destinyDamageTypeDefinitionDeserializeNative,
  deserializePropNative: _destinyDamageTypeDefinitionDeserializePropNative,
  serializeWeb: _destinyDamageTypeDefinitionSerializeWeb,
  deserializeWeb: _destinyDamageTypeDefinitionDeserializeWeb,
  deserializePropWeb: _destinyDamageTypeDefinitionDeserializePropWeb,
  version: 4,
);

int? _destinyDamageTypeDefinitionGetId(DestinyDamageTypeDefinition object) {
  if (object.hash == Isar.autoIncrement) {
    return null;
  } else {
    return object.hash;
  }
}

void _destinyDamageTypeDefinitionSetId(
    DestinyDamageTypeDefinition object, int id) {
  object.hash = id;
}

List<IsarLinkBase> _destinyDamageTypeDefinitionGetLinks(
    DestinyDamageTypeDefinition object) {
  return [];
}

const _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter =
    DestinyDisplayPropertiesDefinitionConverter();
const _destinyDamageTypeDefinitionDamageTypeConverter = DamageTypeConverter();

void _destinyDamageTypeDefinitionSerializeNative(
    IsarCollection<DestinyDamageTypeDefinition> collection,
    IsarCObject cObj,
    DestinyDamageTypeDefinition object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 =
      _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties);
  IsarUint8List? _displayProperties;
  if (value0 != null) {
    _displayProperties = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_displayProperties?.length ?? 0) as int;
  final value1 =
      _destinyDamageTypeDefinitionDamageTypeConverter.toIsar(object.enumValue);
  final _enumValue = value1;
  final value2 = object.index;
  final _index = value2;
  final value3 = object.redacted;
  final _redacted = value3;
  final value4 = object.showIcon;
  final _showIcon = value4;
  final value5 = object.transparentIconPath;
  IsarUint8List? _transparentIconPath;
  if (value5 != null) {
    _transparentIconPath = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_transparentIconPath?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  cObj.buffer = alloc(size);
  cObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _displayProperties);
  writer.writeLong(offsets[1], _enumValue);
  writer.writeLong(offsets[2], _index);
  writer.writeBool(offsets[3], _redacted);
  writer.writeBool(offsets[4], _showIcon);
  writer.writeBytes(offsets[5], _transparentIconPath);
}

DestinyDamageTypeDefinition _destinyDamageTypeDefinitionDeserializeNative(
    IsarCollection<DestinyDamageTypeDefinition> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = DestinyDamageTypeDefinition();
  object.displayProperties =
      _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[0]));
  object.enumValue = _destinyDamageTypeDefinitionDamageTypeConverter
      .fromIsar(reader.readLongOrNull(offsets[1]));
  object.hash = id;
  object.index = reader.readLongOrNull(offsets[2]);
  object.redacted = reader.readBoolOrNull(offsets[3]);
  object.showIcon = reader.readBoolOrNull(offsets[4]);
  object.transparentIconPath = reader.readStringOrNull(offsets[5]);
  return object;
}

P _destinyDamageTypeDefinitionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (_destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 1:
      return (_destinyDamageTypeDefinitionDamageTypeConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _destinyDamageTypeDefinitionSerializeWeb(
    IsarCollection<DestinyDamageTypeDefinition> collection,
    DestinyDamageTypeDefinition object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj,
      'displayProperties',
      _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties));
  IsarNative.jsObjectSet(jsObj, 'enumValue',
      _destinyDamageTypeDefinitionDamageTypeConverter.toIsar(object.enumValue));
  IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
  IsarNative.jsObjectSet(jsObj, 'index', object.index);
  IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
  IsarNative.jsObjectSet(jsObj, 'showIcon', object.showIcon);
  IsarNative.jsObjectSet(
      jsObj, 'transparentIconPath', object.transparentIconPath);
  return jsObj;
}

DestinyDamageTypeDefinition _destinyDamageTypeDefinitionDeserializeWeb(
    IsarCollection<DestinyDamageTypeDefinition> collection, dynamic jsObj) {
  final object = DestinyDamageTypeDefinition();
  object.displayProperties =
      _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'));
  object.enumValue = _destinyDamageTypeDefinitionDamageTypeConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'enumValue'));
  object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
  object.index = IsarNative.jsObjectGet(jsObj, 'index');
  object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
  object.showIcon = IsarNative.jsObjectGet(jsObj, 'showIcon');
  object.transparentIconPath =
      IsarNative.jsObjectGet(jsObj, 'transparentIconPath');
  return object;
}

P _destinyDamageTypeDefinitionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'displayProperties':
      return (_destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'))) as P;
    case 'enumValue':
      return (_destinyDamageTypeDefinitionDamageTypeConverter
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

void _destinyDamageTypeDefinitionAttachLinks(
    IsarCollection col, int id, DestinyDamageTypeDefinition object) {}

extension DestinyDamageTypeDefinitionQueryWhereSort on QueryBuilder<
    DestinyDamageTypeDefinition, DestinyDamageTypeDefinition, QWhere> {
  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterWhere> anyHash() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DestinyDamageTypeDefinitionQueryWhere on QueryBuilder<
    DestinyDamageTypeDefinition, DestinyDamageTypeDefinition, QWhereClause> {
  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterWhereClause> hashEqualTo(int hash) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: hash,
      includeLower: true,
      upper: hash,
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterWhereClause> hashGreaterThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: hash, includeLower: include),
    );
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterWhereClause> hashLessThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: hash, includeUpper: include),
    );
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

extension DestinyDamageTypeDefinitionQueryFilter on QueryBuilder<
    DestinyDamageTypeDefinition,
    DestinyDamageTypeDefinition,
    QFilterCondition> {
  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> displayPropertiesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displayProperties',
      value: null,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> displayPropertiesEqualTo(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayProperties',
      value:
          _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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
          _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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
          _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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
          _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> displayPropertiesStartsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displayProperties',
      value:
          _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> displayPropertiesEndsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displayProperties',
      value:
          _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
          QAfterFilterCondition>
      displayPropertiesContains(DestinyDisplayPropertiesDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displayProperties',
      value:
          _destinyDamageTypeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
          QAfterFilterCondition>
      displayPropertiesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displayProperties',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> enumValueIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'enumValue',
      value: null,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> enumValueEqualTo(DamageType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'enumValue',
      value: _destinyDamageTypeDefinitionDamageTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> enumValueGreaterThan(
    DamageType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'enumValue',
      value: _destinyDamageTypeDefinitionDamageTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> enumValueLessThan(
    DamageType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'enumValue',
      value: _destinyDamageTypeDefinitionDamageTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> enumValueBetween(
    DamageType? lower,
    DamageType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'enumValue',
      lower: _destinyDamageTypeDefinitionDamageTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _destinyDamageTypeDefinitionDamageTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> hashEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> showIconIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'showIcon',
      value: null,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> showIconEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'showIcon',
      value: value,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterFilterCondition> transparentIconPathIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'transparentIconPath',
      value: null,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
          QAfterFilterCondition>
      transparentIconPathContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'transparentIconPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
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

extension DestinyDamageTypeDefinitionQueryLinks on QueryBuilder<
    DestinyDamageTypeDefinition,
    DestinyDamageTypeDefinition,
    QFilterCondition> {}

extension DestinyDamageTypeDefinitionQueryWhereSortBy on QueryBuilder<
    DestinyDamageTypeDefinition, DestinyDamageTypeDefinition, QSortBy> {
  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByEnumValue() {
    return addSortByInternal('enumValue', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByEnumValueDesc() {
    return addSortByInternal('enumValue', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByShowIcon() {
    return addSortByInternal('showIcon', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByShowIconDesc() {
    return addSortByInternal('showIcon', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByTransparentIconPath() {
    return addSortByInternal('transparentIconPath', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> sortByTransparentIconPathDesc() {
    return addSortByInternal('transparentIconPath', Sort.desc);
  }
}

extension DestinyDamageTypeDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyDamageTypeDefinition, DestinyDamageTypeDefinition, QSortThenBy> {
  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByEnumValue() {
    return addSortByInternal('enumValue', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByEnumValueDesc() {
    return addSortByInternal('enumValue', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByShowIcon() {
    return addSortByInternal('showIcon', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByShowIconDesc() {
    return addSortByInternal('showIcon', Sort.desc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByTransparentIconPath() {
    return addSortByInternal('transparentIconPath', Sort.asc);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QAfterSortBy> thenByTransparentIconPathDesc() {
    return addSortByInternal('transparentIconPath', Sort.desc);
  }
}

extension DestinyDamageTypeDefinitionQueryWhereDistinct on QueryBuilder<
    DestinyDamageTypeDefinition, DestinyDamageTypeDefinition, QDistinct> {
  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QDistinct> distinctByDisplayProperties({bool caseSensitive = true}) {
    return addDistinctByInternal('displayProperties',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QDistinct> distinctByEnumValue() {
    return addDistinctByInternal('enumValue');
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QDistinct> distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QDistinct> distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QDistinct> distinctByShowIcon() {
    return addDistinctByInternal('showIcon');
  }

  QueryBuilder<DestinyDamageTypeDefinition, DestinyDamageTypeDefinition,
      QDistinct> distinctByTransparentIconPath({bool caseSensitive = true}) {
    return addDistinctByInternal('transparentIconPath',
        caseSensitive: caseSensitive);
  }
}

extension DestinyDamageTypeDefinitionQueryProperty on QueryBuilder<
    DestinyDamageTypeDefinition, DestinyDamageTypeDefinition, QQueryProperty> {
  QueryBuilder<DestinyDamageTypeDefinition, DestinyDisplayPropertiesDefinition?,
      QQueryOperations> displayPropertiesProperty() {
    return addPropertyNameInternal('displayProperties');
  }

  QueryBuilder<DestinyDamageTypeDefinition, DamageType?, QQueryOperations>
      enumValueProperty() {
    return addPropertyNameInternal('enumValue');
  }

  QueryBuilder<DestinyDamageTypeDefinition, int?, QQueryOperations>
      hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyDamageTypeDefinition, int?, QQueryOperations>
      indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinyDamageTypeDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }

  QueryBuilder<DestinyDamageTypeDefinition, bool?, QQueryOperations>
      showIconProperty() {
    return addPropertyNameInternal('showIcon');
  }

  QueryBuilder<DestinyDamageTypeDefinition, String?, QQueryOperations>
      transparentIconPathProperty() {
    return addPropertyNameInternal('transparentIconPath');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyDamageTypeDefinition _$DestinyDamageTypeDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyDamageTypeDefinition()
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..transparentIconPath = json['transparentIconPath'] as String?
      ..showIcon = json['showIcon'] as bool?
      ..enumValue = decodeDamageType(json['enumValue'])
      ..hash = json['hash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinyDamageTypeDefinitionToJson(
        DestinyDamageTypeDefinition instance) =>
    <String, dynamic>{
      'displayProperties': instance.displayProperties,
      'transparentIconPath': instance.transparentIconPath,
      'showIcon': instance.showIcon,
      'enumValue': encodeDamageType(instance.enumValue),
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
