import 'package:dispatcher/helpers/helper_functions/device_storage_functions.dart';

import '../api/news_api/news_api_top_articles_response.dart';
import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Article> _favorites = [];

  List<Article> get favorites => _favorites;

  void add(Article article) {
    _favorites.add(article);
    notifyListeners();
  }

  // TODO: implement saving to storage
  void _addArticleToStorage(Article article) {
    saveInPreferencesStorage(
        key: 'favoriteArticles', value: favorites.toString());
  }

  void remove(Article article) {
    _favorites.remove(article);
    notifyListeners();
  }
}
