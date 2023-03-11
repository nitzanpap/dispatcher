// To parse this JSON data, do
//
    // final newsApiTopHeadlinesResponse = newsApiTopHeadlinesResponseFromJson(jsonString);

import 'dart:convert';

NewsApiTopHeadlinesResponse newsApiTopHeadlinesResponseFromJson(String str) =>
    NewsApiTopHeadlinesResponse.fromJson(json.decode(str));

String newsApiTopHeadlinesResponseToJson(NewsApiTopHeadlinesResponse data) =>
    json.encode(data.toJson());

class NewsApiTopHeadlinesResponse {
  NewsApiTopHeadlinesResponse({
    required this.status,
    this.code,
    this.message,
    this.totalResults,
    this.articles,
  });

  final String status;
  final String? code;
  final String? message;
  final int? totalResults;
  final List<Article>? articles;

  factory NewsApiTopHeadlinesResponse.fromJson(Map<String, dynamic> json) =>
      NewsApiTopHeadlinesResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "totalResults": totalResults,
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  final Source source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    this.id,
    required this.name,
  });

  final String? id;
  final String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
