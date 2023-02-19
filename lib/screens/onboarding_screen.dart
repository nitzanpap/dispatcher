import 'package:dispatcher/global_constants.dart';
import 'package:dispatcher/models/onboarding_step_model.dart';
import 'package:dispatcher/providers/onboarding_step_provider.dart';
import 'package:dispatcher/widgets/my_text_button.dart';
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
    final currentStepData = Provider.of<OnboardingStepProvider>(context);
    final int currentStep = currentStepData.stepNumber;

    void moveToNextStep() {
      if (currentStep + 1 <= currentStepData.descriptions.length - 1) {
        currentStepData.moveoToNextStep();
      } else {
        // Implement this later.
        print('Finished Onboarding!');
      }
    }

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
                    totalSteps: currentStepData.descriptions.length,
                  ),
                  GAP,
                  TitleText(context),
                  GAP,
                  Text(
                    currentStepData.descriptions[currentStep],
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
                          onPressedFunction: () =>
                              currentStepData.skipToEndOfOnboarding(),
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
