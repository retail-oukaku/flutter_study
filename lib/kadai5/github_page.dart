
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../kadai5/models/user_model.dart';
import '../kadai5/service/api_service.dart';

class GithubPage extends StatefulWidget {
  const GithubPage({super.key});

  @override
  State<GithubPage> createState() => _GithubPageState();
}

class _GithubPageState extends State<GithubPage> {
  final _items = <String>['Ben','Mark','Sony','James','Tonny','Jim',
    'Green','Vinni','Blues','White','Kim','Atos',];

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
        floatingActionButton: FloatingActionButton(
          onPressed: _skipToDetail,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _skipToDetail(){
    debugPrint('_skipToDetail');
  }


  Widget _buildListWidget(){
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListCellWidget(index,_items[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 32,);
      },
    );
  }

  Widget _buildListCellWidget(int index,String itemText){
    return GestureDetector (
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 64,
            height: 64,
            child: Image.asset('images/lake.jpg'),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded (
            child: Text(itemText),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      onTap: (){
        debugPrint(itemText);
      },
    );
  }


  FutureBuilder _body() {
    final apiService = ApiService(Dio(BaseOptions(contentType: 'application/json')));
    return FutureBuilder(
      future: apiService.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final users = snapshot.data! as List<UserModel>;
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
        return Container(
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
                (index + 1).toString(),
                textAlign: TextAlign.center,
              ),
              Text(
                users[index].login,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(users[index].type),
            ],
          ),
        );
      },
    );
  }
}
