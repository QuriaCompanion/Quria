import 'dart:convert';

import 'package:bungie_api/destiny2.dart';
import 'package:isar/isar.dart';
import 'package:quria/data/services/bungie_api/enums/definition_table_names.dart';

class MapConverter extends TypeConverter<Map<String, String>?, String?> {
  const MapConverter();

  @override
  Map<String, String>? fromIsar(String? object) {
    if (object == null) return null;
    return jsonDecode(object) as Map<String, String>;
  }

  @override
  String? toIsar(Map<String, String>? object) {
    if (object == null) return null;
    return jsonEncode(object);
  }
}

class MapClassConverter<T> extends TypeConverter<Map<String, T>?, String?> {
  const MapClassConverter();

  @override
  Map<String, T>? fromIsar(String? object) {
    if (object == null) return null;
    return jsonDecode(object) as Map<String, T>;
  }

  @override
  String? toIsar(Map<String, T>? object) {
    if (object == null) return null;
    return jsonEncode(object);
  }
}

class ClassConverter<T> extends TypeConverter<T, String> {
  const ClassConverter();

  @override
  T fromIsar(String object) {
    return DefinitionTableNames.identities[T]!(jsonDecode(object));
  }

  @override
  String toIsar(T object) {
    return jsonEncode(object);
  }
}

class ClassListConverter<T> extends TypeConverter<List<T>, List<String>> {
  const ClassListConverter();

  @override
  List<T> fromIsar(List<String> object) {
    List<T> list = [];
    for (String item in object) {
      list.add(DefinitionTableNames.identities[T]!(jsonDecode(item)));
    }
    return list;
  }

  @override
  List<String> toIsar(List<T> object) {
    List<String> list = [];
    for (T item in object) {
      if (item == null) continue;
      list.add(jsonEncode(item));
    }
    return list;
  }
}

class ClassListNullableConverter<T>
    extends TypeConverter<List<T>?, List<String>?> {
  const ClassListNullableConverter();

  @override
  List<T>? fromIsar(List<String>? object) {
    if (object == null) return null;
    List<T>? list = [];
    for (String item in object) {
      list.add(DefinitionTableNames.identities[T]!(jsonDecode(item)));
    }
    return list;
  }

  @override
  List<String>? toIsar(List<T?>? object) {
    if (object == null) return null;
    List<String> list = [];

    for (T? item in object) {
      list.add(jsonEncode(item));
    }
    return list;
  }
}

// Enum

class DestinyScopeConverter extends TypeConverter<DestinyScope?, int?> {
  const DestinyScopeConverter();

  @override
  DestinyScope? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyScope.values[object];
  }

  @override
  int? toIsar(DestinyScope? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DestinyPresentationDisplayStyleConverter
    extends TypeConverter<DestinyPresentationDisplayStyle?, int?> {
  const DestinyPresentationDisplayStyleConverter();

  @override
  DestinyPresentationDisplayStyle? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyPresentationDisplayStyle.values[object];
  }

  @override
  int? toIsar(DestinyPresentationDisplayStyle? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DestinyEnergyTypeConverter
    extends TypeConverter<DestinyEnergyType?, int?> {
  const DestinyEnergyTypeConverter();

  @override
  DestinyEnergyType? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyEnergyType.values[object];
  }

  @override
  int? toIsar(DestinyEnergyType? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DestinyPresentationScreenStyleConverter
    extends TypeConverter<DestinyPresentationScreenStyle?, int?> {
  const DestinyPresentationScreenStyleConverter();

  @override
  DestinyPresentationScreenStyle? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyPresentationScreenStyle.values[object];
  }

  @override
  int? toIsar(DestinyPresentationScreenStyle? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DestinyPresentationNodeTypeConverter
    extends TypeConverter<DestinyPresentationNodeType?, int?> {
  const DestinyPresentationNodeTypeConverter();

  @override
  DestinyPresentationNodeType? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyPresentationNodeType.values[object];
  }

  @override
  int? toIsar(DestinyPresentationNodeType? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DestinyStatAggregationTypeConverter
    extends TypeConverter<DestinyStatAggregationType?, int?> {
  const DestinyStatAggregationTypeConverter();

  @override
  DestinyStatAggregationType? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyStatAggregationType.values[object];
  }

  @override
  int? toIsar(DestinyStatAggregationType? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DestinyStatCategoryConverter
    extends TypeConverter<DestinyStatCategory?, int?> {
  const DestinyStatCategoryConverter();

  @override
  DestinyStatCategory? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyStatCategory.values[object];
  }

  @override
  int? toIsar(DestinyStatCategory? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DestinyClassConverter extends TypeConverter<DestinyClass?, int?> {
  const DestinyClassConverter();

  @override
  DestinyClass? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyClass.values[object];
  }

  @override
  int? toIsar(DestinyClass? object) {
    if (object == null) return null;
    return object.index;
  }
}

class SpecialItemTypeConverter extends TypeConverter<SpecialItemType?, int?> {
  const SpecialItemTypeConverter();

  @override
  SpecialItemType? fromIsar(int? object) {
    if (object == null) return null;
    return SpecialItemType.values[object];
  }

  @override
  int? toIsar(SpecialItemType? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DestinyItemTypeConverter extends TypeConverter<DestinyItemType?, int?> {
  const DestinyItemTypeConverter();

  @override
  DestinyItemType? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyItemType.values[object];
  }

  @override
  int? toIsar(DestinyItemType? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DestinyItemSubTypeConverter
    extends TypeConverter<DestinyItemSubType?, int?> {
  const DestinyItemSubTypeConverter();

  @override
  DestinyItemSubType? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyItemSubType.values[object];
  }

  @override
  int? toIsar(DestinyItemSubType? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DestinyBreakerTypeConverter
    extends TypeConverter<DestinyBreakerType?, int?> {
  const DestinyBreakerTypeConverter();

  @override
  DestinyBreakerType? fromIsar(int? object) {
    if (object == null) return null;
    return DestinyBreakerType.values[object];
  }

  @override
  int? toIsar(DestinyBreakerType? object) {
    if (object == null) return null;
    return object.index;
  }
}

class DamageTypesConverter
    extends TypeConverter<List<DamageType>?, List<int>?> {
  const DamageTypesConverter();
  @override
  List<DamageType>? fromIsar(List<int>? object) {
    if (object == null) return null;
    List<DamageType> list = [];

    for (int item in object) {
      list.add(DamageType.values[item]);
    }
    return list;
  }

  @override
  List<int>? toIsar(List<DamageType>? object) {
    if (object == null) return null;
    List<int> list = [];
    for (DamageType item in object) {
      list.add(item.index);
    }
    return list;
  }
}

class DamageTypeConverter<T> extends TypeConverter<DamageType?, int?> {
  const DamageTypeConverter();
  @override
  DamageType? fromIsar(int? object) {
    if (object == null) return null;
    return DamageType.values[object];
  }

  @override
  int? toIsar(DamageType? object) {
    if (object == null) return null;
    return object.index;
  }
}
