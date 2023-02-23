import 'package:dispatcher/widgets/password_icons.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

import '../helper_functions/input_state_functions.dart';
import '../helper_functions/validations.dart';

class PasswordInputField extends StatelessWidget {
  final onChanged;
  final onPressed;
  final String? labelText;
  final TextInputAction? textInputAction;

  final bool isObscureText;

  const PasswordInputField({
    super.key,
    required this.onChanged,
    required this.onPressed,
    required this.isObscureText,
    this.labelText,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction ?? TextInputAction.done,
      obscureText: isObscureText,
      decoration: InputDecoration(
        labelText: labelText ?? 'Password',
        labelStyle: getMaterialStateTextStyle(),
        floatingLabelStyle: getMaterialStateTextStyle(),
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error)),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(isObscureText
              ? PasswordIcons.hiddenEye
              : PasswordIcons.visibleEye),
        ),
        suffixIconColor: getFormStateColor(),
      ),
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: Validations.passwordValidator,
    );
  }
}
