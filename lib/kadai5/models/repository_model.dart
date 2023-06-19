
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'owner.dart';

part 'repository_model.g.dart';

@immutable
@JsonSerializable()
class RepositoryModel {

  const RepositoryModel({
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
  final String name;
  final String? description;
  final int watchers;
  final int stargazers_count;
  final String? language;
  final bool has_issues;
  final int open_issues_count;
  final int forks;
  final String? default_branch;
  final int subscribers_count;
  final bool allow_forking;
  final Owner owner;
  // Owner owner;

  Map<String, dynamic> toJson() => _$RepositoryModelToJson(this);
}
