import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/user_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('users')
  Future<List<UserModel>> getPosts(

      );
  // @GET('/search/issues')
  // Future<IssueResult> searchIssues(
  //     @Query('q') String query,
  //     );
  //
  // @GET('/repos/{owner}/{repo}/pulls')
  // Future<List<Pull>> getPulls(
  //     @Path('owner') String owner,
  //     @Path('repo') String repo,
  //     );
}
