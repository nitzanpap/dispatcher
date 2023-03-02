import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../providers/signup_login_provider.dart';

import '../widgets/minimal_app_bar.dart';
import '../widgets/svg_widgets/logo_layered.dart';
import '../widgets/signup_login_form.dart';

class SignupLoginScreen extends StatelessWidget {
  final bool isLogin;

  const SignupLoginScreen({super.key, this.isLogin = false});
  static const int logoSectionSize = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepDarkBlue,
      appBar: const MinimalAppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: logoSectionSize,
                child: Center(
                  child: LogoLayered(),
                ),
              ),
              Flexible(
                flex: 100 - logoSectionSize,
                child: Container(
                  color: AppColors.white,
                  width: double.infinity,
                  height: double.infinity,
                  child: ChangeNotifierProvider(
                    create: (context) => SignupLoginProvider(),
                    child: const SignupLoginForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
