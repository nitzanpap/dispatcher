import 'package:flutter/material.dart';

import '../../constants/colors.dart';

import '../../widgets/button_widgets/base_button.dart';

class SecondaryButton extends BaseButton {
  // final Color color;

  const SecondaryButton({
    super.key,
    required super.text,
    required super.onPressedFunction,
    super.icon,
    // this.color = AppColors.blue,
  }) : super(
          textColor: AppColors.mediumBlue,
          fontWeight: FontWeight.w400,
          backgroundColor: AppColors.mediumGrey,
          elevation: 0,
        );
}
