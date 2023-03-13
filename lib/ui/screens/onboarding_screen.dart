import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../enums/icon_direction.dart';
import '../../constants/strings.dart';
import '../../constants/colors.dart';
import '../../enums/routes.dart';

import '../providers/onboarding_step_provider.dart';
import '../../widgets/progress_bar.dart';
import '../../widgets/paper_widgets/onboarding_paper_image.dart';
import '../../widgets/text_widgets/text_with_icon.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const gapSeparatorHeight = 40.0;
  final gap = const Gap(gapSeparatorHeight);

  @override
  Widget build(BuildContext context) {
    final onboardingStepProvider = Provider.of<OnboardingStepProvider>(context);
    final int currentStep = onboardingStepProvider.stepNumber;

    return Scaffold(
      backgroundColor: AppColors.deepDarkBlue,
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getProgressAndTitleView(
              currentStep,
              onboardingStepProvider.descriptions,
            ),
            getPageImageAndButtonsView(
                currentStep, onboardingStepProvider, context),
          ],
        ),
      ),
    );
  }

  Widget getProgressAndTitleView(int currentStep, List<String> descriptions) {
    return FractionallySizedBox(
      widthFactor: 0.75,
      child: Column(
        children: [
          ProgressBar(
            currentStep: currentStep,
            totalSteps: descriptions.length,
          ),
          gap,
          getTitleTextView(AppColors.white),
          gap,
          Text(
            descriptions[currentStep],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }

  Expanded getPageImageAndButtonsView(
    int currentStep,
    OnboardingStepProvider onboardingStepProvider,
    context,
  ) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          OnboardingPaperImage(currentStep: currentStep + 1),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getSkipButtonView(context),
                getNextButtonView(currentStep, onboardingStepProvider, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton getNextButtonView(
    int currentStep,
    OnboardingStepProvider onboardingStepProvider,
    context,
  ) {
    return TextButton(
      onPressed: () {
        if (currentStep + 1 <= onboardingStepProvider.descriptions.length - 1) {
          onboardingStepProvider.incrementOnboardingStep();
        } else {
          onSkipOnboardingPressed(context);
        }
      },
      child: const TextWithIcon(
        text: 'Next',
        color: AppColors.white,
        fontSize: 16,
        icon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.white,
          size: 16,
        ),
        iconDirection: IconDirection.end,
      ),
    );
  }

  TextButton getSkipButtonView(context) {
    return TextButton(
      onPressed: () => onSkipOnboardingPressed(context),
      child: const TextWithIcon(
        text: 'Skip',
        color: AppColors.black,
      ),
    );
  }

  Text getTitleTextView(Color color) {
    return Text(
      appTitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }

  void onSkipOnboardingPressed(context) {
    GoRouter.of(context).goNamed(ValidRoutes.signupLoginScreen.name);
  }
}
