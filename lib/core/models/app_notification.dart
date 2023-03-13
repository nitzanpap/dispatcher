import 'news_api_models/article.dart';

class AppNotification {
  final Article article;
  bool isRead;

  AppNotification({
    required this.article,
    this.isRead = false,
  });
}
