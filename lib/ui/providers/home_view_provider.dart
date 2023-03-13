import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../core/utils/date_formatting_functions.dart';
import '../../core/models/news_api_models/article.dart';

import '../../core/services/news_api_services/news_api_model_functions.dart';
import '../../core/models/news_api_models/news_api_top_articles_response.dart';

class HomeViewProvider with ChangeNotifier {
  double _lastOffset = 0;
  List<Article> articles = [];
  DateTime? lastUpdated;

  double get offset => _lastOffset;
  List<Article> get articlesList => articles;
  DateTime? get _lastUpdatedTime => lastUpdated;

  set offset(double value) {
    _lastOffset = value;
    notifyListeners();
  }

  void saveOffset(double offset) {
    _lastOffset = offset;
  }

  void saveArticles(List<Article> articles) {
    this.articles = articles;
  }

  void updateLastUpdatedTime() {
    lastUpdated = DateTime.now();
  }

  Future<List<Article>?> getArticles() async {
    // Load existing articles if they exist and are less than an hour old
    if (articles.isNotEmpty && isDateTimeLessThanAnHourAgo(_lastUpdatedTime)) {
      return articles;
    }
    final Response response =
        await NewsApiModelFunctions.getArticlesFromNewsApiUrl();
    final newsApiResponseData =
        NewsApiTopHeadlinesResponse.fromRawJson(response.body);
    if (newsApiResponseData.status == 'ok') {
      final List<Article> articles = newsApiResponseData.articles!;
      saveArticles(articles);
      updateLastUpdatedTime();
      return articles;
    }
    print(newsApiResponseData.message);
    return null;
  }
}
