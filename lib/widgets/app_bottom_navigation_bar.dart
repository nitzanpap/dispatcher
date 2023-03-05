import 'package:dispatcher/constants/colors.dart';
import 'package:dispatcher/widgets/svg_widgets/home_active_svg.dart';
import 'package:dispatcher/widgets/svg_widgets/home_svg.dart';
import 'package:dispatcher/widgets/svg_widgets/person_active_svg.dart';
import 'package:dispatcher/widgets/svg_widgets/person_svg.dart';
import 'package:dispatcher/widgets/svg_widgets/star_active_svg.dart';
import 'package:dispatcher/widgets/svg_widgets/star_svg.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
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
