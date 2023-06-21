
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class Owner {

  const Owner({
    required this.login,
    this.avatarUrl,
  });

  factory Owner.fromJson(Map<String,
      dynamic> json,) => _$OwnerFromJson(json);

  final String? avatarUrl;
  final String login;

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
