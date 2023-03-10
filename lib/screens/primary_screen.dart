import 'package:dispatcher/screens/home_page_view.dart';
import 'package:dispatcher/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../enums/valid_main_tabs.dart';
import '../providers/bottom_navigation_provider.dart';

import '../widgets/app_bar_widgets/primary_app_bar.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import '../widgets/text_with_icon.dart';
import '../widgets/app_bar_widgets/minimal_app_bar.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context);
    final currentPrimaryTabName =
        bottomNavigationProvider.currentPrimaryTabName;

    return Scaffold(
      backgroundColor: AppColors.deepDarkBlue,
      appBar: const MinimalAppBar(
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        color: AppColors.white,
        child: getPrimaryTabWidget(currentPrimaryTabName),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }

  Widget getPrimaryTabWidget(String currentPrimaryTabName) {
    if (currentPrimaryTabName == ValidPrimaryTabs.profile.name) {
      return const ProfilePageView();
    }
    if (currentPrimaryTabName == ValidPrimaryTabs.home.name) {
      return const HomePageView();
    }
    if (currentPrimaryTabName == ValidPrimaryTabs.favorites.name) {
      return getFavoritesView();
    }
    return const HomePageView();
  }

  Scaffold getFavoritesView() {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Container(
        alignment: Alignment.center,
        color: AppColors.white,
        child: const TextWithIcon(
          text: 'Favorites',
          color: AppColors.deepDarkBlue,
        ),
      ),
    );
  }
}
