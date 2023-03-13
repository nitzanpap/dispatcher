import 'package:flutter/material.dart';

import '../../core/utils/device_services/device_storage_functions.dart';
import '../../core/models/news_api_models/article.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Article> _favorites = [];

  List<Article> get favorites => _favorites;

  void add(Article article) {
    _favorites.add(article);
    notifyListeners();
  }

  // TODO: implement saving to storage
  void _addArticleToStorage(Article article) {
    DeviceStorageFunctions.saveInPreferencesStorage(
        key: 'favoriteArticles', value: favorites.toString());
  }

  void remove(Article article) {
    _favorites.remove(article);
    notifyListeners();
  }
}
