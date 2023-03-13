// To parse this JSON data, do
//
//     final newsApiTopHeadlinesResponse = newsApiTopHeadlinesResponseFromJson(jsonString);

import 'dart:convert';

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

    factory NewsApiTopHeadlinesResponse.fromRawJson(String str) => NewsApiTopHeadlinesResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NewsApiTopHeadlinesResponse.fromJson(Map<String, dynamic> json) => NewsApiTopHeadlinesResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null ? [] : List<dynamic>.from(articles!.map((x) => x.toJson())),
        "code": code,
        "message": message,
    };
}

class Article {
    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    final Source? source;
    final String? author;
    final String? title;
    final String? description;
    final String? url;
    final String? urlToImage;
    final DateTime? publishedAt;
    final String? content;

    factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
    };
}

class Source {
    Source({
        this.id,
        this.name,
    });

    final String? id;
    final String? name;

    factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
