import 'package:dispatcher/global_constants.dart';
import 'package:dispatcher/widgets/logo_widgets/logo_layered.dart';
import 'package:dispatcher/widgets/sign_up_login_form.dart';
import 'package:flutter/material.dart';

class SignUpLoginScreen extends StatelessWidget {
  final bool isLogin;

  const SignUpLoginScreen({super.key, this.isLogin = false});
  static const int logoSectionSize = 36;

  @override
  Widget build(BuildContext context) {
    final logoLayered = const LogoLayered();
    return Scaffold(
      backgroundColor: FigmaColors.DEEP_DARK_BLUE,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: logoSectionSize,
              child: Center(child: logoLayered),
            ),
            Flexible(
              flex: 100 - logoSectionSize,
              child: Container(
                color: FigmaColors.WHITE,
                width: double.infinity,
                height: double.infinity,
                child: SignUpLoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
