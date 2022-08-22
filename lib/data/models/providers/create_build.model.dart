// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:quria/data/models/Item.model.dart';

@immutable
class CreateBuildModel {
  final List<Item> items;
  final String? name;
  final String? id;

  const CreateBuildModel({
    this.name,
    this.id,
    this.items = const [],
  });

  CreateBuildModel copyWith({
    String? name,
    String? id,
    List<Item>? items,
  }) {
    return CreateBuildModel(
      name: name ?? this.name,
      id: id ?? this.id,
      items: items ?? this.items,
    );
  }
}
