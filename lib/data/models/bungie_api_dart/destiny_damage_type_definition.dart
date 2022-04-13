import 'package:bungie_api/enums/damage_type.dart';
import 'package:bungie_api/models/destiny_display_properties_definition.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quria/data/models/bungie_api_dart/converters/converters.dart';

part 'destiny_damage_type_definition.g.dart';

/// All damage types that are possible in the game are defined here, along with localized info and icons as needed.
@JsonSerializable()
@Collection()
class DestinyDamageTypeDefinition {
  DestinyDamageTypeDefinition();

  factory DestinyDamageTypeDefinition.fromJson(Map<String, dynamic> json) {
    return _$DestinyDamageTypeDefinitionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DestinyDamageTypeDefinitionToJson(this);

  /// The description of the damage type, icon etc...
  @JsonKey(name: 'displayProperties')
  @DestinyDisplayPropertiesDefinitionConverter()
  DestinyDisplayPropertiesDefinition? displayProperties;

  /// A variant of the icon that is transparent and colorless.
  @JsonKey(name: 'transparentIconPath')
  String? transparentIconPath;

  /// If TRUE, the game shows this damage type's icon. Otherwise, it doesn't. Whether you show it or not is up to you.
  @JsonKey(name: 'showIcon')
  bool? showIcon;

  /// We have an enumeration for damage types for quick reference. This is the current definition's damage type enum value.
  @JsonKey(
      name: 'enumValue', fromJson: decodeDamageType, toJson: encodeDamageType)
  @DamageTypeConverter()
  DamageType? enumValue;

  /// The unique identifier for this entity. Guaranteed to be unique for the type of entity, but not globally.
  /// When entities refer to each other in Destiny content, it is this hash that they are referring to.
  @JsonKey(name: 'hash')
  @Id()
  int? hash;

  /// The index of the entity as it was found in the investment tables.
  @JsonKey(name: 'index')
  int? index;

  /// If this is true, then there is an entity with this identifier/type combination, but BNet is not yet allowed to show it. Sorry!
  @JsonKey(name: 'redacted')
  bool? redacted;
}
