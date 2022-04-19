// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destiny_presentation_node_definition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetDestinyPresentationNodeDefinitionCollection on Isar {
  IsarCollection<DestinyPresentationNodeDefinition>
      get destinyPresentationNodeDefinitions {
    return getCollection('DestinyPresentationNodeDefinition');
  }
}

final DestinyPresentationNodeDefinitionSchema = CollectionSchema(
  name: 'DestinyPresentationNodeDefinition',
  schema:
      '{"name":"DestinyPresentationNodeDefinition","idName":"hash","properties":[{"name":"children","type":"String"},{"name":"completionRecordHash","type":"Long"},{"name":"disableChildSubscreenNavigation","type":"Bool"},{"name":"displayProperties","type":"String"},{"name":"displayStyle","type":"Long"},{"name":"index","type":"Long"},{"name":"maxCategoryRecordScore","type":"Long"},{"name":"nodeType","type":"Long"},{"name":"objectiveHash","type":"Long"},{"name":"originalIcon","type":"String"},{"name":"parentNodeHashes","type":"LongList"},{"name":"presentationNodeType","type":"Long"},{"name":"redacted","type":"Bool"},{"name":"requirements","type":"String"},{"name":"rootViewIcon","type":"String"},{"name":"scope","type":"Long"},{"name":"screenStyle","type":"Long"},{"name":"traitHashes","type":"LongList"},{"name":"traitIds","type":"StringList"}],"indexes":[],"links":[]}',
  nativeAdapter: const _DestinyPresentationNodeDefinitionNativeAdapter(),
  webAdapter: const _DestinyPresentationNodeDefinitionWebAdapter(),
  idName: 'hash',
  propertyIds: {
    'children': 0,
    'completionRecordHash': 1,
    'disableChildSubscreenNavigation': 2,
    'displayProperties': 3,
    'displayStyle': 4,
    'index': 5,
    'maxCategoryRecordScore': 6,
    'nodeType': 7,
    'objectiveHash': 8,
    'originalIcon': 9,
    'parentNodeHashes': 10,
    'presentationNodeType': 11,
    'redacted': 12,
    'requirements': 13,
    'rootViewIcon': 14,
    'scope': 15,
    'screenStyle': 16,
    'traitHashes': 17,
    'traitIds': 18
  },
  listProperties: {'parentNodeHashes', 'traitHashes', 'traitIds'},
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

const _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter =
    DestinyPresentationNodeChildrenBlockConverter();
const _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter =
    DestinyDisplayPropertiesDefinitionConverter();
const _destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter =
    DestinyPresentationDisplayStyleConverter();
const _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter =
    DestinyPresentationNodeTypeConverter();
const _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter =
    DestinyPresentationNodeRequirementsBlockConverter();
const _destinyPresentationNodeDefinitionDestinyScopeConverter =
    DestinyScopeConverter();
const _destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter =
    DestinyPresentationScreenStyleConverter();

class _DestinyPresentationNodeDefinitionWebAdapter
    extends IsarWebTypeAdapter<DestinyPresentationNodeDefinition> {
  const _DestinyPresentationNodeDefinitionWebAdapter();

  @override
  Object serialize(IsarCollection<DestinyPresentationNodeDefinition> collection,
      DestinyPresentationNodeDefinition object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(
        jsObj,
        'children',
        _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
            .toIsar(object.children));
    IsarNative.jsObjectSet(
        jsObj, 'completionRecordHash', object.completionRecordHash);
    IsarNative.jsObjectSet(jsObj, 'disableChildSubscreenNavigation',
        object.disableChildSubscreenNavigation);
    IsarNative.jsObjectSet(
        jsObj,
        'displayProperties',
        _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
            .toIsar(object.displayProperties));
    IsarNative.jsObjectSet(
        jsObj,
        'displayStyle',
        _destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
            .toIsar(object.displayStyle));
    IsarNative.jsObjectSet(jsObj, 'hash', object.hash);
    IsarNative.jsObjectSet(jsObj, 'index', object.index);
    IsarNative.jsObjectSet(
        jsObj, 'maxCategoryRecordScore', object.maxCategoryRecordScore);
    IsarNative.jsObjectSet(
        jsObj,
        'nodeType',
        _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .toIsar(object.nodeType));
    IsarNative.jsObjectSet(jsObj, 'objectiveHash', object.objectiveHash);
    IsarNative.jsObjectSet(jsObj, 'originalIcon', object.originalIcon);
    IsarNative.jsObjectSet(jsObj, 'parentNodeHashes', object.parentNodeHashes);
    IsarNative.jsObjectSet(
        jsObj,
        'presentationNodeType',
        _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .toIsar(object.presentationNodeType));
    IsarNative.jsObjectSet(jsObj, 'redacted', object.redacted);
    IsarNative.jsObjectSet(
        jsObj,
        'requirements',
        _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
            .toIsar(object.requirements));
    IsarNative.jsObjectSet(jsObj, 'rootViewIcon', object.rootViewIcon);
    IsarNative.jsObjectSet(
        jsObj,
        'scope',
        _destinyPresentationNodeDefinitionDestinyScopeConverter
            .toIsar(object.scope));
    IsarNative.jsObjectSet(
        jsObj,
        'screenStyle',
        _destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
            .toIsar(object.screenStyle));
    IsarNative.jsObjectSet(jsObj, 'traitHashes', object.traitHashes);
    IsarNative.jsObjectSet(jsObj, 'traitIds', object.traitIds);
    return jsObj;
  }

  @override
  DestinyPresentationNodeDefinition deserialize(
      IsarCollection<DestinyPresentationNodeDefinition> collection,
      dynamic jsObj) {
    final object = DestinyPresentationNodeDefinition();
    object.children =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'children'));
    object.completionRecordHash =
        IsarNative.jsObjectGet(jsObj, 'completionRecordHash');
    object.disableChildSubscreenNavigation =
        IsarNative.jsObjectGet(jsObj, 'disableChildSubscreenNavigation');
    object.displayProperties =
        _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'));
    object.displayStyle =
        _destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayStyle'));
    object.hash = IsarNative.jsObjectGet(jsObj, 'hash');
    object.index = IsarNative.jsObjectGet(jsObj, 'index');
    object.maxCategoryRecordScore =
        IsarNative.jsObjectGet(jsObj, 'maxCategoryRecordScore');
    object.nodeType =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'nodeType'));
    object.objectiveHash = IsarNative.jsObjectGet(jsObj, 'objectiveHash');
    object.originalIcon = IsarNative.jsObjectGet(jsObj, 'originalIcon');
    object.parentNodeHashes =
        (IsarNative.jsObjectGet(jsObj, 'parentNodeHashes') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>();
    object.presentationNodeType =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'presentationNodeType'));
    object.redacted = IsarNative.jsObjectGet(jsObj, 'redacted');
    object.requirements =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'requirements'));
    object.rootViewIcon = IsarNative.jsObjectGet(jsObj, 'rootViewIcon');
    object.scope = _destinyPresentationNodeDefinitionDestinyScopeConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'scope'));
    object.screenStyle =
        _destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'screenStyle'));
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
      case 'children':
        return (_destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'children'))) as P;
      case 'completionRecordHash':
        return (IsarNative.jsObjectGet(jsObj, 'completionRecordHash')) as P;
      case 'disableChildSubscreenNavigation':
        return (IsarNative.jsObjectGet(
            jsObj, 'disableChildSubscreenNavigation')) as P;
      case 'displayProperties':
        return (_destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayProperties'))) as P;
      case 'displayStyle':
        return (_destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'displayStyle'))) as P;
      case 'hash':
        return (IsarNative.jsObjectGet(jsObj, 'hash')) as P;
      case 'index':
        return (IsarNative.jsObjectGet(jsObj, 'index')) as P;
      case 'maxCategoryRecordScore':
        return (IsarNative.jsObjectGet(jsObj, 'maxCategoryRecordScore')) as P;
      case 'nodeType':
        return (_destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'nodeType'))) as P;
      case 'objectiveHash':
        return (IsarNative.jsObjectGet(jsObj, 'objectiveHash')) as P;
      case 'originalIcon':
        return (IsarNative.jsObjectGet(jsObj, 'originalIcon')) as P;
      case 'parentNodeHashes':
        return ((IsarNative.jsObjectGet(jsObj, 'parentNodeHashes') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>()) as P;
      case 'presentationNodeType':
        return (_destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(
                IsarNative.jsObjectGet(jsObj, 'presentationNodeType'))) as P;
      case 'redacted':
        return (IsarNative.jsObjectGet(jsObj, 'redacted')) as P;
      case 'requirements':
        return (_destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'requirements'))) as P;
      case 'rootViewIcon':
        return (IsarNative.jsObjectGet(jsObj, 'rootViewIcon')) as P;
      case 'scope':
        return (_destinyPresentationNodeDefinitionDestinyScopeConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'scope'))) as P;
      case 'screenStyle':
        return (_destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'screenStyle'))) as P;
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
  void attachLinks(
      Isar isar, int id, DestinyPresentationNodeDefinition object) {}
}

