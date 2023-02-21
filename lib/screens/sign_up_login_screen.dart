import 'package:dispatcher/global_constants.dart';
import 'package:dispatcher/widgets/logo_widgets/logo_layered.dart';
import 'package:dispatcher/widgets/minimal_app_bar.dart';
import 'package:dispatcher/widgets/sign_up_login_form.dart';
import 'package:flutter/material.dart';

class SignUpLoginScreen extends StatelessWidget {
  final bool isLogin;

  const SignUpLoginScreen({super.key, this.isLogin = false});
  static const int logoSectionSize = 36;

  @override
  Widget build(BuildContext context) {
    const logoLayered = LogoLayered();
    return Scaffold(
      backgroundColor: FigmaColors.deepDarkBlue,
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
                color: FigmaColors.white,
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
