import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../ui/providers/bottom_navigation_provider.dart';

import '../widgets/svg_widgets/home_active_svg.dart';
import '../widgets/svg_widgets/home_svg.dart';
import '../widgets/svg_widgets/person_active_svg.dart';
import '../widgets/svg_widgets/person_svg.dart';
import '../widgets/svg_widgets/star_active_svg.dart';
import '../widgets/svg_widgets/star_svg.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context);
    final currentPrimaryTabIndex =
        bottomNavigationProvider.currentPrimaryTabIndex;

    return SizedBox(
      height: 100,
      child: BottomNavigationBar(
        backgroundColor: AppColors.deepDarkBlue,
        items: const [
          BottomNavigationBarItem(
            activeIcon: PersonActiveSvg(),
            icon: PersonSvg(),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            activeIcon: HomeActiveSvg(),
            icon: HomeSvg(),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: StarActiveSvg(),
            icon: StarSvg(),
            label: 'Favorites',
          ),
        ],
        currentIndex: currentPrimaryTabIndex,
        onTap: (newIndex) => bottomNavigationProvider.changeMainTab(newIndex),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        fixedColor: AppColors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
