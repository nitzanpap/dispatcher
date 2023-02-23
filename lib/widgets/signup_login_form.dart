import 'package:dispatcher/widgets/password_icons.dart';
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
  static const sectionGap = Gap(40.0);
  static const inputsGap = Gap(24);
  bool isObscureText = true;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final signupLoginProvider = Provider.of<SignupLoginProvider>(context);

    const title = 'Signup';
    // final email = signupLoginProvider.email;
    // final password = signupLoginProvider.password;

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        height: double.infinity,
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text('Email: $email'),
                  //         Text('Password: $password'),
                  //         Text('Provider Email: ${signupLoginProvider.email}'),
                  //         Text(
                  //             'Provider Password: ${signupLoginProvider.password}'),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: const [
                      Text(
                        title,
                        style: TextStyle(
                            color: AppColors.mediumBlue,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  inputsGap,
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'johncena@gmail.com',
                      labelText: 'Your email',
                      labelStyle: getMaterialStateTextStyle(),
                      floatingLabelStyle: getMaterialStateTextStyle(),
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.error)),
                    ),
                    onChanged: (value) => setState(() => email = value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // onFieldSubmitted: (newValue) =>
                    //     signupLoginProvider.updateEmail(newValue),
                    validator: emailValidator,
                  ),
                  inputsGap,
                  TextFormField(
                    obscureText: isObscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: getMaterialStateTextStyle(),
                      floatingLabelStyle: getMaterialStateTextStyle(),
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.error)),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => isObscureText = !isObscureText),
                        icon: Icon(isObscureText
                            ? PasswordIcons.hiddenEye
                            : PasswordIcons.visibleEye),
                      ),
                      suffixIconColor: getFormStateColor(),
                    ),
                    onChanged: (value) => setState(() => password = value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // onFieldSubmitted: (newValue) =>
                    //     signupLoginProvider.updatePassword(newValue),
                    validator: passwordValidator,
                  ),
                ],
              ),
              sectionGap,
              FormField(
                builder: (_) => PrimaryButton(
                  text: 'SIGNUP',
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
              ),
              SecondaryButton(
                text: 'LOGIN',
                onPressedFunction: () => print('Change to Login UI'),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? passwordValidator(String? value) {
    if (value == null) {
      return 'Invalid input!';
    }
    RegExp hasUpperCaseRegEx = RegExp(r'^(?=.*[A-Z])');
    RegExp hasLowerCaseRegEx = RegExp(r'^(?=.*[a-z])');
    RegExp hasDigitRegEx = RegExp(r'^(?=.*\d)');
    RegExp hasSpecialCharRegEx = RegExp(r'^(?=.*[@$!%*?&])');
    RegExp hasMin8CharsRegEx = RegExp(r'^.{8,}');

    if (!hasUpperCaseRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 Upper case letter.';
    }
    if (!hasLowerCaseRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 lower case letter.';
    }
    if (!hasDigitRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 digit.';
    }
    if (!hasSpecialCharRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 special character (@\$!%*?&).';
    }
    if (!hasMin8CharsRegEx.hasMatch(value)) {
      return 'Password must be at least 8 characters long.';
    }
    // Valid password
    return null;
  }

  String? emailValidator(String? value) {
    return (isValidEmail(value)) ? null : 'Please enter a valid email address.';
  }

  bool isValidEmail(String? value) {
    RegExp isValidEmailRegEx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return (value != null && isValidEmailRegEx.hasMatch(value));
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
    print('Valid form!');
    provider.updateEmail(formEmail);
    provider.updatePassword(formPassword);
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
