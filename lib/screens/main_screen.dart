import 'package:dispatcher/providers/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

import '../widgets/main_app_bar.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import '../widgets/text_with_icon.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context);
    final currentMainTabRoute = bottomNavigationProvider.currentMainTabRoute;

    return Scaffold(
      backgroundColor: AppColors.deepDarkBlue,
      appBar: const MainAppBar(),
      body: Container(
        alignment: Alignment.center,
        color: AppColors.white,
        child: SizedBox(
          width: 200,
          height: 200,
          child: TextWithIcon(
            text: currentMainTabRoute,
            color: AppColors.deepDarkBlue,
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
