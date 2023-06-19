
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'owner.dart';

part 'user_model.g.dart';

@immutable
@JsonSerializable()
class UserModel {

  UserModel({
    required this.name,
    required this.watchers,
    this.description,
    required this.owner,
  });

  factory UserModel.fromJson(Map<String,
      dynamic> json,) => _$UserModelFromJson(json);
  String name;
  int watchers;
  String? description;
  Owner owner;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
