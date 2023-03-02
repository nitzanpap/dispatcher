import 'package:dispatcher/constants/colors.dart';
import 'package:dispatcher/widgets/svg_widgets/star_svg.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Tab(
            icon: IconButton(
              onPressed: () => print('Profile tab click'),
              icon: const Icon(
                Icons.person_outline,
                color: AppColors.white,
                size: 36,
              ),
            ),
          ),
          Tab(
            icon: IconButton(
              onPressed: () => print('Home tab click'),
              icon: const Icon(
                Icons.house_outlined,
                color: AppColors.white,
                size: 36,
              ),
            ),
          ),
          Tab(
            icon: IconButton(
              onPressed: () => print('Favorite tab click'),
              icon: const StarSvg(),
            ),
          ),
        ],
      ),
    );
  }
}