class _DestinyPresentationNodeDefinitionNativeAdapter
    extends IsarNativeTypeAdapter<DestinyPresentationNodeDefinition> {
  const _DestinyPresentationNodeDefinitionNativeAdapter();

  @override
  void serialize(
      IsarCollection<DestinyPresentationNodeDefinition> collection,
      IsarRawObject rawObj,
      DestinyPresentationNodeDefinition object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
            .toIsar(object.children);
    IsarUint8List? _children;
    if (value0 != null) {
      _children = IsarBinaryWriter.utf8Encoder.convert(value0);
    }
    dynamicSize += (_children?.length ?? 0) as int;
    final value1 = object.completionRecordHash;
    final _completionRecordHash = value1;
    final value2 = object.disableChildSubscreenNavigation;
    final _disableChildSubscreenNavigation = value2;
    final value3 =
        _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
            .toIsar(object.displayProperties);
    IsarUint8List? _displayProperties;
    if (value3 != null) {
      _displayProperties = IsarBinaryWriter.utf8Encoder.convert(value3);
    }
    dynamicSize += (_displayProperties?.length ?? 0) as int;
    final value4 =
        _destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
            .toIsar(object.displayStyle);
    final _displayStyle = value4;
    final value5 = object.index;
    final _index = value5;
    final value6 = object.maxCategoryRecordScore;
    final _maxCategoryRecordScore = value6;
    final value7 =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .toIsar(object.nodeType);
    final _nodeType = value7;
    final value8 = object.objectiveHash;
    final _objectiveHash = value8;
    final value9 = object.originalIcon;
    IsarUint8List? _originalIcon;
    if (value9 != null) {
      _originalIcon = IsarBinaryWriter.utf8Encoder.convert(value9);
    }
    dynamicSize += (_originalIcon?.length ?? 0) as int;
    final value10 = object.parentNodeHashes;
    dynamicSize += (value10?.length ?? 0) * 8;
    final _parentNodeHashes = value10;
    final value11 =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .toIsar(object.presentationNodeType);
    final _presentationNodeType = value11;
    final value12 = object.redacted;
    final _redacted = value12;
    final value13 =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
            .toIsar(object.requirements);
    IsarUint8List? _requirements;
    if (value13 != null) {
      _requirements = IsarBinaryWriter.utf8Encoder.convert(value13);
    }
    dynamicSize += (_requirements?.length ?? 0) as int;
    final value14 = object.rootViewIcon;
    IsarUint8List? _rootViewIcon;
    if (value14 != null) {
      _rootViewIcon = IsarBinaryWriter.utf8Encoder.convert(value14);
    }
    dynamicSize += (_rootViewIcon?.length ?? 0) as int;
    final value15 = _destinyPresentationNodeDefinitionDestinyScopeConverter
        .toIsar(object.scope);
    final _scope = value15;
    final value16 =
        _destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
            .toIsar(object.screenStyle);
    final _screenStyle = value16;
    final value17 = object.traitHashes;
    dynamicSize += (value17?.length ?? 0) * 8;
    final _traitHashes = value17;
    final value18 = object.traitIds;
    dynamicSize += (value18?.length ?? 0) * 8;
    List<IsarUint8List?>? bytesList18;
    if (value18 != null) {
      bytesList18 = [];
      for (var str in value18) {
        final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
        bytesList18.add(bytes);
        dynamicSize += bytes.length as int;
      }
    }
    final _traitIds = bytesList18;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _children);
    writer.writeLong(offsets[1], _completionRecordHash);
    writer.writeBool(offsets[2], _disableChildSubscreenNavigation);
    writer.writeBytes(offsets[3], _displayProperties);
    writer.writeLong(offsets[4], _displayStyle);
    writer.writeLong(offsets[5], _index);
    writer.writeLong(offsets[6], _maxCategoryRecordScore);
    writer.writeLong(offsets[7], _nodeType);
    writer.writeLong(offsets[8], _objectiveHash);
    writer.writeBytes(offsets[9], _originalIcon);
    writer.writeLongList(offsets[10], _parentNodeHashes);
    writer.writeLong(offsets[11], _presentationNodeType);
    writer.writeBool(offsets[12], _redacted);
    writer.writeBytes(offsets[13], _requirements);
    writer.writeBytes(offsets[14], _rootViewIcon);
    writer.writeLong(offsets[15], _scope);
    writer.writeLong(offsets[16], _screenStyle);
    writer.writeLongList(offsets[17], _traitHashes);
    writer.writeStringList(offsets[18], _traitIds);
  }

  @override
  DestinyPresentationNodeDefinition deserialize(
      IsarCollection<DestinyPresentationNodeDefinition> collection,
      int id,
      IsarBinaryReader reader,
      List<int> offsets) {
    final object = DestinyPresentationNodeDefinition();
    object.children =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
            .fromIsar(reader.readStringOrNull(offsets[0]));
    object.completionRecordHash = reader.readLongOrNull(offsets[1]);
    object.disableChildSubscreenNavigation = reader.readBoolOrNull(offsets[2]);
    object.displayProperties =
        _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(reader.readStringOrNull(offsets[3]));
    object.displayStyle =
        _destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
            .fromIsar(reader.readLongOrNull(offsets[4]));
    object.hash = id;
    object.index = reader.readLongOrNull(offsets[5]);
    object.maxCategoryRecordScore = reader.readLongOrNull(offsets[6]);
    object.nodeType =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(reader.readLongOrNull(offsets[7]));
    object.objectiveHash = reader.readLongOrNull(offsets[8]);
    object.originalIcon = reader.readStringOrNull(offsets[9]);
    object.parentNodeHashes = reader.readLongList(offsets[10]);
    object.presentationNodeType =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(reader.readLongOrNull(offsets[11]));
    object.redacted = reader.readBoolOrNull(offsets[12]);
    object.requirements =
        _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
            .fromIsar(reader.readStringOrNull(offsets[13]));
    object.rootViewIcon = reader.readStringOrNull(offsets[14]);
    object.scope = _destinyPresentationNodeDefinitionDestinyScopeConverter
        .fromIsar(reader.readLongOrNull(offsets[15]));
    object.screenStyle =
        _destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
            .fromIsar(reader.readLongOrNull(offsets[16]));
    object.traitHashes = reader.readLongList(offsets[17]);
    object.traitIds = reader.readStringList(offsets[18]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (_destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
            .fromIsar(reader.readStringOrNull(offset))) as P;
      case 1:
        return (reader.readLongOrNull(offset)) as P;
      case 2:
        return (reader.readBoolOrNull(offset)) as P;
      case 3:
        return (_destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
            .fromIsar(reader.readStringOrNull(offset))) as P;
      case 4:
        return (_destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 5:
        return (reader.readLongOrNull(offset)) as P;
      case 6:
        return (reader.readLongOrNull(offset)) as P;
      case 7:
        return (_destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 8:
        return (reader.readLongOrNull(offset)) as P;
      case 9:
        return (reader.readStringOrNull(offset)) as P;
      case 10:
        return (reader.readLongList(offset)) as P;
      case 11:
        return (_destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 12:
        return (reader.readBoolOrNull(offset)) as P;
      case 13:
        return (_destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
            .fromIsar(reader.readStringOrNull(offset))) as P;
      case 14:
        return (reader.readStringOrNull(offset)) as P;
      case 15:
        return (_destinyPresentationNodeDefinitionDestinyScopeConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 16:
        return (_destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
            .fromIsar(reader.readLongOrNull(offset))) as P;
      case 17:
        return (reader.readLongList(offset)) as P;
      case 18:
        return (reader.readStringList(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(
      Isar isar, int id, DestinyPresentationNodeDefinition object) {}
}

extension DestinyPresentationNodeDefinitionQueryWhereSort on QueryBuilder<
    DestinyPresentationNodeDefinition,
    DestinyPresentationNodeDefinition,
    QWhere> {
  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterWhere> anyHash() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension DestinyPresentationNodeDefinitionQueryWhere on QueryBuilder<
    DestinyPresentationNodeDefinition,
    DestinyPresentationNodeDefinition,
    QWhereClause> {
  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterWhereClause> hashEqualTo(int? hash) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [hash],
      includeLower: true,
      upper: [hash],
      includeUpper: true,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterWhereClause> hashGreaterThan(
    int? hash, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [hash],
      includeLower: include,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterWhereClause> hashLessThan(
    int? hash, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [hash],
      includeUpper: include,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterWhereClause> hashBetween(
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

extension DestinyPresentationNodeDefinitionQueryFilter on QueryBuilder<
    DestinyPresentationNodeDefinition,
    DestinyPresentationNodeDefinition,
    QFilterCondition> {
  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> childrenIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'children',
      value: null,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> childrenEqualTo(
    DestinyPresentationNodeChildrenBlock? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'children',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> childrenGreaterThan(
    DestinyPresentationNodeChildrenBlock? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'children',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> childrenLessThan(
    DestinyPresentationNodeChildrenBlock? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'children',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> childrenBetween(
    DestinyPresentationNodeChildrenBlock? lower,
    DestinyPresentationNodeChildrenBlock? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'children',
      lower:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> childrenStartsWith(
    DestinyPresentationNodeChildrenBlock value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'children',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> childrenEndsWith(
    DestinyPresentationNodeChildrenBlock value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'children',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      childrenContains(DestinyPresentationNodeChildrenBlock value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'children',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeChildrenBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      childrenMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'children',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> completionRecordHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'completionRecordHash',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> completionRecordHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'completionRecordHash',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> completionRecordHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'completionRecordHash',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> completionRecordHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'completionRecordHash',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> completionRecordHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'completionRecordHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> disableChildSubscreenNavigationIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'disableChildSubscreenNavigation',
      value: null,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      disableChildSubscreenNavigationEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'disableChildSubscreenNavigation',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> displayPropertiesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displayProperties',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> displayPropertiesEqualTo(
    DestinyDisplayPropertiesDefinition? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayProperties',
      value:
          _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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
          _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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
          _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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
          _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> displayPropertiesStartsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displayProperties',
      value:
          _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> displayPropertiesEndsWith(
    DestinyDisplayPropertiesDefinition value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displayProperties',
      value:
          _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      displayPropertiesContains(DestinyDisplayPropertiesDefinition value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displayProperties',
      value:
          _destinyPresentationNodeDefinitionDestinyDisplayPropertiesDefinitionConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      displayPropertiesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displayProperties',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> displayStyleIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'displayStyle',
      value: null,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      displayStyleEqualTo(DestinyPresentationDisplayStyle? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayStyle',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> displayStyleGreaterThan(
    DestinyPresentationDisplayStyle? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'displayStyle',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> displayStyleLessThan(
    DestinyPresentationDisplayStyle? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'displayStyle',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> displayStyleBetween(
    DestinyPresentationDisplayStyle? lower,
    DestinyPresentationDisplayStyle? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'displayStyle',
      lower:
          _destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyPresentationNodeDefinitionDestinyPresentationDisplayStyleConverter
              .toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> hashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'hash',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> hashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hash',
      value: value,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> hashGreaterThan(
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

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> hashLessThan(
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

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> hashBetween(
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

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> indexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'index',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> indexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> indexLessThan(
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

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> indexBetween(
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
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> maxCategoryRecordScoreIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'maxCategoryRecordScore',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> maxCategoryRecordScoreEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'maxCategoryRecordScore',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> maxCategoryRecordScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'maxCategoryRecordScore',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> maxCategoryRecordScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'maxCategoryRecordScore',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> maxCategoryRecordScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'maxCategoryRecordScore',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> nodeTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nodeType',
      value: null,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      nodeTypeEqualTo(DestinyPresentationNodeType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nodeType',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> nodeTypeGreaterThan(
    DestinyPresentationNodeType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nodeType',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> nodeTypeLessThan(
    DestinyPresentationNodeType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nodeType',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> nodeTypeBetween(
    DestinyPresentationNodeType? lower,
    DestinyPresentationNodeType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nodeType',
      lower:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
              .toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> objectiveHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'objectiveHash',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> objectiveHashEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'objectiveHash',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> objectiveHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'objectiveHash',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> objectiveHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'objectiveHash',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> objectiveHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'objectiveHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> originalIconIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'originalIcon',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> originalIconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'originalIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> originalIconGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'originalIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> originalIconLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'originalIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> originalIconBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'originalIcon',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> originalIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'originalIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> originalIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'originalIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      originalIconContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'originalIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      originalIconMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'originalIcon',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> parentNodeHashesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'parentNodeHashes',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> parentNodeHashesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'parentNodeHashes',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> parentNodeHashesAnyEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'parentNodeHashes',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> presentationNodeTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'presentationNodeType',
      value: null,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      presentationNodeTypeEqualTo(DestinyPresentationNodeType? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'presentationNodeType',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> presentationNodeTypeGreaterThan(
    DestinyPresentationNodeType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'presentationNodeType',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> presentationNodeTypeLessThan(
    DestinyPresentationNodeType? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'presentationNodeType',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> presentationNodeTypeBetween(
    DestinyPresentationNodeType? lower,
    DestinyPresentationNodeType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'presentationNodeType',
      lower:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeTypeConverter
              .toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> redactedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'redacted',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> redactedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'redacted',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> requirementsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'requirements',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> requirementsEqualTo(
    DestinyPresentationNodeRequirementsBlock? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'requirements',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> requirementsGreaterThan(
    DestinyPresentationNodeRequirementsBlock? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'requirements',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> requirementsLessThan(
    DestinyPresentationNodeRequirementsBlock? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'requirements',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> requirementsBetween(
    DestinyPresentationNodeRequirementsBlock? lower,
    DestinyPresentationNodeRequirementsBlock? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'requirements',
      lower:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
              .toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> requirementsStartsWith(
    DestinyPresentationNodeRequirementsBlock value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'requirements',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> requirementsEndsWith(
    DestinyPresentationNodeRequirementsBlock value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'requirements',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      requirementsContains(DestinyPresentationNodeRequirementsBlock value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'requirements',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationNodeRequirementsBlockConverter
              .toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      requirementsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'requirements',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> rootViewIconIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'rootViewIcon',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> rootViewIconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'rootViewIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> rootViewIconGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'rootViewIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> rootViewIconLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'rootViewIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> rootViewIconBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'rootViewIcon',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> rootViewIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'rootViewIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> rootViewIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'rootViewIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      rootViewIconContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'rootViewIcon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      rootViewIconMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'rootViewIcon',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> scopeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'scope',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> scopeEqualTo(DestinyScope? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'scope',
      value:
          _destinyPresentationNodeDefinitionDestinyScopeConverter.toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> scopeGreaterThan(
    DestinyScope? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'scope',
      value:
          _destinyPresentationNodeDefinitionDestinyScopeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> scopeLessThan(
    DestinyScope? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'scope',
      value:
          _destinyPresentationNodeDefinitionDestinyScopeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterFilterCondition> scopeBetween(
    DestinyScope? lower,
    DestinyScope? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'scope',
      lower:
          _destinyPresentationNodeDefinitionDestinyScopeConverter.toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyPresentationNodeDefinitionDestinyScopeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> screenStyleIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'screenStyle',
      value: null,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      screenStyleEqualTo(DestinyPresentationScreenStyle? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'screenStyle',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> screenStyleGreaterThan(
    DestinyPresentationScreenStyle? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'screenStyle',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> screenStyleLessThan(
    DestinyPresentationScreenStyle? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'screenStyle',
      value:
          _destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
              .toIsar(value),
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> screenStyleBetween(
    DestinyPresentationScreenStyle? lower,
    DestinyPresentationScreenStyle? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'screenStyle',
      lower:
          _destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
              .toIsar(lower),
      includeLower: includeLower,
      upper:
          _destinyPresentationNodeDefinitionDestinyPresentationScreenStyleConverter
              .toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> traitHashesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'traitHashes',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> traitHashesAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitHashes',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> traitHashesAnyEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitHashes',
      value: value,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> traitIdsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'traitIds',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterFilterCondition> traitIdsAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitIds',
      value: null,
    ));
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
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

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      traitIdsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'traitIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
          DestinyPresentationNodeDefinition, QAfterFilterCondition>
      traitIdsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'traitIds',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DestinyPresentationNodeDefinitionQueryLinks on QueryBuilder<
    DestinyPresentationNodeDefinition,
    DestinyPresentationNodeDefinition,
    QFilterCondition> {}

extension DestinyPresentationNodeDefinitionQueryWhereSortBy on QueryBuilder<
    DestinyPresentationNodeDefinition,
    DestinyPresentationNodeDefinition,
    QSortBy> {
  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByChildren() {
    return addSortByInternal('children', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByChildrenDesc() {
    return addSortByInternal('children', Sort.desc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByCompletionRecordHash() {
    return addSortByInternal('completionRecordHash', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByCompletionRecordHashDesc() {
    return addSortByInternal('completionRecordHash', Sort.desc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByDisableChildSubscreenNavigation() {
    return addSortByInternal('disableChildSubscreenNavigation', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByDisableChildSubscreenNavigationDesc() {
    return addSortByInternal('disableChildSubscreenNavigation', Sort.desc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByDisplayStyle() {
    return addSortByInternal('displayStyle', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByDisplayStyleDesc() {
    return addSortByInternal('displayStyle', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByMaxCategoryRecordScore() {
    return addSortByInternal('maxCategoryRecordScore', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByMaxCategoryRecordScoreDesc() {
    return addSortByInternal('maxCategoryRecordScore', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByNodeType() {
    return addSortByInternal('nodeType', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByNodeTypeDesc() {
    return addSortByInternal('nodeType', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByObjectiveHash() {
    return addSortByInternal('objectiveHash', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByObjectiveHashDesc() {
    return addSortByInternal('objectiveHash', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByOriginalIcon() {
    return addSortByInternal('originalIcon', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByOriginalIconDesc() {
    return addSortByInternal('originalIcon', Sort.desc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByPresentationNodeType() {
    return addSortByInternal('presentationNodeType', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByPresentationNodeTypeDesc() {
    return addSortByInternal('presentationNodeType', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByRequirements() {
    return addSortByInternal('requirements', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByRequirementsDesc() {
    return addSortByInternal('requirements', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByRootViewIcon() {
    return addSortByInternal('rootViewIcon', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> sortByRootViewIconDesc() {
    return addSortByInternal('rootViewIcon', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByScope() {
    return addSortByInternal('scope', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByScopeDesc() {
    return addSortByInternal('scope', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByScreenStyle() {
    return addSortByInternal('screenStyle', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> sortByScreenStyleDesc() {
    return addSortByInternal('screenStyle', Sort.desc);
  }
}

extension DestinyPresentationNodeDefinitionQueryWhereSortThenBy on QueryBuilder<
    DestinyPresentationNodeDefinition,
    DestinyPresentationNodeDefinition,
    QSortThenBy> {
  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByChildren() {
    return addSortByInternal('children', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByChildrenDesc() {
    return addSortByInternal('children', Sort.desc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByCompletionRecordHash() {
    return addSortByInternal('completionRecordHash', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByCompletionRecordHashDesc() {
    return addSortByInternal('completionRecordHash', Sort.desc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByDisableChildSubscreenNavigation() {
    return addSortByInternal('disableChildSubscreenNavigation', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByDisableChildSubscreenNavigationDesc() {
    return addSortByInternal('disableChildSubscreenNavigation', Sort.desc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByDisplayProperties() {
    return addSortByInternal('displayProperties', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByDisplayPropertiesDesc() {
    return addSortByInternal('displayProperties', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByDisplayStyle() {
    return addSortByInternal('displayStyle', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByDisplayStyleDesc() {
    return addSortByInternal('displayStyle', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByHash() {
    return addSortByInternal('hash', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByHashDesc() {
    return addSortByInternal('hash', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByMaxCategoryRecordScore() {
    return addSortByInternal('maxCategoryRecordScore', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByMaxCategoryRecordScoreDesc() {
    return addSortByInternal('maxCategoryRecordScore', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByNodeType() {
    return addSortByInternal('nodeType', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByNodeTypeDesc() {
    return addSortByInternal('nodeType', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByObjectiveHash() {
    return addSortByInternal('objectiveHash', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByObjectiveHashDesc() {
    return addSortByInternal('objectiveHash', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByOriginalIcon() {
    return addSortByInternal('originalIcon', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByOriginalIconDesc() {
    return addSortByInternal('originalIcon', Sort.desc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByPresentationNodeType() {
    return addSortByInternal('presentationNodeType', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByPresentationNodeTypeDesc() {
    return addSortByInternal('presentationNodeType', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByRedacted() {
    return addSortByInternal('redacted', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByRedactedDesc() {
    return addSortByInternal('redacted', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByRequirements() {
    return addSortByInternal('requirements', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByRequirementsDesc() {
    return addSortByInternal('requirements', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByRootViewIcon() {
    return addSortByInternal('rootViewIcon', Sort.asc);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QAfterSortBy> thenByRootViewIconDesc() {
    return addSortByInternal('rootViewIcon', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByScope() {
    return addSortByInternal('scope', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByScopeDesc() {
    return addSortByInternal('scope', Sort.desc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByScreenStyle() {
    return addSortByInternal('screenStyle', Sort.asc);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QAfterSortBy> thenByScreenStyleDesc() {
    return addSortByInternal('screenStyle', Sort.desc);
  }
}

extension DestinyPresentationNodeDefinitionQueryWhereDistinct on QueryBuilder<
    DestinyPresentationNodeDefinition,
    DestinyPresentationNodeDefinition,
    QDistinct> {
  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QDistinct> distinctByChildren({bool caseSensitive = true}) {
    return addDistinctByInternal('children', caseSensitive: caseSensitive);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QDistinct> distinctByCompletionRecordHash() {
    return addDistinctByInternal('completionRecordHash');
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QDistinct> distinctByDisableChildSubscreenNavigation() {
    return addDistinctByInternal('disableChildSubscreenNavigation');
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QDistinct> distinctByDisplayProperties({bool caseSensitive = true}) {
    return addDistinctByInternal('displayProperties',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QDistinct> distinctByDisplayStyle() {
    return addDistinctByInternal('displayStyle');
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QDistinct> distinctByHash() {
    return addDistinctByInternal('hash');
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QDistinct> distinctByMaxCategoryRecordScore() {
    return addDistinctByInternal('maxCategoryRecordScore');
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QDistinct> distinctByNodeType() {
    return addDistinctByInternal('nodeType');
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QDistinct> distinctByObjectiveHash() {
    return addDistinctByInternal('objectiveHash');
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QDistinct> distinctByOriginalIcon({bool caseSensitive = true}) {
    return addDistinctByInternal('originalIcon', caseSensitive: caseSensitive);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QDistinct> distinctByPresentationNodeType() {
    return addDistinctByInternal('presentationNodeType');
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QDistinct> distinctByRedacted() {
    return addDistinctByInternal('redacted');
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QDistinct> distinctByRequirements({bool caseSensitive = true}) {
    return addDistinctByInternal('requirements', caseSensitive: caseSensitive);
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition,
      QDistinct> distinctByRootViewIcon({bool caseSensitive = true}) {
    return addDistinctByInternal('rootViewIcon', caseSensitive: caseSensitive);
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QDistinct> distinctByScope() {
    return addDistinctByInternal('scope');
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationNodeDefinition, QDistinct> distinctByScreenStyle() {
    return addDistinctByInternal('screenStyle');
  }
}

extension DestinyPresentationNodeDefinitionQueryProperty on QueryBuilder<
    DestinyPresentationNodeDefinition,
    DestinyPresentationNodeDefinition,
    QQueryProperty> {
  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeChildrenBlock?,
      QQueryOperations> childrenProperty() {
    return addPropertyNameInternal('children');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, int?, QQueryOperations>
      completionRecordHashProperty() {
    return addPropertyNameInternal('completionRecordHash');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, bool?, QQueryOperations>
      disableChildSubscreenNavigationProperty() {
    return addPropertyNameInternal('disableChildSubscreenNavigation');
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyDisplayPropertiesDefinition?,
      QQueryOperations> displayPropertiesProperty() {
    return addPropertyNameInternal('displayProperties');
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationDisplayStyle?,
      QQueryOperations> displayStyleProperty() {
    return addPropertyNameInternal('displayStyle');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, int?, QQueryOperations>
      hashProperty() {
    return addPropertyNameInternal('hash');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, int?, QQueryOperations>
      indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, int?, QQueryOperations>
      maxCategoryRecordScoreProperty() {
    return addPropertyNameInternal('maxCategoryRecordScore');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, DestinyPresentationNodeType?,
      QQueryOperations> nodeTypeProperty() {
    return addPropertyNameInternal('nodeType');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, int?, QQueryOperations>
      objectiveHashProperty() {
    return addPropertyNameInternal('objectiveHash');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, String?, QQueryOperations>
      originalIconProperty() {
    return addPropertyNameInternal('originalIcon');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, List<int>?, QQueryOperations>
      parentNodeHashesProperty() {
    return addPropertyNameInternal('parentNodeHashes');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, DestinyPresentationNodeType?,
      QQueryOperations> presentationNodeTypeProperty() {
    return addPropertyNameInternal('presentationNodeType');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, bool?, QQueryOperations>
      redactedProperty() {
    return addPropertyNameInternal('redacted');
  }

  QueryBuilder<
      DestinyPresentationNodeDefinition,
      DestinyPresentationNodeRequirementsBlock?,
      QQueryOperations> requirementsProperty() {
    return addPropertyNameInternal('requirements');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, String?, QQueryOperations>
      rootViewIconProperty() {
    return addPropertyNameInternal('rootViewIcon');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, DestinyScope?,
      QQueryOperations> scopeProperty() {
    return addPropertyNameInternal('scope');
  }

  QueryBuilder<DestinyPresentationNodeDefinition,
      DestinyPresentationScreenStyle?, QQueryOperations> screenStyleProperty() {
    return addPropertyNameInternal('screenStyle');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, List<int>?, QQueryOperations>
      traitHashesProperty() {
    return addPropertyNameInternal('traitHashes');
  }

  QueryBuilder<DestinyPresentationNodeDefinition, List<String>?,
      QQueryOperations> traitIdsProperty() {
    return addPropertyNameInternal('traitIds');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinyPresentationNodeDefinition _$DestinyPresentationNodeDefinitionFromJson(
        Map<String, dynamic> json) =>
    DestinyPresentationNodeDefinition()
      ..displayProperties = json['displayProperties'] == null
          ? null
          : DestinyDisplayPropertiesDefinition.fromJson(
              json['displayProperties'] as Map<String, dynamic>)
      ..originalIcon = json['originalIcon'] as String?
      ..rootViewIcon = json['rootViewIcon'] as String?
      ..nodeType = decodeDestinyPresentationNodeType(json['nodeType'])
      ..scope = decodeDestinyScope(json['scope'])
      ..objectiveHash = json['objectiveHash'] as int?
      ..completionRecordHash = json['completionRecordHash'] as int?
      ..children = json['children'] == null
          ? null
          : DestinyPresentationNodeChildrenBlock.fromJson(
              json['children'] as Map<String, dynamic>)
      ..displayStyle =
          decodeDestinyPresentationDisplayStyle(json['displayStyle'])
      ..screenStyle = decodeDestinyPresentationScreenStyle(json['screenStyle'])
      ..requirements = json['requirements'] == null
          ? null
          : DestinyPresentationNodeRequirementsBlock.fromJson(
              json['requirements'] as Map<String, dynamic>)
      ..disableChildSubscreenNavigation =
          json['disableChildSubscreenNavigation'] as bool?
      ..maxCategoryRecordScore = json['maxCategoryRecordScore'] as int?
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

Map<String, dynamic> _$DestinyPresentationNodeDefinitionToJson(
        DestinyPresentationNodeDefinition instance) =>
    <String, dynamic>{
      'displayProperties': instance.displayProperties,
      'originalIcon': instance.originalIcon,
      'rootViewIcon': instance.rootViewIcon,
      'nodeType': encodeDestinyPresentationNodeType(instance.nodeType),
      'scope': encodeDestinyScope(instance.scope),
      'objectiveHash': instance.objectiveHash,
      'completionRecordHash': instance.completionRecordHash,
      'children': instance.children,
      'displayStyle':
          encodeDestinyPresentationDisplayStyle(instance.displayStyle),
      'screenStyle': encodeDestinyPresentationScreenStyle(instance.screenStyle),
      'requirements': instance.requirements,
      'disableChildSubscreenNavigation':
          instance.disableChildSubscreenNavigation,
      'maxCategoryRecordScore': instance.maxCategoryRecordScore,
      'presentationNodeType':
          encodeDestinyPresentationNodeType(instance.presentationNodeType),
      'traitIds': instance.traitIds,
      'traitHashes': instance.traitHashes,
      'parentNodeHashes': instance.parentNodeHashes,
      'hash': instance.hash,
      'index': instance.index,
      'redacted': instance.redacted,
    };
