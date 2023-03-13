import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../providers/signup_login_provider.dart';

import '../../widgets/app_bar_widgets/profile_app_bar.dart';
import '../../widgets/line_separator.dart';
import '../../widgets/svg_widgets/documents_svg.dart';
import '../../widgets/svg_widgets/logout_svg.dart';
import '../../widgets/svg_widgets/settings_svg.dart';
import '../../widgets/text_with_icon.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    const profileLineSeparator = LineSeparator(verticalMargin: 8.0);
    final signupLoginProvider = Provider.of<SignupLoginProvider>(context);

    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Container(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWithIcon(
                text: 'Settings',
                color: AppColors.deepDarkBlue,
                fontSize: 16,
                isWidthIntrinsic: true,
                svg: SettingsSvg(),
              ),
              profileLineSeparator,
              const TextWithIcon(
                text: 'Terms & Privacy',
                color: AppColors.deepDarkBlue,
                fontSize: 16,
                isWidthIntrinsic: true,
                svg: DocumentsSvg(),
              ),
              profileLineSeparator,
              GestureDetector(
                onTap: () async => await signupLoginProvider.logout(context),
                child: const TextWithIcon(
                  text: 'Logout',
                  color: AppColors.deepDarkBlue,
                  fontSize: 16,
                  isWidthIntrinsic: true,
                  svg: LogoutSvg(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
