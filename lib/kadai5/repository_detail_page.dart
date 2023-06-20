

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../kadai5/service/api_service.dart';
import 'models/repository_model.dart';

class RepositoryDetailPage extends StatefulWidget {
  const RepositoryDetailPage({super.key,
    required this.userName,
    required this.projectName,});
  @required final String userName;
  @required final String projectName;
  @override
  State<RepositoryDetailPage> createState() => _RepositoryDetailPageState();
}

class _RepositoryDetailPageState extends State<RepositoryDetailPage> {
  final _widgets = <Widget>[];
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

  FutureBuilder<RepositoryModel> _body() {
    final apiService = ApiService(Dio(BaseOptions(contentType: 'application/json')));
    return FutureBuilder(
      future: apiService.getRepos(widget.userName, widget.projectName),
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.done:
            return _dealWithData(snapshot.data);
          case ConnectionState.active:
          case ConnectionState.waiting:
          case ConnectionState.none:
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _dealWithData(RepositoryModel? model){
    if (model != null) {
      _buildListCells(model);
      return _buildBody(model);
    } else {
      return const Text('Data Supplied Is Of Wrong Type');
    }
  }

  Widget _buildBody(RepositoryModel repositoryModel){
    return SafeArea(
      child: Container(
        color: Colors.grey[50],
        padding: const EdgeInsets.all(8),
        child: _buildListWidget(),
      ),
    );
  }

  void _buildListCells(RepositoryModel model){
    final topWidget =  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            switch (model.owner.avatar_url) {
              final avatarUrl? => Image(
                image: NetworkImage(avatarUrl),
                width: 32,
                height: 32,
              ),
              _ => const Icon(Icons.account_circle),
            },
            const SizedBox(
              width: 16,
            ),
            Text(
              model.owner.login,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          model.name,
          style: const TextStyle(
            fontSize: 26,
            fontWeight:FontWeight.bold,
          ),
        ),
        Text(
          model.description ?? 'null',
          style:const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
    
    _widgets..add(topWidget)
      ..add(_buildCell(const Icon(Icons.water_drop),
        'Watchers',
        model.watchers.toString(),),)
      ..add(_buildCell(const Icon(Icons.star),
        'Stars',
        model.stargazers_count.toString(),),)
      ..add(_buildCell(const Icon(Icons.science_sharp),
        'Language',
        model.language != null? model.language! :'null',),)
      ..add(_buildCell(const Icon(Icons.interests_sharp),
        'Issue',
        model.open_issues_count.toString(),),)
      ..add(_buildCell(const Icon(Icons.face),
        'Forks',
        model.forks.toString(),),)
      ..add(_buildCell(const Icon(Icons.dashboard),
        'Branch',
        model.default_branch != null? model.default_branch! :'null',),)
      ..add(_buildCell(const Icon(Icons.safety_divider_sharp),
        'Subscribers',
        model.subscribers_count.toString(),),);
  }

  Widget _buildListWidget()  {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _widgets.length,
      itemBuilder: (context, index) {
        return _widgets[index];
      },
    );
  }

  Widget _buildCell(Icon icon, String title, String text){
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(),
      ),
      child: Row (
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: icon,
          ),
          Expanded(child: Text(title)),
          const SizedBox(
            width: 40,
          ),
          Text(text),
          const SizedBox(
            width: 8,
          ),
          const Icon(Icons.keyboard_arrow_right),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
