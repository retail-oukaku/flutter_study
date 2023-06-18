import 'package:dio/dio.dart';
import 'package:flutter_web_test_project/kadai5/models/repository_model.dart';
import 'package:retrofit/http.dart';

import '../models/user_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('users/{userName}/repos')
  Future<List<UserModel>> getReposList(
      @Path('userName') String userName,
      );

  @GET('/repos/{owner}/{repo}')
  Future<RepositoryModel> getRepos(
      @Path('owner') String owner,
      @Path('repo') String repo,
      );
}
