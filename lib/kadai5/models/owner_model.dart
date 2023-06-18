// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_model.freezed.dart';

part 'owner_model.g.dart';

@freezed
class Owner with _$Owner {
  const factory Owner({
    //owner
    String? avatar_url,
    required String login,
  }) = _Owner;

  factory Owner.fromJson(Map<String, Object?> json)
  => _$OwnerFromJson(json);
}
