import 'package:flutter/material.dart';

import '../../core/models/news_api_models/article.dart';
import '../../core/models/app_notification.dart';

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
