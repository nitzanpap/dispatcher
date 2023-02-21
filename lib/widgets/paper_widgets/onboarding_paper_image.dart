import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPaperImage extends StatelessWidget {
  final int currentStep;

  const OnboardingPaperImage({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/paper_images/double_paper$currentStep.svg',
      semanticsLabel: 'Double Paper $currentStep svg',
      placeholderBuilder: (context) => Text('Double Paper $currentStep svg'),
    );
  }
}
