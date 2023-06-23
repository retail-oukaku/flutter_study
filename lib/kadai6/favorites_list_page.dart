
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_test_project/kadai6/models/article.dart';
import 'package:flutter_web_test_project/kadai6/models/news_model.dart';
import 'package:flutter_web_test_project/kadai6/service/news_api_service.dart';

import 'favorites_manager.dart';

class FavoritesListPage extends StatefulWidget {
  const FavoritesListPage({super.key});

  @override
  State<FavoritesListPage> createState() => _FavoritesListPageState();
}

class _FavoritesListPageState extends State<FavoritesListPage> {
  final _articles = <Article>[];
  final _pageSize = 1;
  int _page = 1;

  late List<String>? _articlesTitles ;
  late List<String>? _articlesFileNames ;
  final FavoritesManager manager = FavoritesManager();
  @override
  void initState() {
    super.initState();
    _articlesTitles = manager.getFavoriteTitles() as List<String>?;
    _articlesFileNames = manager.getFavoriteFiles() as List<String>?;
    debugPrint(_articlesTitles!.length.toString());
    debugPrint(_articlesFileNames!.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ニュース詳細'),
      ),
      body: Center(
        child: _body(),
      ),
    );
  }

  FutureBuilder<NewsModel> _body() {
    final apiService = NewsApiService(Dio());
    return FutureBuilder(
      future: apiService.getSearchNewsModel(
        'Apple',
        _page,
        _pageSize,
        'publishedAt',
        '22793e96e8d24f3a8993ce4e4eb87e2a',),
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

  Widget _dealWithData(NewsModel? model) {
    if (model == null) {
      return const Text('Data Supplied Is Of Wrong Type');
    }
    if (model.status != 'ok') {
      return const Text('Fail to get Data');
    }
    if (model.articles == null || model.articles!.isEmpty){
      return const Text('No News Data');
    }

    _articles.addAll(model.articles!);
    return _posts(_articles);
  }

  Widget _posts(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return _buildListCellWidget(articles[index], index);
      },
    );
  }

  Widget _buildListCellWidget(Article article, int index) {
    return GestureDetector(
      child: Container(
        // margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              width: 0,
            ),
            top: BorderSide(

            ),
            right: BorderSide(
              width: 0,
            ),
            bottom: BorderSide(
              width: 0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                switch (article.urlToImage) {
                  final avatarUrl? => Image(
                    image: NetworkImage(avatarUrl.toString()),
                    width: 60,
                    height: 40,
                  ),
                  _ => const Icon(Icons.account_circle),
                },
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    'NO${index + 1}:  ${article.title}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Text(
              article.description ?? '',
            ),
          ],
        ),
      ),
      onTap:() {
        debugPrint('111');
      },
    );
  }

  void _add(){
    debugPrint('_add');
  }
}
