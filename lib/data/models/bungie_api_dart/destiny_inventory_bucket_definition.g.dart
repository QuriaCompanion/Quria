// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_inventory_bucket_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers

extension GetDestinyInventoryBucketDefinitionCollection on Isar {
  IsarCollection<DestinyInventoryBucketDefinition>
      get destinyInventoryBucketDefinitions => getCollection();
}

const DestinyInventoryBucketDefinitionSchema = CollectionSchema(
  name: 'DestinyInventoryBucketDefinition',
  schema:
      '{"name":"DestinyInventoryBucketDefinition","idName":"hash","properties":[{"name":"bucketOrder","type":"Long"},{"name":"category","type":"Long"},{"name":"displayProperties","type":"String"},{"name":"enabled","type":"Bool"},{"name":"fifo","type":"Bool"},{"name":"hasTransferDestination","type":"Bool"},{"name":"index","type":"Long"},{"name":"itemCount","type":"Long"},{"name":"location","type":"Long"},{"name":"redacted","type":"Bool"},{"name":"scope","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'hash',
  propertyIds: {
    'bucketOrder': 0,
    'category': 1,
    'displayProperties': 2,
    'enabled': 3,
    'fifo': 4,
    'hasTransferDestination': 5,
    'index': 6,
    'itemCount': 7,
    'location': 8,
    'redacted': 9,
    'scope': 10
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _destinyInventoryBucketDefinitionGetId,
  setId: _destinyInventoryBucketDefinitionSetId,
  getLinks: _destinyInventoryBucketDefinitionGetLinks,
  attachLinks: _destinyInventoryBucketDefinitionAttachLinks,
  serializeNative: _destinyInventoryBucketDefinitionSerializeNative,
  deserializeNative: _destinyInventoryBucketDefinitionDeserializeNative,
  deserializePropNative: _destinyInventoryBucketDefinitionDeserializePropNative,
  serializeWeb: _destinyInventoryBucketDefinitionSerializeWeb,
  deserializeWeb: _destinyInventoryBucketDefinitionDeserializeWeb,
  deserializePropWeb: _destinyInventoryBucketDefinitionDeserializePropWeb,
  version: 4,
);

int? _destinyInventoryBucketDefinitionGetId(
    DestinyInventoryBucketDefinition object) {
  if (object.hash == Isar.autoIncrement) {
    return null;
  } else {
    return object.hash;
  }
}

void _destinyInventoryBucketDefinitionSetId(
    DestinyInventoryBucketDefinition object, int id) {
  object.hash = id;
}

List<IsarLinkBase> _destinyInventoryBucketDefinitionGetLinks(
    DestinyInventoryBucketDefinition object) {
  return [];
}

const _destinyInventoryBucketDefinitionBucketCategoryConverter =
    BucketCategoryConverter();
const _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter =
    DestinyDisplayPropertiesDefinitionConverter();
const _destinyInventoryBucketDefinitionItemLocationConverter =
    ItemLocationConverter();
const _destinyInventoryBucketDefinitionBucketScopeConverter =
    BucketScopeConverter();

void _destinyInventoryBucketDefinitionSerializeNative(
    IsarCollection<DestinyInventoryBucketDefinition> collection,
    IsarCObject cObj,
    DestinyInventoryBucketDefinition object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.bucketOrder;
  final _bucketOrder = value0;
  final value1 = _destinyInventoryBucketDefinitionBucketCategoryConverter
      .toIsar(object.category);
  final _category = value1;
  final value2 =
      _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties);
  IsarUint8List? _displayProperties;
  if (value2 != null) {
    _displayProperties = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_displayProperties?.length ?? 0) as int;
  final value3 = object.enabled;
  final _enabled = value3;
  final value4 = object.fifo;
  final _fifo = value4;
  final value5 = object.hasTransferDestination;
  final _hasTransferDestination = value5;
  final value6 = object.index;
  final _index = value6;
  final value7 = object.itemCount;
  final _itemCount = value7;
  final value8 = _destinyInventoryBucketDefinitionItemLocationConverter
      .toIsar(object.location);
  final _location = value8;
  final value9 = object.redacted;
  final _redacted = value9;
  final value10 = _destinyInventoryBucketDefinitionBucketScopeConverter
      .toIsar(object.scope);
  final _scope = value10;
  final size = staticSize + dynamicSize;

  cObj.buffer = alloc(size);
  cObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _bucketOrder);
  writer.writeLong(offsets[1], _category);
  writer.writeBytes(offsets[2], _displayProperties);
  writer.writeBool(offsets[3], _enabled);
  writer.writeBool(offsets[4], _fifo);
  writer.writeBool(offsets[5], _hasTransferDestination);
  writer.writeLong(offsets[6], _index);
  writer.writeLong(offsets[7], _itemCount);
  writer.writeLong(offsets[8], _location);
  writer.writeBool(offsets[9], _redacted);
  writer.writeLong(offsets[10], _scope);
}

