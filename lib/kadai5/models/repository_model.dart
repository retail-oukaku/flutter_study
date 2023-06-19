
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'owner.dart';

part 'repository_model.g.dart';

@immutable
@JsonSerializable()
class RepositoryModel {

  RepositoryModel({
    required this.name,
    this.description,
    required this.watchers,
    required this.stargazers_count,
    this.language,
    required this.has_issues,
    required this.open_issues_count,
    required this.forks,
    this.default_branch,
    required this.subscribers_count,
    required this.allow_forking,
    required this.owner,
  });

  factory RepositoryModel.fromJson(Map<String,
      dynamic> json,) => _$RepositoryModelFromJson(json);
  String name;
  String? description;
  int watchers;
  int stargazers_count;
  String? language;
  bool has_issues;
  int open_issues_count;
  int forks;
  String? default_branch;
  int subscribers_count;
  bool allow_forking;
  Owner owner;
  // Owner owner;

  Map<String, dynamic> toJson() => _$RepositoryModelToJson(this);
}