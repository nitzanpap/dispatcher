import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import '../constants/colors.dart';
import '../enums/icon_direction.dart';
import '../widgets/text_with_icon.dart';

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
    const title = 'Signup';
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                  border: const OutlineInputBorder(),
                  suffixIcon: const Icon(Icons.person),
                  prefixIconColor: MaterialStateColor.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused)) {
                      return Colors.green;
                    }
                    if (states.contains(MaterialState.error)) {
                      return Colors.red;
                    }
                    return Colors.grey;
                  }),
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  RegExp validEmailRegEx = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  return (value != null && validEmailRegEx.hasMatch(value))
                      ? null
                      : 'Please enter a valid email address.';
                },
              ),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(36),
                    backgroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  child: const TextWithIcon(
                    text: 'SIGNUP',
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.25,
                    icon: Icon(Icons.arrow_forward, size: 30),
                    iconDirection: IconDirection.end,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
