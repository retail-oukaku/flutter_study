import 'package:dio/dio.dart';
import 'package:flutter_web_test_project/kadai6/models/news_model.dart';
import 'package:retrofit/http.dart';


part 'news_api_service.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/v2/everything')
  Future<NewsModel> getSearchNewsModel(
      @Query('q') String q,
      @Query('sortBy') String sortBy,
      @Query('apiKey') String apiKey,
      @Query('language') String language,
      );
}
