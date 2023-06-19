// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryModel _$RepositoryModelFromJson(Map<String, dynamic> json) =>
    RepositoryModel(
      name: json['name'] as String,
      description: json['description'] as String?,
      watchers: json['watchers'] as int,
      stargazers_count: json['stargazers_count'] as int,
      language: json['language'] as String?,
      has_issues: json['has_issues'] as bool,
      open_issues_count: json['open_issues_count'] as int,
      forks: json['forks'] as int,
      default_branch: json['default_branch'] as String?,
      subscribers_count: json['subscribers_count'] as int,
      allow_forking: json['allow_forking'] as bool,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepositoryModelToJson(RepositoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'watchers': instance.watchers,
      'stargazers_count': instance.stargazers_count,
      'language': instance.language,
      'has_issues': instance.has_issues,
      'open_issues_count': instance.open_issues_count,
      'forks': instance.forks,
      'default_branch': instance.default_branch,
      'subscribers_count': instance.subscribers_count,
      'allow_forking': instance.allow_forking,
      'owner': instance.owner,
    };
