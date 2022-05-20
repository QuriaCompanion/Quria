// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_equipment_slot_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDestinyEquipmentSlotDefinitionCollection on Isar {
  IsarCollection<DestinyEquipmentSlotDefinition>
      get destinyEquipmentSlotDefinitions => getCollection();
}

const DestinyEquipmentSlotDefinitionSchema = CollectionSchema(
  name: 'DestinyEquipmentSlotDefinition',
  schema:
      '{"name":"DestinyEquipmentSlotDefinition","idName":"hash","properties":[{"name":"applyCustomArtDyes","type":"Bool"},{"name":"artDyeChannels","type":"StringList"},{"name":"bucketTypeHash","type":"Long"},{"name":"displayProperties","type":"String"},{"name":"equipmentCategoryHash","type":"Long"},{"name":"index","type":"Long"},{"name":"redacted","type":"Bool"}],"indexes":[],"links":[]}',
  idName: 'hash',
  propertyIds: {
    'applyCustomArtDyes': 0,
    'artDyeChannels': 1,
    'bucketTypeHash': 2,
    'displayProperties': 3,
    'equipmentCategoryHash': 4,
    'index': 5,
    'redacted': 6
  },
  listProperties: {'artDyeChannels'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _destinyEquipmentSlotDefinitionGetId,
  setId: _destinyEquipmentSlotDefinitionSetId,
  getLinks: _destinyEquipmentSlotDefinitionGetLinks,
  attachLinks: _destinyEquipmentSlotDefinitionAttachLinks,
  serializeNative: _destinyEquipmentSlotDefinitionSerializeNative,
  deserializeNative: _destinyEquipmentSlotDefinitionDeserializeNative,
  deserializePropNative: _destinyEquipmentSlotDefinitionDeserializePropNative,
  serializeWeb: _destinyEquipmentSlotDefinitionSerializeWeb,
  deserializeWeb: _destinyEquipmentSlotDefinitionDeserializeWeb,
  deserializePropWeb: _destinyEquipmentSlotDefinitionDeserializePropWeb,
  version: 3,
);

int? _destinyEquipmentSlotDefinitionGetId(
    DestinyEquipmentSlotDefinition object) {
  if (object.hash == Isar.autoIncrement) {
    return null;
  } else {
    return object.hash;
  }
}

void _destinyEquipmentSlotDefinitionSetId(
    DestinyEquipmentSlotDefinition object, int id) {
  object.hash = id;
}

List<IsarLinkBase> _destinyEquipmentSlotDefinitionGetLinks(
    DestinyEquipmentSlotDefinition object) {
  return [];
}

const _destinyEquipmentSlotDefinitionDestinyArtDyeReferenceListConverter =
    DestinyArtDyeReferenceListConverter();
const _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter =
    DestinyDisplayPropertiesDefinitionConverter();

void _destinyEquipmentSlotDefinitionSerializeNative(
    IsarCollection<DestinyEquipmentSlotDefinition> collection,
    IsarRawObject rawObj,
    DestinyEquipmentSlotDefinition object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.applyCustomArtDyes;
  final applyCustomArtDyes = value0;
  final value1 =
      _destinyEquipmentSlotDefinitionDestinyArtDyeReferenceListConverter
          .toIsar(object.artDyeChannels);
  dynamicSize += (value1?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList1;
  if (value1 != null) {
    bytesList1 = [];
    for (var str in value1) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList1.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final artDyeChannels = bytesList1;
  final value2 = object.bucketTypeHash;
  final bucketTypeHash = value2;
  final value3 =
      _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties);
  IsarUint8List? displayProperties;
  if (value3 != null) {
    displayProperties = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (displayProperties?.length ?? 0) as int;
  final value4 = object.equipmentCategoryHash;
  final equipmentCategoryHash = value4;
  final value5 = object.index;
  final index = value5;
  final value6 = object.redacted;
  final redacted = value6;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], applyCustomArtDyes);
  writer.writeStringList(offsets[1], artDyeChannels);
  writer.writeLong(offsets[2], bucketTypeHash);
  writer.writeBytes(offsets[3], displayProperties);
  writer.writeLong(offsets[4], equipmentCategoryHash);
  writer.writeLong(offsets[5], index);
  writer.writeBool(offsets[6], redacted);
}

DestinyEquipmentSlotDefinition _destinyEquipmentSlotDefinitionDeserializeNative(
    IsarCollection<DestinyEquipmentSlotDefinition> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = DestinyEquipmentSlotDefinition();
  object.applyCustomArtDyes = reader.readBoolOrNull(offsets[0]);
  object.artDyeChannels =
      _destinyEquipmentSlotDefinitionDestinyArtDyeReferenceListConverter
          .fromIsar(reader.readStringList(offsets[1]));
  object.bucketTypeHash = reader.readLongOrNull(offsets[2]);
  object.displayProperties =
      _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offsets[3]));
  object.equipmentCategoryHash = reader.readLongOrNull(offsets[4]);
  object.hash = id;
  object.index = reader.readLongOrNull(offsets[5]);
  object.redacted = reader.readBoolOrNull(offsets[6]);
  return object;
}

P _destinyEquipmentSlotDefinitionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (_destinyEquipmentSlotDefinitionDestinyArtDyeReferenceListConverter
          .fromIsar(reader.readStringList(offset))) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (_destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _destinyEquipmentSlotDefinitionSerializeWeb(
    IsarCollection<DestinyEquipmentSlotDefinition> collection,
    DestinyEquipmentSlotDefinition object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'applyCustomArtDyes', object.applyCustomArtDyes);
  IsarNative.jsObjectSet(
      jsObj,
      'artDyeChannels',
      _destinyEquipmentSlotDefinitionDestinyArtDyeReferenceListConverter
          .toIsar(object.artDyeChannels));
  IsarNative.jsObjectSet(jsObj, 'bucketTypeHash', object.bucketTypeHash);
  IsarNative.jsObjectSet(
      jsObj,
      'displayProperties',
      _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
          .toIsar(object.displayProperties));
  IsarNative.jsObjectSet(
      jsObj, 'equipmentCategoryHash', object.equipmentCategoryHash);
  IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
  IsarNative.jsObjectSet(jsObj, 'index', object.index);
  IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
  return jsObj;
}

DestinyEquipmentSlotDefinition _destinyEquipmentSlotDefinitionDeserializeWeb(
    IsarCollection<DestinyEquipmentSlotDefinition> collection, dynamic jsObj) {
  final object = DestinyEquipmentSlotDefinition();
  object.applyCustomArtDyes =
      IsarNative.jsObjectGet(jsObj, 'applyCustomArtDyes');
  object.artDyeChannels =
      _destinyEquipmentSlotDefinitionDestinyArtDyeReferenceListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'artDyeChannels') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>());
  object.bucketTypeHash = IsarNative.jsObjectGet(jsObj, 'bucketTypeHash');
  object.displayProperties =
      _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'));
  object.equipmentCategoryHash =
      IsarNative.jsObjectGet(jsObj, 'equipmentCategoryHash');
  object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
  object.index = IsarNative.jsObjectGet(jsObj, 'index');
  object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
  return object;
}

P _destinyEquipmentSlotDefinitionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'applyCustomArtDyes':
      return (IsarNative.jsObjectGet(jsObj, 'applyCustomArtDyes')) as P;
    case 'artDyeChannels':
      return (_destinyEquipmentSlotDefinitionDestinyArtDyeReferenceListConverter
          .fromIsar((IsarNative.jsObjectGet(jsObj, 'artDyeChannels') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>())) as P;
    case 'bucketTypeHash':
      return (IsarNative.jsObjectGet(jsObj, 'bucketTypeHash')) as P;
    case 'displayProperties':
      return (_destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'))) as P;
    case 'equipmentCategoryHash':
      return (IsarNative.jsObjectGet(jsObj, 'equipmentCategoryHash')) as P;
    case 'hash':
      return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
    case 'index':
      return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
    case 'redacted':
      return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _destinyEquipmentSlotDefinitionAttachLinks(
    IsarCollection col, int id, DestinyEquipmentSlotDefinition object) {}

extension DestinyEquipmentSlotDefinitionQueryWhereSort on QueryBuilder<
    DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition, QWhere> {
  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterWhere> anyHash() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DestinyEquipmentSlotDefinitionQueryWhere on QueryBuilder<
    DestinyEquipmentSlotDefinition,
    DestinyEquipmentSlotDefinition,
    QWhereClause> {
  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterWhereClause> hashEqualTo(int hash) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: hash,
      includeLower: true,
      upper: hash,
      includeUpper: true,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterWhereClause> hashGreaterThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: hash, includeLower: include),
    );
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterWhereClause> hashLessThan(int hash, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: hash, includeUpper: include),
    );
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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

extension DestinyEquipmentSlotDefinitionQueryFilter on QueryBuilder<
    DestinyEquipmentSlotDefinition,
    DestinyEquipmentSlotDefinition,
    QFilterCondition> {
  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> applyCustomArtDyesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'applyCustomArtDyes',
      value: null,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> applyCustomArtDyesEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'applyCustomArtDyes',
      value: value,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> artDyeChannelsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'artDyeChannels',
      value: null,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> artDyeChannelsAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'artDyeChannels',
      value: null,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> artDyeChannelsAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'artDyeChannels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> artDyeChannelsAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'artDyeChannels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> artDyeChannelsAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'artDyeChannels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> artDyeChannelsAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'artDyeChannels',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> artDyeChannelsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'artDyeChannels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> artDyeChannelsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'artDyeChannels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
          QAfterFilterCondition>
      artDyeChannelsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'artDyeChannels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
          QAfterFilterCondition>
      artDyeChannelsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'artDyeChannels',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> bucketTypeHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'bucketTypeHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> bucketTypeHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'bucketTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> bucketTypeHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'bucketTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> bucketTypeHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'bucketTypeHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> bucketTypeHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'bucketTypeHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> displayPropertiesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displayProperties',
      value: null,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> displayPropertiesEqualTo(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayProperties',
      value:
          _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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
          _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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
          _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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
          _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> displayPropertiesStartsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displayProperties',
      value:
          _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> displayPropertiesEndsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displayProperties',
      value:
          _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
          QAfterFilterCondition>
      displayPropertiesContains(DestinyDisplayPropertiesDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displayProperties',
      value:
          _destinyEquipmentSlotDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
          QAfterFilterCondition>
      displayPropertiesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displayProperties',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> equipmentCategoryHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'equipmentCategoryHash',
      value: null,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> equipmentCategoryHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'equipmentCategoryHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> equipmentCategoryHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'equipmentCategoryHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> equipmentCategoryHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'equipmentCategoryHash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> equipmentCategoryHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'equipmentCategoryHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> hashEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
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

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }
}

extension DestinyEquipmentSlotDefinitionQueryLinks on QueryBuilder<
    DestinyEquipmentSlotDefinition,
    DestinyEquipmentSlotDefinition,
    QFilterCondition> {}

extension DestinyEquipmentSlotDefinitionQueryWhereSortBy on QueryBuilder<
    DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition, QSortBy> {
  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByApplyCustomArtDyes() {
    return addSortByInternal('applyCustomArtDyes', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByApplyCustomArtDyesDesc() {
    return addSortByInternal('applyCustomArtDyes', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByBucketTypeHash() {
    return addSortByInternal('bucketTypeHash', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByBucketTypeHashDesc() {
    return addSortByInternal('bucketTypeHash', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByEquipmentCategoryHash() {
    return addSortByInternal('equipmentCategoryHash', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByEquipmentCategoryHashDesc() {
    return addSortByInternal('equipmentCategoryHash', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }
}

extension DestinyEquipmentSlotDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyEquipmentSlotDefinition,
    DestinyEquipmentSlotDefinition,
    QSortThenBy> {
  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByApplyCustomArtDyes() {
    return addSortByInternal('applyCustomArtDyes', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByApplyCustomArtDyesDesc() {
    return addSortByInternal('applyCustomArtDyes', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByBucketTypeHash() {
    return addSortByInternal('bucketTypeHash', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByBucketTypeHashDesc() {
    return addSortByInternal('bucketTypeHash', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByEquipmentCategoryHash() {
    return addSortByInternal('equipmentCategoryHash', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByEquipmentCategoryHashDesc() {
    return addSortByInternal('equipmentCategoryHash', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QAfterSortBy> thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }
}

extension DestinyEquipmentSlotDefinitionQueryWhereDistinct on QueryBuilder<
    DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition, QDistinct> {
  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QDistinct> distinctByApplyCustomArtDyes() {
    return addDistinctByInternal('applyCustomArtDyes');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QDistinct> distinctByBucketTypeHash() {
    return addDistinctByInternal('bucketTypeHash');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QDistinct> distinctByDisplayProperties({bool caseSensitive = true}) {
    return addDistinctByInternal('displayProperties',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QDistinct> distinctByEquipmentCategoryHash() {
    return addDistinctByInternal('equipmentCategoryHash');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QDistinct> distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, DestinyEquipmentSlotDefinition,
      QDistinct> distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }
}

extension DestinyEquipmentSlotDefinitionQueryProperty on QueryBuilder<
    DestinyEquipmentSlotDefinition,
    DestinyEquipmentSlotDefinition,
    QQueryProperty> {
  QueryBuilder<DestinyEquipmentSlotDefinition, bool?, QQueryOperations>
      applyCustomArtDyesProperty() {
    return addPropertyNameInternal('applyCustomArtDyes');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, List<DestinyArtDyeReference>?,
      QQueryOperations> artDyeChannelsProperty() {
    return addPropertyNameInternal('artDyeChannels');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, int?, QQueryOperations>
      bucketTypeHashProperty() {
    return addPropertyNameInternal('bucketTypeHash');
  }

  QueryBuilder<
      DestinyEquipmentSlotDefinition,
      DestinyDisplayPropertiesDefinition?,
      QQueryOperations> displayPropertiesProperty() {
    return addPropertyNameInternal('displayProperties');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, int?, QQueryOperations>
      equipmentCategoryHashProperty() {
    return addPropertyNameInternal('equipmentCategoryHash');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, int?, QQueryOperations>
      hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, int?, QQueryOperations>
      indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinyEquipmentSlotDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyEquipmentSlotDefinition _$DestinyEquipmentSlotDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyEquipmentSlotDefinition()
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..equipmentCategoryHash = json['equipmentCategoryHash'] as int?
      ..bucketTypeHash = json['bucketTypeHash'] as int?
      ..applyCustomArtDyes = json['applyCustomArtDyes'] as bool?
      ..artDyeChannels = (json['artDyeChannels'] as List<dynamic>?)
          ?.map(
              (e) => DestinyArtDyeReference.fromJson(e as Map<String, dynamic>))
          .toList()
      ..hash = json['hash'] as int?
      ..index = json['index'] as int?
      ..redacted = json['redacted'] as bool?;

Map<String, dynamic> _$DestinyEquipmentSlotDefinitionToJson(
        DestinyEquipmentSlotDefinition instance) =>
    <String, dynamic>{
      'displayProperties': instance.displayProperties,
      'equipmentCategoryHash': instance.equipmentCategoryHash,
      'bucketTypeHash': instance.bucketTypeHash,
      'applyCustomArtDyes': instance.applyCustomArtDyes,
      'artDyeChannels': instance.artDyeChannels,
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
