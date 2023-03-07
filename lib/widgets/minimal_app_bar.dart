import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../enums/theme_color.dart';

class MinimalAppBar extends StatelessWidget with PreferredSizeWidget {
  final ThemeColor theme;
  final double? elevation;

  const MinimalAppBar({
    super.key,
    this.theme = ThemeColor.dark,
    this.elevation,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return theme == ThemeColor.dark
        ? AppBar(
            toolbarHeight: 0,
            backgroundColor: AppColors.deepDarkBlue,
            elevation: elevation,
          )
        : AppBar(
            toolbarHeight: 0,
            backgroundColor: AppColors.white,
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
