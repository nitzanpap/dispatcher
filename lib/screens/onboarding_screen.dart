import 'package:dispatcher/global_constants.dart';
import 'package:dispatcher/widgets/my_text_button.dart';
import 'package:dispatcher/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../widgets/paper_widgets/double_paper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List onboardingDescriptions = [
    'Welcome to Dispatcher, the right way to read your news. Just open the app.',
    'Search your fields of interest and the best part..',
    'Save all your articles for later, filter, learn and explore the latest news.',
  ];
  int currentStep = 0;

  void moveToNextStep() {
    setState(() {
      if (currentStep + 1 <= onboardingDescriptions.length - 1) {
        currentStep++;
      } else {
        // Implement this later.
        print('Finished Onboarding!');
      }
    });
  }

  void skipOnboarding() {
    setState(() {
      currentStep = onboardingDescriptions.length - 1;
    });
    moveToNextStep();
  }

  @override
  Widget build(BuildContext context) {
    const GAP_SEPARATOR_HEIGHT = 40.0;

    Text TitleText(BuildContext context) {
      return Text(
        appTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 240,
              child: Column(
                children: [
                  ProgressBar(
                    currentStep: currentStep,
                    totalSteps: onboardingDescriptions.length,
                  ),
                  const Gap(GAP_SEPARATOR_HEIGHT),
                  TitleText(context),
                  const Gap(GAP_SEPARATOR_HEIGHT),
                  Text(
                    onboardingDescriptions[currentStep],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  DoublePaper(currentStep: currentStep + 1),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextButton(
                          onPressedFunction: () => skipOnboarding(),
                          text: 'Skip',
                          textStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                        MyTextButton(
                          onPressedFunction: () => moveToNextStep(),
                          text: 'Next',
                          textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                          ),
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
