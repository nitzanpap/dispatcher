import 'package:dispatcher/widgets/svg_widgets/profile_placeholder_svg.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

import '../svg_widgets/search_svg.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 79,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.deepDarkBlue,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Hi Noam',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
          Text(
            'Edit my profile',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.darkGrey,
            ),
          )
        ],
      ),
      centerTitle: false,
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: ProfilePlaceholder(),
        ),
      ],
      elevation: 10,
      shadowColor: AppColors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(79);
}

class SearchIconBtn extends StatelessWidget {
  const SearchIconBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () => print('Search icon clicked'),
        icon: const SearchSvg(),
      ),
    );
  }
}