DestinyInventoryBucketDefinition
    _destinyInventoryBucketDefinitionDeserializeNative(
        IsarCollection<DestinyInventoryBucketDefinition> collection,
        int id,
        IsarBinaryReader reader,
        List<int> offsets) {
  final object = DestinyInventoryBucketDefinition();
  object.bucketOrder = reader.readLongOrNull(offsets[0]);
  object.category = _destinyInventoryBucketDefinitionBucketCategoryConverter
      .fromIsar(reader.readLongOrNull(offsets[1]));
  object.displayProperties =
      _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[2]));
  object.enabled = reader.readBoolOrNull(offsets[3]);
  object.fifo = reader.readBoolOrNull(offsets[4]);
  object.hasTransferDestination = reader.readBoolOrNull(offsets[5]);
  object.hash = id;
  object.index = reader.readLongOrNull(offsets[6]);
  object.itemCount = reader.readLongOrNull(offsets[7]);
  object.location = _destinyInventoryBucketDefinitionItemLocationConverter
      .fromIsar(reader.readLongOrNull(offsets[8]));
  object.redacted = reader.readBoolOrNull(offsets[9]);
  object.scope = _destinyInventoryBucketDefinitionBucketScopeConverter
      .fromIsar(reader.readLongOrNull(offsets[10]));
  return object;
}

P _destinyInventoryBucketDefinitionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (_destinyInventoryBucketDefinitionBucketCategoryConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 2:
      return (_destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (_destinyInventoryBucketDefinitionItemLocationConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (_destinyInventoryBucketDefinitionBucketScopeConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _destinyInventoryBucketDefinitionSerializeWeb(
    IsarCollection<DestinyInventoryBucketDefinition> collection,
    DestinyInventoryBucketDefinition object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'bucketOrder', object.bucketOrder);
  IsarNative.jsObjectSet(
      jsObj,
      'category',
      _destinyInventoryBucketDefinitionBucketCategoryConverter
          .toIsar(object.category));
  IsarNative.jsObjectSet(
      jsObj,
      'displayProperties',
      _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties));
  IsarNative.jsObjectSet(jsObj, 'enabled', object.enabled);
  IsarNative.jsObjectSet(jsObj, 'fifo', object.fifo);
  IsarNative.jsObjectSet(
      jsObj, 'hasTransferDestination', object.hasTransferDestination);
  IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
  IsarNative.jsObjectSet(jsObj, 'index', object.index);
  IsarNative.jsObjectSet(jsObj, 'itemCount', object.itemCount);
  IsarNative.jsObjectSet(
      jsObj,
      'location',
      _destinyInventoryBucketDefinitionItemLocationConverter
          .toIsar(object.location));
  IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
  IsarNative.jsObjectSet(
      jsObj,
      'scope',
      _destinyInventoryBucketDefinitionBucketScopeConverter
          .toIsar(object.scope));
  return jsObj;
}

DestinyInventoryBucketDefinition
    _destinyInventoryBucketDefinitionDeserializeWeb(
        IsarCollection<DestinyInventoryBucketDefinition> collection,
        dynamic jsObj) {
  final object = DestinyInventoryBucketDefinition();
  object.bucketOrder = IsarNative.jsObjectGet(jsObj, 'bucketOrder');
  object.category = _destinyInventoryBucketDefinitionBucketCategoryConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'category'));
  object.displayProperties =
      _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'));
  object.enabled = IsarNative.jsObjectGet(jsObj, 'enabled');
  object.fifo = IsarNative.jsObjectGet(jsObj, 'fifo');
  object.hasTransferDestination =
      IsarNative.jsObjectGet(jsObj, 'hasTransferDestination');
  object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
  object.index = IsarNative.jsObjectGet(jsObj, 'index');
  object.itemCount = IsarNative.jsObjectGet(jsObj, 'itemCount');
  object.location = _destinyInventoryBucketDefinitionItemLocationConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'location'));
  object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
  object.scope = _destinyInventoryBucketDefinitionBucketScopeConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'scope'));
  return object;
}

P _destinyInventoryBucketDefinitionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'bucketOrder':
      return (IsarNative.jsObjectGet(jsObj, 'bucketOrder')) as P;
    case 'category':
      return (_destinyInventoryBucketDefinitionBucketCategoryConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'category'))) as P;
    case 'displayProperties':
      return (_destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'))) as P;
    case 'enabled':
      return (IsarNative.jsObjectGet(jsObj, 'enabled')) as P;
    case 'fifo':
      return (IsarNative.jsObjectGet(jsObj, 'fifo')) as P;
    case 'hasTransferDestination':
      return (IsarNative.jsObjectGet(jsObj, 'hasTransferDestination')) as P;
    case 'hash':
      return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
    case 'index':
      return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
    case 'itemCount':
      return (IsarNative.jsObjectGet(jsObj, 'itemCount')) as P;
    case 'location':
      return (_destinyInventoryBucketDefinitionItemLocationConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'location'))) as P;
    case 'redacted':
      return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
    case 'scope':
      return (_destinyInventoryBucketDefinitionBucketScopeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'scope'))) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _destinyInventoryBucketDefinitionAttachLinks(
    IsarCollection col, int id, DestinyInventoryBucketDefinition object) {}

extension DestinyInventoryBucketDefinitionQueryWhereSort on QueryBuilder<
    DestinyInventoryBucketDefinition,
    DestinyInventoryBucketDefinition,
    QWhere> {
  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterWhere> anyHash() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DestinyInventoryBucketDefinitionQueryWhere on QueryBuilder<
    DestinyInventoryBucketDefinition,
    DestinyInventoryBucketDefinition,
    QWhereClause> {
  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterWhereClause> hashEqualTo(int hash) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: hash,
      includeLower: true,
      upper: hash,
      includeUpper: true,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
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

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterWhereClause> hashGreaterThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: hash, includeLower: include),
    );
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterWhereClause> hashLessThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: hash, includeUpper: include),
    );
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterWhereClause> hashBetween(
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

extension DestinyInventoryBucketDefinitionQueryFilter on QueryBuilder<
    DestinyInventoryBucketDefinition,
    DestinyInventoryBucketDefinition,
    QFilterCondition> {
  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> bucketOrderIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'bucketOrder',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> bucketOrderEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'bucketOrder',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> bucketOrderGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'bucketOrder',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> bucketOrderLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'bucketOrder',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> bucketOrderBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'bucketOrder',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> categoryIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'category',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> categoryEqualTo(BucketCategory? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'category',
      value: _destinyInventoryBucketDefinitionBucketCategoryConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> categoryGreaterThan(
    BucketCategory? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'category',
      value: _destinyInventoryBucketDefinitionBucketCategoryConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> categoryLessThan(
    BucketCategory? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'category',
      value: _destinyInventoryBucketDefinitionBucketCategoryConverter
          .toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> categoryBetween(
    BucketCategory? lower,
    BucketCategory? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'category',
      lower: _destinyInventoryBucketDefinitionBucketCategoryConverter
          .toIsar(lower),
      includeLower: includeLower,
      upper: _destinyInventoryBucketDefinitionBucketCategoryConverter
          .toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> displayPropertiesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displayProperties',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> displayPropertiesEqualTo(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayProperties',
      value:
          _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
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
          _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
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
          _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
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
          _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> displayPropertiesStartsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displayProperties',
      value:
          _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> displayPropertiesEndsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displayProperties',
      value:
          _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
          DestinyInventoryBucketDefinition, QAfterFilterCondition>
      displayPropertiesContains(DestinyDisplayPropertiesDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displayProperties',
      value:
          _destinyInventoryBucketDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
          DestinyInventoryBucketDefinition, QAfterFilterCondition>
      displayPropertiesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displayProperties',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> enabledIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'enabled',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> enabledEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'enabled',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> fifoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'fifo',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> fifoEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fifo',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> hasTransferDestinationIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hasTransferDestination',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> hasTransferDestinationEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hasTransferDestination',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> hashEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> hashGreaterThan(
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

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> hashLessThan(
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

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> hashBetween(
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

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> indexGreaterThan(
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

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> indexLessThan(
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

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> indexBetween(
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

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> itemCountIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'itemCount',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> itemCountEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'itemCount',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> itemCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'itemCount',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> itemCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'itemCount',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> itemCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'itemCount',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> locationIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'location',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> locationEqualTo(ItemLocation? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'location',
      value:
          _destinyInventoryBucketDefinitionItemLocationConverter.toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> locationGreaterThan(
    ItemLocation? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'location',
      value:
          _destinyInventoryBucketDefinitionItemLocationConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> locationLessThan(
    ItemLocation? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'location',
      value:
          _destinyInventoryBucketDefinitionItemLocationConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> locationBetween(
    ItemLocation? lower,
    ItemLocation? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'location',
      lower:
          _destinyInventoryBucketDefinitionItemLocationConverter.toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryBucketDefinitionItemLocationConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> scopeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'scope',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterFilterCondition> scopeEqualTo(BucketScope? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'scope',
      value:
          _destinyInventoryBucketDefinitionBucketScopeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> scopeGreaterThan(
    BucketScope? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'scope',
      value:
          _destinyInventoryBucketDefinitionBucketScopeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> scopeLessThan(
    BucketScope? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'scope',
      value:
          _destinyInventoryBucketDefinitionBucketScopeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterFilterCondition> scopeBetween(
    BucketScope? lower,
    BucketScope? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'scope',
      lower:
          _destinyInventoryBucketDefinitionBucketScopeConverter.toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyInventoryBucketDefinitionBucketScopeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }
}

extension DestinyInventoryBucketDefinitionQueryLinks on QueryBuilder<
    DestinyInventoryBucketDefinition,
    DestinyInventoryBucketDefinition,
    QFilterCondition> {}

extension DestinyInventoryBucketDefinitionQueryWhereSortBy on QueryBuilder<
    DestinyInventoryBucketDefinition,
    DestinyInventoryBucketDefinition,
    QSortBy> {
  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByBucketOrder() {
    return addSortByInternal('bucketOrder', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByBucketOrderDesc() {
    return addSortByInternal('bucketOrder', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByCategory() {
    return addSortByInternal('category', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByCategoryDesc() {
    return addSortByInternal('category', Sort.desc);
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterSortBy> sortByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterSortBy> sortByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByEnabled() {
    return addSortByInternal('enabled', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByEnabledDesc() {
    return addSortByInternal('enabled', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByFifo() {
    return addSortByInternal('fifo', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByFifoDesc() {
    return addSortByInternal('fifo', Sort.desc);
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterSortBy> sortByHasTransferDestination() {
    return addSortByInternal('hasTransferDestination', Sort.asc);
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterSortBy> sortByHasTransferDestinationDesc() {
    return addSortByInternal('hasTransferDestination', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByItemCount() {
    return addSortByInternal('itemCount', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByItemCountDesc() {
    return addSortByInternal('itemCount', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByLocation() {
    return addSortByInternal('location', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByLocationDesc() {
    return addSortByInternal('location', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByScope() {
    return addSortByInternal('scope', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> sortByScopeDesc() {
    return addSortByInternal('scope', Sort.desc);
  }
}

extension DestinyInventoryBucketDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyInventoryBucketDefinition,
    DestinyInventoryBucketDefinition,
    QSortThenBy> {
  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByBucketOrder() {
    return addSortByInternal('bucketOrder', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByBucketOrderDesc() {
    return addSortByInternal('bucketOrder', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByCategory() {
    return addSortByInternal('category', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByCategoryDesc() {
    return addSortByInternal('category', Sort.desc);
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterSortBy> thenByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterSortBy> thenByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByEnabled() {
    return addSortByInternal('enabled', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByEnabledDesc() {
    return addSortByInternal('enabled', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByFifo() {
    return addSortByInternal('fifo', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByFifoDesc() {
    return addSortByInternal('fifo', Sort.desc);
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterSortBy> thenByHasTransferDestination() {
    return addSortByInternal('hasTransferDestination', Sort.asc);
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QAfterSortBy> thenByHasTransferDestinationDesc() {
    return addSortByInternal('hasTransferDestination', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByItemCount() {
    return addSortByInternal('itemCount', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByItemCountDesc() {
    return addSortByInternal('itemCount', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByLocation() {
    return addSortByInternal('location', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByLocationDesc() {
    return addSortByInternal('location', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByScope() {
    return addSortByInternal('scope', Sort.asc);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QAfterSortBy> thenByScopeDesc() {
    return addSortByInternal('scope', Sort.desc);
  }
}

extension DestinyInventoryBucketDefinitionQueryWhereDistinct on QueryBuilder<
    DestinyInventoryBucketDefinition,
    DestinyInventoryBucketDefinition,
    QDistinct> {
  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QDistinct> distinctByBucketOrder() {
    return addDistinctByInternal('bucketOrder');
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QDistinct> distinctByCategory() {
    return addDistinctByInternal('category');
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QDistinct> distinctByDisplayProperties({bool caseSensitive = true}) {
    return addDistinctByInternal('displayProperties',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QDistinct> distinctByEnabled() {
    return addDistinctByInternal('enabled');
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QDistinct> distinctByFifo() {
    return addDistinctByInternal('fifo');
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition,
      QDistinct> distinctByHasTransferDestination() {
    return addDistinctByInternal('hasTransferDestination');
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QDistinct> distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QDistinct> distinctByItemCount() {
    return addDistinctByInternal('itemCount');
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QDistinct> distinctByLocation() {
    return addDistinctByInternal('location');
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QDistinct> distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }

  QueryBuilder<DestinyInventoryBucketDefinition,
      DestinyInventoryBucketDefinition, QDistinct> distinctByScope() {
    return addDistinctByInternal('scope');
  }
}

extension DestinyInventoryBucketDefinitionQueryProperty on QueryBuilder<
    DestinyInventoryBucketDefinition,
    DestinyInventoryBucketDefinition,
    QQueryProperty> {
  QueryBuilder<DestinyInventoryBucketDefinition, int?, QQueryOperations>
      bucketOrderProperty() {
    return addPropertyNameInternal('bucketOrder');
  }

  QueryBuilder<DestinyInventoryBucketDefinition, BucketCategory?,
      QQueryOperations> categoryProperty() {
    return addPropertyNameInternal('category');
  }

  QueryBuilder<
      DestinyInventoryBucketDefinition,
      DestinyDisplayPropertiesDefinition?,
      QQueryOperations> displayPropertiesProperty() {
    return addPropertyNameInternal('displayProperties');
  }

  QueryBuilder<DestinyInventoryBucketDefinition, bool?, QQueryOperations>
      enabledProperty() {
    return addPropertyNameInternal('enabled');
  }

  QueryBuilder<DestinyInventoryBucketDefinition, bool?, QQueryOperations>
      fifoProperty() {
    return addPropertyNameInternal('fifo');
  }

  QueryBuilder<DestinyInventoryBucketDefinition, bool?, QQueryOperations>
      hasTransferDestinationProperty() {
    return addPropertyNameInternal('hasTransferDestination');
  }

  QueryBuilder<DestinyInventoryBucketDefinition, int?, QQueryOperations>
      hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyInventoryBucketDefinition, int?, QQueryOperations>
      indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinyInventoryBucketDefinition, int?, QQueryOperations>
      itemCountProperty() {
    return addPropertyNameInternal('itemCount');
  }

  QueryBuilder<DestinyInventoryBucketDefinition, ItemLocation?,
      QQueryOperations> locationProperty() {
    return addPropertyNameInternal('location');
  }

  QueryBuilder<DestinyInventoryBucketDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }

  QueryBuilder<DestinyInventoryBucketDefinition, BucketScope?, QQueryOperations>
      scopeProperty() {
    return addPropertyNameInternal('scope');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyInventoryBucketDefinition _$DestinyInventoryBucketDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyInventoryBucketDefinition()
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..scope = decodeBucketScope(json['scope'])
      ..category = decodeBucketCategory(json['category'])
      ..bucketOrder = json['bucketOrder'] as int?
      ..itemCount = json['itemCount'] as int?
      ..location = decodeItemLocation(json['location'])
      ..hasTransferDestination = json['hasTransferDestination'] as bool?
      ..enabled = json['enabled'] as bool?
      ..fifo = json['fifo'] as bool?
      ..hash = json['hash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinyInventoryBucketDefinitionToJson(
        DestinyInventoryBucketDefinition instance) =>
    <String, dynamic>{
      'displayProperties': instance.displayProperties,
      'scope': encodeBucketScope(instance.scope),
      'category': encodeBucketCategory(instance.category),
      'bucketOrder': instance.bucketOrder,
      'itemCount': instance.itemCount,
      'location': encodeItemLocation(instance.location),
      'hasTransferDestination': instance.hasTransferDestination,
      'enabled': instance.enabled,
      'fifo': instance.fifo,
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
