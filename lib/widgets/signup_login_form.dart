import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../providers/signup_login_provider.dart';

import './button_widgets/primary_button.dart';
import './button_widgets/secondary_button.dart';

class SignupLoginForm extends StatefulWidget {
  final bool isSignUp;

  const SignupLoginForm({super.key, this.isSignUp = true});

  @override
  State<SignupLoginForm> createState() => _SignupLoginFormState();
}

class _SignupLoginFormState extends State<SignupLoginForm> {
  final _formKey = GlobalKey<FormState>();

  static const gapSeparatorHeight = 40.0;
  static const gap = Gap(gapSeparatorHeight);

  @override
  Widget build(BuildContext context) {
    final signupLoginProvider = Provider.of<SignupLoginProvider>(context);

    const title = 'Signup';
    final email = signupLoginProvider.email;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(email),
              const Text(
                title,
                style: TextStyle(
                  color: AppColors.mediumBlue,
                ),
              ),
              gap,
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'johncena@gmail.com',
                  labelText: 'Your email',
                  labelStyle: getMaterialStateTextStyle(),
                  floatingLabelStyle: getMaterialStateTextStyle(),
                  border: const OutlineInputBorder(),
                  suffixIcon: const Icon(Icons.person),
                  suffixIconColor: getFormStateColor(),
                ),
                onFieldSubmitted: (newValue) =>
                    signupLoginProvider.updateEmail(newValue),
                validator: emailValidator,
              ),
              gap,
              PrimaryButton(
                text: 'SIGNUP',
                onPressedFunction: submitForm,
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 30,
                  color: AppColors.white,
                ),
              ),
              SecondaryButton(
                text: 'LOGIN',
                onPressedFunction: submitForm,
              )
            ],
          ),
        ),
      ),
    );
  }

  String? emailValidator(String? value) {
    return (isValidEmail(value)) ? null : 'Please enter a valid email address.';
  }

  bool isValidEmail(String? value) {
    RegExp validEmailRegEx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return (value != null && validEmailRegEx.hasMatch(value));
  }

  void submitForm() {
    if (!_formKey.currentState!.validate()) {
      print('Invalid input somewhere in the form!');
      return;
    }
    print('Valid email!');
    return;
  }

  getMaterialStateTextStyle() {
    return MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.error)) {
        return const TextStyle(color: AppColors.error);
      }
      if (states.contains(MaterialState.focused)) {
        return const TextStyle(color: AppColors.blue);
      }
      return const TextStyle(color: AppColors.deepDarkBlue);
    });
  }

  getFormStateColor() {
    return MaterialStateColor.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.error)) {
        return AppColors.error;
      }
      if (states.contains(MaterialState.focused)) {
        return AppColors.blue;
      }
      return AppColors.deepDarkBlue;
    });
  }
}
