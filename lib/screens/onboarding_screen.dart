import 'package:dispatcher/global_constants.dart';
import 'package:dispatcher/providers/onboarding_step_provider.dart';
import 'package:dispatcher/widgets/text_button_with_icon.dart';
import 'package:dispatcher/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../widgets/paper_widgets/double_paper.dart';

const GAP_SEPARATOR_HEIGHT = 40.0;
const GAP = const Gap(GAP_SEPARATOR_HEIGHT);

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingStepProvider = Provider.of<OnboardingStepProvider>(context);
    final int currentStep = onboardingStepProvider.stepNumber;

    void moveToNextStep() {
      if (currentStep + 1 <= onboardingStepProvider.descriptions.length - 1) {
        onboardingStepProvider.moveoToNextStep();
      } else {
        // Implement this later.
        print('Finished Onboarding!');
      }
    }

    Text getTitleTextView(Color color) {
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
                    totalSteps: onboardingStepProvider.descriptions.length,
                  ),
                  GAP,
                  getTitleTextView(Theme.of(context).colorScheme.onPrimary),
                  GAP,
                  Text(
                    onboardingStepProvider.descriptions[currentStep],
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
                        TextButtonWithRightIcon(
                          onPressedFunction: () =>
                              onboardingStepProvider.skipToEndOfOnboarding(),
                          text: 'Skip',
                          textStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                        TextButtonWithRightIcon(
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
