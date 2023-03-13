import 'package:dispatcher/api/news_api/news_api_top_articles_response.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../api/news_api/news_api_config.dart';

Future<String> _loadFromAsset(String jsonFilePath) async {
  return await rootBundle.loadString(jsonFilePath);
}

Future<String> getDataFromJsonFile(String jsonFilePath) async {
  String jsonString = await _loadFromAsset(jsonFilePath);
  // print(jsonString);
  return jsonString;
}

Future<http.Response> getArticlesFromNewsApiUrl() async {
  try {
    final response = await http.get(Uri.parse(NewsApiConfig.topHeadlinesUrl));
    return response;
  } catch (e) {
    print(e);
    return http.Response(
      NewsApiTopHeadlinesResponse(
        status: 'error',
        code: 'error',
        message: e.toString(),
      ).toRawJson(),
      500,
    );
  }
}
