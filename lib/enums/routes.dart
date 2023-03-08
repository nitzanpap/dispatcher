enum ValidRoutes {
  splashScreen,
  onboardingScreen,
  signupLoginScreen,
  primaryScreen,
}

extension ValidRoutesExtension on ValidRoutes {
  String get route {
    switch (this) {
      case ValidRoutes.splashScreen:
        return '/splash_screen';
      case ValidRoutes.onboardingScreen:
        return '/onboarding_screen';
      case ValidRoutes.signupLoginScreen:
        return '/sign_up_login_screen';
      case ValidRoutes.primaryScreen:
        return '/primary_screen';
    }
  }
}
