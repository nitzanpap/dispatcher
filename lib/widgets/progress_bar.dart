import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: LinearProgressIndicator(
        color: AppColors.error,
        value: (currentStep + 1) / totalSteps,
        backgroundColor: Colors.grey[800],
        minHeight: 10,
      ),
    );
  }
}
