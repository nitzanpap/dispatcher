import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../enums/signup_login_title.dart';
import '../constants/colors.dart';
import '../providers/signup_login_provider.dart';

import './button_widgets/primary_button.dart';
import './button_widgets/secondary_button.dart';
import '../widgets/line_separator.dart';
import '../widgets/input_field_widgets/email_input_field.dart';
import '../widgets/input_field_widgets/password_input_field.dart';

class SignupLoginForm extends StatefulWidget {
  const SignupLoginForm({super.key});

  @override
  State<SignupLoginForm> createState() => _SignupLoginFormState();
}

class _SignupLoginFormState extends State<SignupLoginForm> {
  static const gap = Gap(24);

  final _formKey = GlobalKey<FormState>();

  bool isSignupPage = true;
  bool isObscureText = true;
  String email = '';
  String password = '';
  String retypedPassword = '';

  @override
  Widget build(BuildContext context) {
    final signupLoginProvider = Provider.of<SignupLoginProvider>(context);

    final title =
        isSignupPage ? SignupLoginTitle.signup : SignupLoginTitle.login;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) =>
              SingleChildScrollView(
            // primary: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getInputsSection(title),
                  const LineSeparator(),
                  getButtonsSection(title, signupLoginProvider)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column getInputsSection(String title) {
    return Column(
      children: [
        getTitleView(title),
        gap,
        EmailInputField(
          onChanged: (String value) => setState(() => email = value),
        ),
        gap,
        PasswordInputField(
          onChanged: (String value) => setState(() => password = value),
          textInputAction: TextInputAction.next,
        ),
        gap,
        if (isSignupPage)
          PasswordInputField.reEnteredPassword(
            onChanged: (String value) =>
                setState(() => retypedPassword = value),
            originalPassword: password,
          ),
      ],
    );
  }

  Row getTitleView(String title) {
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

  Column getButtonsSection(
    String title,
    SignupLoginProvider signupLoginProvider,
  ) {
    return Column(
      children: [
        PrimaryButton(
          text: title.toUpperCase(),
          onPressedFunction: () => submitForm(
            formKey: _formKey,
            provider: signupLoginProvider,
            formEmail: email,
            formPassword: password,
          ),
          icon: const Icon(
            Icons.arrow_forward_rounded,
            size: 30,
            color: AppColors.white,
          ),
        ),
        SecondaryButton(
            text: isSignupPage
                ? SignupLoginTitle.login.toUpperCase()
                : SignupLoginTitle.signup.toUpperCase(),
            onPressedFunction: () {
              resetFormData(signupLoginProvider);
              setState(() => isSignupPage = !isSignupPage);
            }),
      ],
    );
  }

  void resetFormData(SignupLoginProvider provider) {
    _formKey.currentState?.reset();
    provider.resetFormData();
  }

  void submitForm({
    required formKey,
    required SignupLoginProvider provider,
    required String formEmail,
    required String formPassword,
  }) {
    if (!formKey.currentState!.validate()) {
      print('Invalid input somewhere in the form!');
      return;
    }
    provider.updateEmail(formEmail);
    provider.updatePassword(formPassword);
    // TODO: Implement here, authenticating with firebase and moving to the next page.
    return;
  }
}
