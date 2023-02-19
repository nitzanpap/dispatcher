import 'package:flutter/material.dart';

class TextButtonWithRightIcon extends StatelessWidget {
  final VoidCallback onPressedFunction;
  final String text;
  final TextStyle? textStyle;
  final Icon? icon;

  const TextButtonWithRightIcon({
    super.key,
    required this.onPressedFunction,
    required this.text,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressedFunction(),
      child: Row(
        children: [
          Text(
            text,
            style: textStyle ?? const TextStyle(color: Colors.black),
          ),
          icon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
