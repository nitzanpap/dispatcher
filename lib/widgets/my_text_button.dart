import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final VoidCallback onPressedFunction;
  final String text;
  final TextStyle? textStyle;
  final Icon? icon;

  const MyTextButton({
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
            style: textStyle ?? TextStyle(color: Colors.black),
          ),
          icon ?? SizedBox.shrink(),
        ],
      ),
    );
  }
}
