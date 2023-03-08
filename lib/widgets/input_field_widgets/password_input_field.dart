import 'package:flutter/material.dart';

import '../../helpers/helper_functions/input_state_functions.dart';
import '../../helpers/helper_functions/validations.dart';
import '../../helpers/extensions.dart';

import '../../widgets/input_field_widgets/app_input_field.dart';
import '../../widgets/password_icons.dart';

class PasswordInputField extends StatefulWidget {
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? originalPassword;
  final bool isConfirmationPassword;
  final String labelText;

  const PasswordInputField({
    super.key,
    required this.onChanged,
    this.textInputAction,
    this.originalPassword,
    this.isConfirmationPassword = false,
    this.labelText = 'Password',
  });

  const PasswordInputField.confirmationPassword({
    super.key,
    required this.onChanged,
    this.textInputAction,
    required this.originalPassword,
    this.isConfirmationPassword = true,
    this.labelText = 'Re-Enter Password',
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppInputField(
      onChanged: widget.onChanged,
      validator: widget.isConfirmationPassword
          ? (value) => Validations.getConfirmationPasswordErrorMsgOrNull(
                confirmationPassword: value,
                originalPassword: widget.originalPassword,
              )
          : Validations.getPasswordErrorMsgOrNull,
      keyboardType: TextInputType.visiblePassword,
      labelText: widget.labelText,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.textInputAction == TextInputAction.next
          ? (_) => context.nextEditableTextFocus()
          : null,
      isObscureText: isObscureText,
      icon: IconButton(
        icon: Icon(
          isObscureText ? PasswordIcons.hiddenEye : PasswordIcons.visibleEye,
        ),
        onPressed: () => setState(() => isObscureText = !isObscureText),
      ),
      suffixIconColor: getFormMaterialStateColor(),
    );
  }
}
