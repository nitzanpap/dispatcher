import 'package:dispatcher/enums/valid_main_tabs.dart';
import 'package:dispatcher/providers/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

import '../widgets/svg_widgets/home_active_svg.dart';
import '../widgets/svg_widgets/home_svg.dart';
import '../widgets/svg_widgets/person_active_svg.dart';
import '../widgets/svg_widgets/person_svg.dart';
import '../widgets/svg_widgets/star_active_svg.dart';
import '../widgets/svg_widgets/star_svg.dart';

class AppBottomNavigationBar extends StatelessWidget {
  void _onItemTapped(int newIndex, BottomNavigationProvider tabsProvider) {
    tabsProvider.changeTabIndex(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context);
    final currentMainTabIndex = bottomNavigationProvider.currentMainTabIndex;

    return BottomNavigationBar(
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
      currentIndex: currentMainTabIndex,
      onTap: (newIndex) => _onItemTapped(newIndex, bottomNavigationProvider),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      fixedColor: AppColors.white,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
  // return Container(
  //   padding: const EdgeInsets.only(bottom: 30, top: 20),
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       Tab(
  //         icon: IconButton(
  //           onPressed: () => print('Profile tab click'),
  //           icon: const PersonSvg(),
  //         ),
  //       ),
  //       Tab(
  //         icon: IconButton(
  //           onPressed: () => print('Home tab click'),
  //           icon: const HomeSvg(),
  //         ),
  //       ),
  //       Tab(
  //         icon: IconButton(
  //           onPressed: () => print('Favorite tab click'),
  //           icon: const StarSvg(),
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}
