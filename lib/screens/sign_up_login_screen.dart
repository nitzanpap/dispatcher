import 'package:flutter/material.dart';

import '../constants/colors.dart';

import '../widgets/minimal_app_bar.dart';
import '../widgets/logo_widgets/logo_layered.dart';
import '../widgets/sign_up_login_form.dart';

class SignUpLoginScreen extends StatelessWidget {
  final bool isLogin;

  const SignUpLoginScreen({super.key, this.isLogin = false});
  static const int logoSectionSize = 40;

  @override
  Widget build(BuildContext context) {
    const logoLayered = LogoLayered();
    return Scaffold(
      backgroundColor: AppColors.deepDarkBlue,
      appBar: const MinimalAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              flex: logoSectionSize,
              child: Center(child: logoLayered),
            ),
            Flexible(
              flex: 100 - logoSectionSize,
              child: Container(
                color: AppColors.white,
                width: double.infinity,
                height: double.infinity,
                child: const SignUpLoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
