// To parse this JSON data, do
//
//     final newsApiTopHeadlinesResponse = NewsApiTopHeadlinesResponse.fromRawJson(jsonString);

import 'dart:convert';

import '../../models/news_api_models/article.dart';

class NewsApiTopHeadlinesResponse {
  NewsApiTopHeadlinesResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  final String? status;
  final int? totalResults;
  final List<Article>? articles;
  final String? code;
  final String? message;

  factory NewsApiTopHeadlinesResponse.fromRawJson(String str) =>
      NewsApiTopHeadlinesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsApiTopHeadlinesResponse.fromJson(Map<String, dynamic> json) =>
      NewsApiTopHeadlinesResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}
