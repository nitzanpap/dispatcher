import 'package:flutter/material.dart';

import '../constants/colors.dart';

import '../helper_functions/input_state_functions.dart';
import '../helper_functions/validations.dart';

class EmailInputField extends StatelessWidget {
  final onChanged;
  final String? labelText;
  final TextInputAction? textInputAction;

  const EmailInputField({
    super.key,
    required this.onChanged,
    this.labelText,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'john@gmail.com',
        labelText: labelText ?? 'Your email',
        labelStyle: getMaterialStateTextStyle(),
        floatingLabelStyle: getMaterialStateTextStyle(),
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
      ),
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // onFieldSubmitted: (newValue) =>
      //     signupLoginProvider.updateEmail(newValue),
      validator: Validations.emailValidator,
    );
  }
}
