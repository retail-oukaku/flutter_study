
import 'package:flutter/material.dart';
import 'package:flutter_web_test_project/kadai6/models/article.dart';
import 'package:flutter_web_test_project/kadai6/utils/favorites_manager.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    super.key,
    required this.title,
    this.article,
    this.fileName,
  }
  );
  final String title;
  final Article? article;
  final String? fileName;
  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late List<String>? _favoriteArticleTitles;
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
      _favoriteArticleTitles = value;
      setState(() {
        _isFavoriteArticle =
            _favoriteArticleTitles?.contains(widget.title) ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ニュース詳細'),
      ),
      body:_buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveFavoriteArticle,
        tooltip: 'Increment',
        child: _isFavoriteArticle ?
        const Icon(Icons.favorite) :
        const Icon(Icons.favorite_border),
      ),
    );
  }

  void _saveFavoriteArticle() {
    if (_article == null) {
      return;
    }
    if (_isFavoriteArticle) {
      manager.deleteFavorite(_article!);
    } else {
      manager.saveFavorite(_article!);
    }
    setState(() {
      _isFavoriteArticle = !_isFavoriteArticle;
    });
  }

  Widget _buildBody() {
    if (_article == null) {
      return const Center(
        child: Text('Data Supplied Is Of Wrong Type'),
      );
    }
    return Container (
      padding: const EdgeInsets.all(16),
      alignment: Alignment.topCenter,
      child: ListView(
        children: [
          Text(
            _article!.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight:FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          switch (_article?.urlToImage) {
            final avatarUrl? => Image(
              image: NetworkImage(avatarUrl.toString()),
            ),
            _ => const Icon(Icons.account_circle),
          },
          const SizedBox(
            height: 8,
          ),
          Text(
            _article?.description ?? '',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            _article?.content ?? '',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children:[
              Text(
                _article?.publishedAt.toLocal().toString() ?? '',
                style: const TextStyle(
                  fontWeight:FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  _article?.author ?? '',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontWeight:FontWeight.bold,
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
