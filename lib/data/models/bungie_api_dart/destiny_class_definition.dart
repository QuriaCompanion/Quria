import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/models/destiny_display_properties_definition.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quria/data/models/bungie_api_dart/converters/converters.dart';
part 'destiny_class_definition.g.dart';

@JsonSerializable()
@Collection()
class DestinyClassDefinition {
  DestinyClassDefinition();

  factory DestinyClassDefinition.fromJson(Map<String, dynamic> json) {
    return _$DestinyClassDefinitionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DestinyClassDefinitionToJson(this);

  /// The unique identifier for this entity. Guaranteed to be unique for the type of entity, but not globally.
  /// When entities refer to each other in Destiny content, it is this hash that they are referring to.
  @JsonKey(name: 'hash')
  @Id()
  int? hash;

  /// In Destiny 1, we added a convenience Enumeration for referring to classes. We've kept it, though mostly for posterity. This is the enum value for this definition's class.
  @JsonKey(
      name: 'classType',
      fromJson: decodeDestinyClass,
      toJson: encodeDestinyClass)
  @DestinyClassConverter()
  DestinyClass? classType;

  /// Many Destiny*Definition contracts - the "first order" entities of Destiny that have their own tables in the Manifest Database - also have displayable information. This is the base class for that display information.
  @JsonKey(name: 'displayProperties')
  @DestinyDisplayPropertiesDefinitionConverter()
  DestinyDisplayPropertiesDefinition? displayProperties;

  /// A localized string referring to the singular form of the Class's name when referred to in gendered form. Keyed by the DestinyGender.
  @JsonKey(name: 'genderedClassNames')
  @MapConverter()
  Map<String, String>? genderedClassNames;

  @JsonKey(name: 'genderedClassNamesByGenderHash')
  @MapConverter()
  Map<String, String>? genderedClassNamesByGenderHash;

  /// Mentors don't really mean anything anymore. Don't expect this to be populated.
  @JsonKey(name: 'mentorVendorHash')
  int? mentorVendorHash;

  /// The index of the entity as it was found in the investment tables.
  @JsonKey(name: 'index')
  int? index;

  /// If this is true, then there is an entity with this identifier/type combination, but BNet is not yet allowed to show it. Sorry!
  @JsonKey(name: 'redacted')
  bool? redacted;
}
