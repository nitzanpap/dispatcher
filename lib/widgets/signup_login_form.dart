import 'dart:convert';

import 'package:dispatcher/api/firebase_auth.dart';
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
  static const gapView = Gap(24);

  final _formKey = GlobalKey<FormState>();

  bool isSignupPage = true;
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
                  getInputsSectionView(title),
                  const LineSeparator(),
                  getButtonsSectionView(title, signupLoginProvider)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getInputsSectionView(String title) {
    return Column(
      children: [
        getTitleView(title),
        gapView,
        EmailInputField(
          onChanged: (String value) => setState(() => email = value),
        ),
        gapView,
        PasswordInputField(
          onChanged: (String value) => setState(() => password = value),
          textInputAction: TextInputAction.next,
        ),
        gapView,
        if (isSignupPage)
          PasswordInputField.reEnteredPassword(
            onChanged: (String value) =>
                setState(() => retypedPassword = value),
            originalPassword: password,
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
            isSignUp: isSignupPage,
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

  Future<void> submitForm({
    required GlobalKey formKey,
    required SignupLoginProvider provider,
    required String formEmail,
    required String formPassword,
    required bool isSignUp,
  }) async {
    if (!isFormValid(formKey)) {
      debugPrint('Invalid input somewhere in the form!');
      return;
    }
    debugPrint('Valid Form!');
    try {
      final loginData = await (isSignUp
          ? signup(email: formEmail, password: formPassword)
          : login(email: formEmail, password: formPassword));
      final loginDataObj = jsonDecode(loginData.body);
      debugPrint(loginDataObj.toString());
      provider.updateProvider(
          formEmail: formEmail,
          formPassword: formPassword,
          newIdToken: loginDataObj["idToken"]);
    } catch (e) {
      debugPrint(e.toString());
    }
    // TODO: Implement here, authenticating with firebase and moving to the next page.
  }

  bool isFormValid(formKey) => formKey.currentState!.validate();
}
