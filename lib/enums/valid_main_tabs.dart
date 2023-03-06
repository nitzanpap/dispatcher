import '../constants/routes.dart';

enum ValidMainTabs {
  profile,
  home,
  favorites,
}

extension ValidMainTabsExtension on ValidMainTabs {
  String get route {
    switch (this) {
      case ValidMainTabs.profile:
        return ValidRoutes.profileScreen;
      case ValidMainTabs.home:
        return ValidRoutes.homeScreen;
      case ValidMainTabs.favorites:
        return ValidRoutes.favoritesScreen;
    }
  }
}
