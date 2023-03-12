import 'package:flutter/material.dart';

import '../helpers/helper_classes/app_notification.dart';
import '../api/news_api/news_api_top_articles_response.dart';

class NotificationsProvider with ChangeNotifier {
  final List<AppNotification> _notifications = [];

  List<AppNotification> get notifications => _notifications;

  void add(Article article) {
    final newArticle = AppNotification(
      article: article,
    );
    _notifications.add(newArticle);
    notifyListeners();
  }

  void markAsRead(int index) {
    _notifications[index].isRead = true;
    notifyListeners();
  }

  void clear() {
    _notifications.clear();
    notifyListeners();
  }
}
