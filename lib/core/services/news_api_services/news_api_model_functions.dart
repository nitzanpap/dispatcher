import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../../constants/configs/news_api_config.dart';
import '../../models/news_api_models/news_api_top_articles_response.dart';

abstract class NewsApiModelFunctions {
  static Future<String> getDataFromJsonFile(String jsonFilePath) async {
    return await rootBundle.loadString(jsonFilePath);
  }

  static Future<http.Response> getArticlesFromNewsApiUrl() async {
    try {
      final response = await http.get(Uri.parse(NewsApiConfig.topHeadlinesUrl));
      return response;
    } catch (e) {
      debugPrint(e.toString());
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
}
