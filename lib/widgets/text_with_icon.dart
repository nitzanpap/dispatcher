import 'package:flutter/material.dart';

import '../enums/icon_direction.dart';

class TextWithIcon extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final Icon? icon;
  final IconDirection iconDirection;

  final double letterSpacing;

  const TextWithIcon({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0,
    this.icon,
    this.iconDirection = IconDirection.start,
  });

  @override
  Widget build(BuildContext context) {
    bool isIconOnStart = iconDirection == IconDirection.start;
    bool isIconOnEnd = iconDirection == IconDirection.end;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (icon != null && isIconOnStart) ? icon! : const SizedBox.shrink(),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
        ),
        (icon != null && isIconOnEnd) ? icon! : const SizedBox.shrink(),
      ],
    );
  }
}
