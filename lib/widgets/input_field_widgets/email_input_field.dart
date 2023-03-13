import 'package:flutter/material.dart';

import '../../core/utils/validations.dart';

import '../../widgets/input_field_widgets/app_input_field.dart';

class EmailInputField extends StatelessWidget {
  final void Function(String)? onChanged;

  const EmailInputField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppInputField(
      labelText: 'Your email',
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      validator: Validations.getEmailErrorMsgOrNull,
      hintText: 'Email',
    );
  }
}
