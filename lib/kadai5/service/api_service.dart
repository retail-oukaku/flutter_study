import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/post_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('users')
  Future<List<PostModel>> getPosts(

      );
}
