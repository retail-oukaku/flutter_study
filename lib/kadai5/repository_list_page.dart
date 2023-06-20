
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_test_project/kadai5/repository_detail_page.dart';

import '../kadai5/models/user_model.dart';
import '../kadai5/service/api_service.dart';

class RepositoryListPage extends StatefulWidget {
  const RepositoryListPage({super.key, required this.userName});
  @required final String userName;
  @override
  State<RepositoryListPage> createState() => _RepositoryListPageState();
}

class _RepositoryListPageState extends State<RepositoryListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => {
              Navigator.of(context).pop('Back')
            },
          ),
          title: const Text('課題５：GitHubリポジトリ'),
        ),
        body: _body(),
      ),
    );
  }

  FutureBuilder<List<UserModel>> _body() {
    final apiService = ApiService(Dio(BaseOptions(contentType: 'application/json')));
    return FutureBuilder(
      future: apiService.getReposList(widget.userName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final users = snapshot.data!;
          return _posts(users);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _posts(List<UserModel> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return _buildListCellWidget(users[index], index);
      },
    );
  }

  Widget _buildListCellWidget(UserModel user, int index) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NO${index + 1}:  ${user.name}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Description'),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.description ?? 'null',
            ),
          ],
        ),
      ),
      onTap:() {
        skipToRepositoryDetail(user.name);
      },
    );
  }

  Future<void> skipToRepositoryDetail(String name) async {
    await Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return RepositoryDetailPage(userName: widget.userName,
            projectName:name,);
        },
      ),
    );
  }
}
