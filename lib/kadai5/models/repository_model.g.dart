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
      stargazersCount: json['stargazers_count'] as int,
      language: json['language'] as String?,
      hasIssues: json['has_issues'] as bool,
      openIssuesCount: json['open_issues_count'] as int,
      forks: json['forks'] as int,
      defaultBranch: json['default_branch'] as String?,
      subscribersCount: json['subscribers_count'] as int,
      allowForking: json['allow_forking'] as bool,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepositoryModelToJson(RepositoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'watchers': instance.watchers,
      'stargazers_count': instance.stargazersCount,
      'language': instance.language,
      'has_issues': instance.hasIssues,
      'open_issues_count': instance.openIssuesCount,
      'forks': instance.forks,
      'default_branch': instance.defaultBranch,
      'subscribers_count': instance.subscribersCount,
      'allow_forking': instance.allowForking,
      'owner': instance.owner,
    };
