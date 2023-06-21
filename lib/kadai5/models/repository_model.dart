
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'owner.dart';

part 'repository_model.g.dart';

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryModel {

  const RepositoryModel({
    required this.name,
    this.description,
    required this.watchers,
    required this.stargazersCount,
    this.language,
    required this.hasIssues,
    required this.openIssuesCount,
    required this.forks,
    this.defaultBranch,
    required this.subscribersCount,
    required this.allowForking,
    required this.owner,
  });

  factory RepositoryModel.fromJson(Map<String,
      dynamic> json,) => _$RepositoryModelFromJson(json);
  final String name;
  final String? description;
  final int watchers;
  final int stargazersCount;
  final String? language;
  final bool hasIssues;
  final int openIssuesCount;
  final int forks;
  final String? defaultBranch;
  final int subscribersCount;
  final bool allowForking;
  final Owner owner;
  // Owner owner;

  Map<String, dynamic> toJson() => _$RepositoryModelToJson(this);
}
