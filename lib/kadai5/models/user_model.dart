
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'owner.dart';

part 'user_model.g.dart';

@immutable
@JsonSerializable()
class UserModel {

  const UserModel({
    required this.name,
    required this.watchers,
    this.description,
    required this.owner,
  });

  factory UserModel.fromJson(Map<String,
      dynamic> json,) => _$UserModelFromJson(json);
  final String name;
  final int watchers;
  final String? description;
  final Owner owner;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
