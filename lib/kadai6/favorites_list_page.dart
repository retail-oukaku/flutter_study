
import 'package:flutter/material.dart';

import 'news_detail_page.dart';
import 'utils/favorites_manager.dart';

class FavoritesListPage extends StatefulWidget {
  const FavoritesListPage({super.key});

  @override
  State<FavoritesListPage> createState() => _FavoritesListPageState();
}

class _FavoritesListPageState extends State<FavoritesListPage> {
  List<String>? _articlesTitles;
  late List<String>? _articlesFileNames;
  final FavoritesManager manager = FavoritesManager();
  @override
  void initState() {
    super.initState();
    _loadList();
  }

  void _loadList(){
    manager.getFavoriteTitles().then((value) {
      setState(() {
        _articlesTitles = value;
      });
    });

    manager.getFavoriteFiles().then((value) {
      setState(() {
        _articlesFileNames = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お気に入るニュース'),
      ),
      body:_buildListWidget(),
    );
  }

  Widget _buildListWidget()  {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _articlesTitles?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return _buildListCellWidget(index, _articlesTitles![index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 24,);
      },
    );
  }

  Widget _buildListCellWidget(int index, String itemText){
    return GestureDetector(
      onTap: () {
        skipToDetail(itemText, index);
      },
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              (index + 1).toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded (
            child: Text(
              itemText,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  Future<void> skipToDetail(String title, int index) async {
    await Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return NewsDetailPage(
            title: title ,
            fileName: _articlesFileNames![index],
          );
        },
      ),
    ).then((value) {
      _loadList();
    });
  }

}
