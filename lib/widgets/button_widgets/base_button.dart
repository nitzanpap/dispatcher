import 'package:dispatcher/constants/colors.dart';
import 'package:dispatcher/enums/icon_direction.dart';
import 'package:dispatcher/widgets/text_with_icon.dart';
import 'package:flutter/material.dart';

abstract class BaseButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final Function onPressedFunction;
  final Icon? icon;
  final double? buttonShapeRadius;
  final double? elevation;

  const BaseButton({
    super.key,
    required this.text,
    required this.onPressedFunction,
    this.textColor = AppColors.white,
    this.fontWeight = FontWeight.w500,
    this.backgroundColor = AppColors.blue,
    this.icon,
    this.buttonShapeRadius = 10.0,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(36),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonShapeRadius!)),
          elevation: elevation,
        ),
        onPressed: () => onPressedFunction(),
        child: TextWithIcon(
          text: text,
          color: textColor,
          fontSize: 14,
          fontWeight: fontWeight,
          letterSpacing: 0.25,
          icon: icon,
          iconDirection: IconDirection.end,
        ),
      ),
    );
  }
}
