// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'owner_model.dart';

part 'repository_model.freezed.dart';

part 'repository_model.g.dart';

@freezed
class RepositoryModel with _$RepositoryModel {
  const factory RepositoryModel({
    required String name,
    String? description,
    required int watchers,
    required int stargazers_count,
    String? language,
    required bool has_issues,
    required int open_issues_count,
    required int forks,
    String? default_branch,
    required int subscribers_count,
    required bool allow_forking,
    required Owner owner,
  }) = _RepositoryModel;

  factory RepositoryModel.fromJson(Map<String, Object?> json)
  => _$RepositoryModelFromJson(json);
}
