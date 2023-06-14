// import 'package:dio/dio.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:retrofit/retrofit.dart';
//
// @RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
// abstract class GithubRestClient {
//   factory GithubRestClient(Dio dio, {String baseUrl}) = _GithubRestClient;
//
//   @GET("/tasks")
//   Future<List<Task>> getTasks();
// }
//
// @JsonSerializable()
// class Task {
//   Task({this.id, this.name, this.avatar, this.createdAt});
//   factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
//   String? id;
//   String? name;
//   String? avatar;
//   String? createdAt;
//   Map<String, dynamic> toJson() => _$TaskToJson(this);
// }
