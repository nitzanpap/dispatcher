import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const ProgressBar({
    super.key,
    required this.totalSteps,
    this.currentStep = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Progress Bar: $currentStep/$totalSteps',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
