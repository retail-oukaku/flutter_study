import 'package:flutter/material.dart';
import 'package:flutter_web_test_project/kadai6/models/article.dart';
import 'package:flutter_web_test_project/kadai6/utils/favorites_manager.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    super.key,
    required this.title,
    this.article,
    this.fileName,
  });
  final String title;
  final Article? article;
  final String? fileName;
  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  Article? _article;
  late bool _isFavoriteArticle = false;
  final FavoritesManager manager = FavoritesManager();
  @override
  void initState() {
    super.initState();
    if (widget.article != null) {
      setState(() {
        _article = widget.article;
      });
    } else if (widget.fileName != null) {
      manager.getFavoriteArticle(widget.fileName!).then((value) {
        setState(() {
          _article = value;
        });
      });
    }

    manager.getFavoriteTitles().then((value) {
      final favoriteArticleTitles = value;
      if (favoriteArticleTitles == null) {
        return;
      }
      setState(() {
        _isFavoriteArticle = favoriteArticleTitles.contains(widget.title);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ニュース詳細'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveFavoriteArticle,
        tooltip: 'Favorite',
        child: _isFavoriteArticle
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
      ),
    );
  }

  void _saveFavoriteArticle() {
    final article = _article;
    if (article == null) {
      return;
    }
    if (_isFavoriteArticle) {
      manager.deleteFavorite(article);
    } else {
      manager.saveFavorite(article);
    }
    setState(() {
      _isFavoriteArticle = !_isFavoriteArticle;
    });
  }

  Widget _buildBody() {
    final article = _article;
    if (article == null) {
      return const Center(
        child: Text('Data Supplied Is Of Wrong Type'),
      );
    }
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.topCenter,
      child: ListView(
        children: [
          Text(
            article.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          switch (article.urlToImage) {
            final avatarUrl? => Image(
                image: NetworkImage(avatarUrl.toString()),
              ),
            _ => const Icon(Icons.account_circle),
          },
          const SizedBox(
            height: 8,
          ),
          Text(
            article.description ?? '',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            article.content ?? '',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                article.publishedAt.toLocal().toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  article.author ?? '',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
