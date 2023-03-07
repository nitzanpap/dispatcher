import 'package:dispatcher/enums/valid_main_tabs.dart';
import 'package:dispatcher/widgets/app_bar_widgets/minimal_app_bar.dart';
import 'package:dispatcher/widgets/app_bar_widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../providers/bottom_navigation_provider.dart';

import '../widgets/app_bar_widgets/primary_app_bar.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import '../widgets/text_with_icon.dart';

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
      return getProfileView();
    }
    if (currentPrimaryTabName == ValidPrimaryTabs.home.name) {
      return getHomeView();
    }
    if (currentPrimaryTabName == ValidPrimaryTabs.favorites.name) {
      return getFavoritesView();
    } else {
      return getTextRoutePlaceholder(currentPrimaryTabName);
    }
  }

  SizedBox getTextRoutePlaceholder(String currentPrimaryTabName) {
    return SizedBox(
      width: 200,
      height: 200,
      child: TextWithIcon(
        text: currentPrimaryTabName,
        color: AppColors.deepDarkBlue,
      ),
    );
  }

  Scaffold getProfileView() {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Container(
        alignment: Alignment.center,
        color: AppColors.white,
        child: const TextWithIcon(
          text: 'Profile',
          color: AppColors.deepDarkBlue,
        ),
      ),
    );
  }

  Scaffold getHomeView() {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Container(
        alignment: Alignment.center,
        color: AppColors.white,
        child: const TextWithIcon(
          text: 'Home',
          color: AppColors.deepDarkBlue,
        ),
      ),
    );
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
