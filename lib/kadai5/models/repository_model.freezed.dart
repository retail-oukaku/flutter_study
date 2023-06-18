// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepositoryModel _$RepositoryModelFromJson(Map<String, dynamic> json) {
  return _RepositoryModel.fromJson(json);
}

/// @nodoc
mixin _$RepositoryModel {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get watchers => throw _privateConstructorUsedError;
  int get stargazers_count => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  bool get has_issues => throw _privateConstructorUsedError;
  int get open_issues_count => throw _privateConstructorUsedError;
  int get forks => throw _privateConstructorUsedError;
  String? get default_branch => throw _privateConstructorUsedError;
  int get subscribers_count => throw _privateConstructorUsedError;
  bool get allow_forking => throw _privateConstructorUsedError;
  Owner get owner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepositoryModelCopyWith<RepositoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryModelCopyWith<$Res> {
  factory $RepositoryModelCopyWith(
          RepositoryModel value, $Res Function(RepositoryModel) then) =
      _$RepositoryModelCopyWithImpl<$Res, RepositoryModel>;
  @useResult
  $Res call(
      {String name,
      String? description,
      int watchers,
      int stargazers_count,
      String? language,
      bool has_issues,
      int open_issues_count,
      int forks,
      String? default_branch,
      int subscribers_count,
      bool allow_forking,
      Owner owner});

  $OwnerCopyWith<$Res> get owner;
}

/// @nodoc
class _$RepositoryModelCopyWithImpl<$Res, $Val extends RepositoryModel>
    implements $RepositoryModelCopyWith<$Res> {
  _$RepositoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? watchers = null,
    Object? stargazers_count = null,
    Object? language = freezed,
    Object? has_issues = null,
    Object? open_issues_count = null,
    Object? forks = null,
    Object? default_branch = freezed,
    Object? subscribers_count = null,
    Object? allow_forking = null,
    Object? owner = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      watchers: null == watchers
          ? _value.watchers
          : watchers // ignore: cast_nullable_to_non_nullable
              as int,
      stargazers_count: null == stargazers_count
          ? _value.stargazers_count
          : stargazers_count // ignore: cast_nullable_to_non_nullable
              as int,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      has_issues: null == has_issues
          ? _value.has_issues
          : has_issues // ignore: cast_nullable_to_non_nullable
              as bool,
      open_issues_count: null == open_issues_count
          ? _value.open_issues_count
          : open_issues_count // ignore: cast_nullable_to_non_nullable
              as int,
      forks: null == forks
          ? _value.forks
          : forks // ignore: cast_nullable_to_non_nullable
              as int,
      default_branch: freezed == default_branch
          ? _value.default_branch
          : default_branch // ignore: cast_nullable_to_non_nullable
              as String?,
      subscribers_count: null == subscribers_count
          ? _value.subscribers_count
          : subscribers_count // ignore: cast_nullable_to_non_nullable
              as int,
      allow_forking: null == allow_forking
          ? _value.allow_forking
          : allow_forking // ignore: cast_nullable_to_non_nullable
              as bool,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res> get owner {
    return $OwnerCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RepositoryModelCopyWith<$Res>
    implements $RepositoryModelCopyWith<$Res> {
  factory _$$_RepositoryModelCopyWith(
          _$_RepositoryModel value, $Res Function(_$_RepositoryModel) then) =
      __$$_RepositoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      int watchers,
      int stargazers_count,
      String? language,
      bool has_issues,
      int open_issues_count,
      int forks,
      String? default_branch,
      int subscribers_count,
      bool allow_forking,
      Owner owner});

  @override
  $OwnerCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_RepositoryModelCopyWithImpl<$Res>
    extends _$RepositoryModelCopyWithImpl<$Res, _$_RepositoryModel>
    implements _$$_RepositoryModelCopyWith<$Res> {
  __$$_RepositoryModelCopyWithImpl(
      _$_RepositoryModel _value, $Res Function(_$_RepositoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? watchers = null,
    Object? stargazers_count = null,
    Object? language = freezed,
    Object? has_issues = null,
    Object? open_issues_count = null,
    Object? forks = null,
    Object? default_branch = freezed,
    Object? subscribers_count = null,
    Object? allow_forking = null,
    Object? owner = null,
  }) {
    return _then(_$_RepositoryModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      watchers: null == watchers
          ? _value.watchers
          : watchers // ignore: cast_nullable_to_non_nullable
              as int,
      stargazers_count: null == stargazers_count
          ? _value.stargazers_count
          : stargazers_count // ignore: cast_nullable_to_non_nullable
              as int,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      has_issues: null == has_issues
          ? _value.has_issues
          : has_issues // ignore: cast_nullable_to_non_nullable
              as bool,
      open_issues_count: null == open_issues_count
          ? _value.open_issues_count
          : open_issues_count // ignore: cast_nullable_to_non_nullable
              as int,
      forks: null == forks
          ? _value.forks
          : forks // ignore: cast_nullable_to_non_nullable
              as int,
      default_branch: freezed == default_branch
          ? _value.default_branch
          : default_branch // ignore: cast_nullable_to_non_nullable
              as String?,
      subscribers_count: null == subscribers_count
          ? _value.subscribers_count
          : subscribers_count // ignore: cast_nullable_to_non_nullable
              as int,
      allow_forking: null == allow_forking
          ? _value.allow_forking
          : allow_forking // ignore: cast_nullable_to_non_nullable
              as bool,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepositoryModel implements _RepositoryModel {
  const _$_RepositoryModel(
      {required this.name,
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
      required this.owner});

  factory _$_RepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_RepositoryModelFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final int watchers;
  @override
  final int stargazers_count;
  @override
  final String? language;
  @override
  final bool has_issues;
  @override
  final int open_issues_count;
  @override
  final int forks;
  @override
  final String? default_branch;
  @override
  final int subscribers_count;
  @override
  final bool allow_forking;
  @override
  final Owner owner;

  @override
  String toString() {
    return 'RepositoryModel(name: $name, description: $description, watchers: $watchers, stargazers_count: $stargazers_count, language: $language, has_issues: $has_issues, open_issues_count: $open_issues_count, forks: $forks, default_branch: $default_branch, subscribers_count: $subscribers_count, allow_forking: $allow_forking, owner: $owner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositoryModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.watchers, watchers) ||
                other.watchers == watchers) &&
            (identical(other.stargazers_count, stargazers_count) ||
                other.stargazers_count == stargazers_count) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.has_issues, has_issues) ||
                other.has_issues == has_issues) &&
            (identical(other.open_issues_count, open_issues_count) ||
                other.open_issues_count == open_issues_count) &&
            (identical(other.forks, forks) || other.forks == forks) &&
            (identical(other.default_branch, default_branch) ||
                other.default_branch == default_branch) &&
            (identical(other.subscribers_count, subscribers_count) ||
                other.subscribers_count == subscribers_count) &&
            (identical(other.allow_forking, allow_forking) ||
                other.allow_forking == allow_forking) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      watchers,
      stargazers_count,
      language,
      has_issues,
      open_issues_count,
      forks,
      default_branch,
      subscribers_count,
      allow_forking,
      owner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepositoryModelCopyWith<_$_RepositoryModel> get copyWith =>
      __$$_RepositoryModelCopyWithImpl<_$_RepositoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepositoryModelToJson(
      this,
    );
  }
}

abstract class _RepositoryModel implements RepositoryModel {
  const factory _RepositoryModel(
      {required final String name,
      final String? description,
      required final int watchers,
      required final int stargazers_count,
      final String? language,
      required final bool has_issues,
      required final int open_issues_count,
      required final int forks,
      final String? default_branch,
      required final int subscribers_count,
      required final bool allow_forking,
      required final Owner owner}) = _$_RepositoryModel;

  factory _RepositoryModel.fromJson(Map<String, dynamic> json) =
      _$_RepositoryModel.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  int get watchers;
  @override
  int get stargazers_count;
  @override
  String? get language;
  @override
  bool get has_issues;
  @override
  int get open_issues_count;
  @override
  int get forks;
  @override
  String? get default_branch;
  @override
  int get subscribers_count;
  @override
  bool get allow_forking;
  @override
  Owner get owner;
  @override
  @JsonKey(ignore: true)
  _$$_RepositoryModelCopyWith<_$_RepositoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
