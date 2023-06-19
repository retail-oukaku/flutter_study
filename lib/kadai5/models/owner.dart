
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@immutable
@JsonSerializable()
class Owner {

  const Owner({
    required this.login,
    this.avatar_url,
  });

  factory Owner.fromJson(Map<String,
      dynamic> json,) => _$OwnerFromJson(json);
  final String? avatar_url;
  final String login;

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
