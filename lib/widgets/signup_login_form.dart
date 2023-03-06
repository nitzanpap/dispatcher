import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../providers/signup_login_provider.dart';

import './button_widgets/primary_button.dart';
import './button_widgets/secondary_button.dart';
import '../widgets/line_separator.dart';
import '../widgets/input_field_widgets/email_input_field.dart';
import '../widgets/input_field_widgets/password_input_field.dart';
import '../widgets/text_with_icon.dart';

class SignupLoginForm extends StatefulWidget {
  const SignupLoginForm({super.key});

  @override
  State<SignupLoginForm> createState() => _SignupLoginFormState();
}

class _SignupLoginFormState extends State<SignupLoginForm> {
  static const gapView = Gap(24);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signupLoginProvider = Provider.of<SignupLoginProvider>(context);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) =>
              SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getInputsSectionView(signupLoginProvider),
                  const LineSeparator(),
                  getButtonsSectionView(signupLoginProvider)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getInputsSectionView(SignupLoginProvider signupLoginProvider) {
    return Column(
      children: [
        getTitleView(signupLoginProvider.title),
        gapView,
        EmailInputField(
          onChanged: (String value) => signupLoginProvider.updateEmail = value,
        ),
        gapView,
        PasswordInputField(
          onChanged: (String value) =>
              signupLoginProvider.updatePassword = value,
          textInputAction: TextInputAction.next,
        ),
        gapView,
        if (signupLoginProvider.isSignupPage)
          PasswordInputField.confirmationPassword(
            onChanged: (String value) =>
                signupLoginProvider.updateConfirmationPassword = value,
            originalPassword: signupLoginProvider.password,
          ),
      ],
    );
  }

  Widget getTitleView(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: AppColors.mediumBlue,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget getButtonsSectionView(
    SignupLoginProvider signupLoginProvider,
  ) {
    return Column(
      children: [
        PrimaryButton(
          text: signupLoginProvider.title.toUpperCase(),
          onPressedFunction: () async {
            SnackBar snackBar = SnackBar(
              content: TextWithIcon(
                text: signupLoginProvider.getSnackBarActionText,
                color: AppColors.white,
              ),
              backgroundColor: AppColors.deepDarkBlue,
              duration: const Duration(seconds: 3),
            );
            showAndReplaceSnackBar(snackBar);
            final msgFromFirebase = await signupLoginProvider
                .getMessageFromFirebaseAuth(formKey: _formKey);
            snackBar = SnackBar(
              content:
                  TextWithIcon(text: msgFromFirebase, color: AppColors.white),
              backgroundColor: AppColors.deepDarkBlue,
              duration: const Duration(seconds: 3),
            );
            if (context.mounted) {
              showAndReplaceSnackBar(snackBar);
              // TODO: Implement here, authenticating with firebase and moving to the next page.
            }
          },
          icon: const Icon(
            Icons.arrow_forward_rounded,
            size: 30,
            color: AppColors.white,
          ),
        ),
        SecondaryButton(
            text: signupLoginProvider.oppositeTitle.toUpperCase(),
            onPressedFunction: () {
              signupLoginProvider.resetFormData(formKey: _formKey);
              signupLoginProvider.switchSignUpLoginPage();
            }),
      ],
    );
  }

  void showAndReplaceSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
