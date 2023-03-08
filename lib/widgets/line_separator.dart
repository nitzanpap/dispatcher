import 'package:flutter/material.dart';

import '../constants/colors.dart';

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
