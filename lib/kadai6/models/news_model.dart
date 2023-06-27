
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'news_model.g.dart';

@immutable
@JsonSerializable()
class NewsModel {
  const NewsModel({
    this.status,
    required this.totalResults,
    this.articles,
  });

  factory NewsModel.fromJson(Map<String,
      dynamic> json,) => _$NewsModelFromJson(json);
  final int totalResults;
  final String? status;
  final List<Article>? articles;

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
