import 'package:dispatcher/global_constants.dart';
import 'package:flutter/material.dart';

class MinimalAppBar extends StatelessWidget with PreferredSizeWidget {
  final ThemeColor theme;
  final bool defaultToolbarHeight;

  const MinimalAppBar({
    super.key,
    this.theme = ThemeColor.dark,
    this.defaultToolbarHeight = false,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return theme == ThemeColor.dark
        ? AppBar(
            toolbarHeight: 0,
            backgroundColor: FigmaColors.deepDarkBlue,
          )
        : AppBar(
            toolbarHeight: 0,
            backgroundColor: FigmaColors.white,
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
