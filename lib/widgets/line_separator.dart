import 'package:dispatcher/constants/colors.dart';
import 'package:flutter/material.dart';

class LineSeparator extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const LineSeparator({
    super.key,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 1,
      color: color ?? AppColors.grey,
    );
  }
}
