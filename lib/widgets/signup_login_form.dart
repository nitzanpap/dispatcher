import 'dart:convert';

import 'package:dispatcher/api/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:http/src/response.dart';
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
          onPressedFunction: () async {
            SnackBar snackBar = SnackBar(
              content: Text(isSignupPage ? 'Signing up...' : 'Signing in...'),
              duration: const Duration(seconds: 3),
            );
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            final msgFromFirebase = await submitForm(
              formKey: _formKey,
              provider: signupLoginProvider,
              formEmail: email,
              formPassword: password,
              isSignUp: isSignupPage,
            );
            snackBar = SnackBar(
              content: Text(msgFromFirebase),
              duration: const Duration(seconds: 3),
            );
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // TODO: Implement here, authenticating with firebase and moving to the next page.
          },
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

  Future<String> submitForm({
    required GlobalKey formKey,
    required SignupLoginProvider provider,
    required String formEmail,
    required String formPassword,
    required bool isSignUp,
  }) async {
    if (!isFormValid(formKey)) {
      return 'Invalid input somewhere in the form!';
    }
    debugPrint('Valid Form!');
    final Response loginData;
    Map<String, dynamic> loginDataObj;
    try {
      loginData = await (isSignUp
          ? signup(email: formEmail, password: formPassword)
          : login(email: formEmail, password: formPassword));
      loginDataObj = jsonDecode(loginData.body);
    } catch (e) {
      debugPrint('Error:');
      debugPrint(e.toString());
      return e.toString();
    }
    switch (loginData.reasonPhrase) {
      case "Bad Request":
        return loginDataObj['error']['message'];
      case "OK":
        provider.updateProvider(
            formEmail: formEmail,
            formPassword: formPassword,
            newIdToken: loginDataObj["idToken"]);
        return isSignUp ? 'Signed up successfully' : 'Signed in successfully';
      default:
        debugPrint(
            'Unknown \'reasonPhrase\' from Firebase: ${loginData.reasonPhrase}');
        return loginData.reasonPhrase!;
    }
  }

  bool isFormValid(formKey) => formKey.currentState!.validate();
}
