import '../../api/news_api/news_api_top_articles_response.dart';

class AppNotification {
  final Article article;
  bool isRead;

  AppNotification({
    required this.article,
    this.isRead = false,
  });
}
