import 'dart:convert';

import 'package:flutter_web_test_project/kadai6/utils/file_storage_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../models/article.dart';

const favoritesTitles = 'favoritesTitles';
const favoriteFileNames= 'favoriteFileNames';

class FavoritesManager {
  final FileStorageManager storage = FileStorageManager();
  Future<List<String>?> getFavoriteTitles() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(favoritesTitles);
    return favorites;
  }

  Future<List<String>?> getFavoriteFiles() async {
    final prefs = await SharedPreferences.getInstance();
    final fileNames = prefs.getStringList(favoriteFileNames);
    return fileNames;
  }

  Future<Article?> getFavoriteArticle(String fileName) async {
    return storage.readFile(fileName).then((value) {
      final jsonMap = json.decode(value) as Map<String, dynamic>?;
      if (jsonMap == null) {
        return null;
      }
      return Article.fromJson(jsonMap);
    }
    );
  }

  Future<void> saveFavorite(Article article) async {
    final prefs = await SharedPreferences.getInstance();

    final fileNames = prefs.getStringList(favoriteFileNames);
    final time = article.publishedAt.toString();
    if (fileNames == null) {
      await prefs.setStringList(
          favoriteFileNames,
          [time],
      );
    } else {
      fileNames.add(time);
      await prefs.setStringList(favoriteFileNames, fileNames);
    }

    final favorites = prefs.getStringList(favoritesTitles);
    if (favorites == null) {
      await prefs.setStringList(favoritesTitles, [article.title]);
    } else {
      favorites.add(article.title);
      await prefs.setStringList(favoritesTitles, favorites);
    }
    await storage.writeJsonFile(json.encode(article),time);
  }

  Future<void> deleteFavorite(Article article) async {
    final prefs = await SharedPreferences.getInstance();

    final filenames = prefs.getStringList(favoriteFileNames);
    if (filenames != null) {
      filenames.remove(article.publishedAt.toString());
      await prefs.setStringList(favoriteFileNames, filenames);
    }

    final favorites = prefs.getStringList(favoritesTitles);
    if (favorites != null) {
      favorites.remove(article.title);
      await prefs.setStringList(favoritesTitles, favorites);
    }

    await storage.deleteJsonFile('item');
  }

}
