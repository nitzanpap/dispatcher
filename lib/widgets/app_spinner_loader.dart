import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppSpinnerLoader extends StatelessWidget {
  const AppSpinnerLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: AppColors.lightBlue,
      color: AppColors.cyberPurple,
      strokeWidth: 8,
    );
  }
}
