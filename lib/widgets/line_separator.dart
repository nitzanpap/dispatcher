import 'package:flutter/material.dart';

import '../constants/colors.dart';

class LineSeparator extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double verticalMargin;

  const LineSeparator({
    super.key,
    this.width,
    this.height,
    this.color,
    this.verticalMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      width: width ?? double.infinity,
      height: height ?? 1,
      color: color ?? AppColors.grey,
    );
  }
}
