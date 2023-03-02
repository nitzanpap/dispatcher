import 'package:dispatcher/constants/colors.dart';
import 'package:dispatcher/widgets/app_bottom_navigation_bar.dart';
import 'package:dispatcher/widgets/app_icons.dart';
import 'package:dispatcher/widgets/svg_widgets/logo_layered.dart';
import 'package:dispatcher/widgets/svg_widgets/notification_svg.dart';
import '../widgets/svg_widgets/search_svg.dart';
import 'package:dispatcher/widgets/text_with_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepDarkBlue,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: AppColors.deepDarkBlue,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () => print('Search icon clicked'),
                icon: const SearchSvg()),
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
      ),
      body: Container(
        alignment: Alignment.center,
        color: AppColors.white,
        child: const SizedBox(
          width: 200,
          height: 200,
          child: TextWithIcon(
            text: 'Home Screen',
            color: AppColors.deepDarkBlue,
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
