import 'package:dispatcher/constants/colors.dart';
import 'package:dispatcher/widgets/button_widgets/base_button.dart';
import 'package:flutter/material.dart';

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
