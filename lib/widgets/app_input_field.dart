import 'package:flutter/material.dart';

import '../constants/colors.dart';

import '../helper_functions/input_state_functions.dart';

class AppInputField extends StatefulWidget {
  final String? labelText;
  final TextInputAction? textInputAction;

  final String? Function(String?)? validator;

  const AppInputField({
    super.key,
    this.labelText,
    this.textInputAction,
    required this.validator,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      // obscureText: widget.isObscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: getMaterialStateTextStyle(),
        floatingLabelStyle: getMaterialStateTextStyle(),
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error)),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
    );
  }
}
