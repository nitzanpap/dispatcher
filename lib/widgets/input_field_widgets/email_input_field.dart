import 'package:flutter/material.dart';

import '../../helper_functions/validations.dart';

import './app_input_field.dart';

class EmailInputField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;

  const EmailInputField({
    super.key,
    required this.onChanged,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return AppInputField(
      labelText: 'Your email',
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      validator: Validations.emailValidator,
      hintText: 'john@gmail.com',
    );
  }
}
