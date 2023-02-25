import 'package:flutter/material.dart';

import '../../helper_functions/input_state_functions.dart';
import '../../helper_functions/validations.dart';

import './app_input_field.dart';
import '../../widgets/password_icons.dart';

class PasswordInputField extends StatefulWidget {
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? originalPassword;
  final bool isReEnterPasswordInput;
  final String labelText;

  const PasswordInputField({
    super.key,
    required this.onChanged,
    this.textInputAction,
    this.originalPassword,
    this.isReEnterPasswordInput = false,
    this.labelText = 'Password',
  });

  const PasswordInputField.reEnteredPassword({
    super.key,
    required this.onChanged,
    this.textInputAction,
    required this.originalPassword,
    this.isReEnterPasswordInput = true,
    this.labelText = 'Re-Enter Password',
  });

  String? reEnteredPasswordValidator(reEnteredPassword) {
    return (reEnteredPassword == originalPassword)
        ? null
        : 'Passwords do not match.';
  }

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return AppInputField(
      onChanged: widget.onChanged,
      validator: widget.isReEnterPasswordInput
          ? widget.reEnteredPasswordValidator
          : Validations.passwordValidator,
      keyboardType: TextInputType.visiblePassword,
      labelText: widget.labelText,
      textInputAction: widget.textInputAction,
      isObscureText: isObscureText,
      icon: IconButton(
        icon: Icon(
          isObscureText ? PasswordIcons.hiddenEye : PasswordIcons.visibleEye,
        ),
        onPressed: () => setState(() => isObscureText = !isObscureText),
      ),
      suffixIconColor: getFormStateColor(),
    );
  }
}
