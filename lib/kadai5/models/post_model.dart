import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {

  PostModel({required this.login,
    required this.id,
    required this.avatar_url,
    required this.type});

  factory PostModel.fromJson(Map<String,
      dynamic> json,) => _$PostModelFromJson(json);
  String login;
  int id;
  String avatar_url;
  String type;

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
