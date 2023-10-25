
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_test_project/kadai6/models/article.dart';
import 'package:flutter_web_test_project/kadai6/models/news_model.dart';
import 'package:flutter_web_test_project/kadai6/news_detail_page.dart';
import 'package:flutter_web_test_project/kadai6/service/news_api_service.dart';

import 'favorites_list_page.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({
    super.key,
    required this.newsKey,
  });

  final String newsKey;
  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  List<Article> _articles = <Article>[];
  final String _languageEn = 'en';
  final String _languageZh = 'zh';
  bool _isLanguageEn = true;
  @override
  void initState() {
    super.initState();
    _refreshNews();
  }

  void _refreshNews() {
    setState(() {
      _isLanguageEn = !_isLanguageEn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('課題6 ニュース'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: 'FavoritesList',
            onPressed: _skipToFavoritesListPage,
          ),
        ],
      ),
      body: Center(
        child: _body(),
      ),

      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _floatingActionButton(){
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: Colors.blueGrey,

      ),
      onPressed: _refreshNews,
      child: Text(
        'Switch to ${_isLanguageEn ? _languageZh : _languageEn}',
      ),
    );
  }

  FutureBuilder<NewsModel> _body() {
    final apiService = NewsApiService(Dio());
    return FutureBuilder(
      future: apiService.getSearchNewsModel(
        'Apple',
        'publishedAt',
        widget.newsKey,
        _isLanguageEn ? _languageEn:_languageZh,
      ),
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
    _articles.clear();
    _articles = model.articles!;
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
      onTap: () {
        skipToDetail(article);
      },
      child: Container(
        // margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
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
                      article.title,
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
    );
  }

  Future<void> skipToDetail(Article model) async {
    await Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return NewsDetailPage(title: model.title ,article: model,);
        },
      ),
    );
  }
  void _skipToFavoritesListPage(){
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return const FavoritesListPage();
        },
      ),
    );
  }
}
