import 'package:dispatcher/global_constants.dart';
import 'package:flutter/material.dart';

class TextButtonWithIcon extends StatelessWidget {
  final VoidCallback onPressedFunction;
  final String text;
  final Color color;
  final double fontSize;
  final Icon? icon;
  final IconDirection iconDirection;

  const TextButtonWithIcon({
    super.key,
    required this.onPressedFunction,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16.0,
    this.icon,
    this.iconDirection = IconDirection.start,
  });

  @override
  Widget build(BuildContext context) {
    bool isIconOnStart = iconDirection == IconDirection.start;
    bool isIconOnEnd = iconDirection == IconDirection.end;
    return TextButton(
      onPressed: () => onPressedFunction(),
      child: Row(
        children: [
          (icon != null && isIconOnStart) ? icon! : const SizedBox.shrink(),
          Text(
            text,
            style: TextStyle(color: color, fontSize: fontSize),
          ),
          (icon != null && isIconOnEnd) ? icon! : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
