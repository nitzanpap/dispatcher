import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../helpers/helper_functions/date_formatting_functions.dart';

import '../api/news_api/news_api_model_functions.dart';
import '../api/news_api/news_api_top_articles_response.dart';

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
    final Response response = await getArticlesFromNewsApiUrl();
    final newsApiResponseData =
        newsApiTopHeadlinesResponseFromJson(response.body);
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
