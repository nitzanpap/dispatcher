class OnboardingStepModel {
  int _stepNumber = 0;

  final List<String> _descriptions = [
    'Welcome to Dispatcher, the right way to read your news. Just open the app.',
    'Search your fields of interest and the best part..',
    'Save all your articles for later, filter, learn and explore the latest news.',
  ];

  int get stepNumber => _stepNumber;

  List<String> get descriptions => _descriptions;

  void moveoToNextStep() {
    _stepNumber++;
  }

  void skipToEndOfOnboarding() {
    _stepNumber = descriptions.length - 1;
  }
}
