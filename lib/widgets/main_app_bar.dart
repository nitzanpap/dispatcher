import 'package:flutter/material.dart';

import '../constants/colors.dart';

import '../widgets/svg_widgets/logo_layered.dart';
import '../widgets/svg_widgets/notification_svg.dart';
import '../widgets/svg_widgets/search_svg.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      backgroundColor: AppColors.deepDarkBlue,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () => print('Search icon clicked'),
            icon: const SearchSvg(),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              backgroundColor: AppColors.badgeColor,
              // isLabelVisible: false,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => print('Notifications icon clicked'),
                  icon: const NotificationSvg()),
            ),
          ),
        ),
      ],
      leading: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: LogoLayered(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
