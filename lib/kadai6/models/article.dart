
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@immutable
@JsonSerializable()
class Article {

  const Article({
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String,
      dynamic> json,) => _$ArticleFromJson(json);

  final String? author;
  final String title;
  final String? description;
  final Uri url;
  final Uri? urlToImage;
  final DateTime publishedAt;
  final String? content;

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
