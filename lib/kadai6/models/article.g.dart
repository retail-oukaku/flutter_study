// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      author: json['author'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      url: Uri.parse(json['url'] as String),
      urlToImage: json['urlToImage'] == null
          ? null
          : Uri.parse(json['urlToImage'] as String),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url.toString(),
      'urlToImage': instance.urlToImage?.toString(),
      'publishedAt': instance.publishedAt.toIso8601String(),
      'content': instance.content,
    };
