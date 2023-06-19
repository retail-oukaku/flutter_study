
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@immutable
@JsonSerializable()
class Owner {

  Owner({
    required this.login,
    this.avatar_url,
  });

  factory Owner.fromJson(Map<String,
      dynamic> json,) => _$OwnerFromJson(json);
  String? avatar_url;
  String login;
  // Owner owner;

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}