import 'package:flutter/material.dart';

import '../../constants/colors.dart';

import '../../helper_functions/input_state_functions.dart';

class AppInputField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? labelText;
  final Widget? icon;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool isObscureText;
  final Color? suffixIconColor;

  const AppInputField({
    super.key,
    required this.onChanged,
    this.labelText,
    this.icon,
    this.textInputAction,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.isObscureText = false,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: keyboardType,
      obscureText: isObscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: getMaterialStateTextStyle(),
        floatingLabelStyle: getMaterialStateTextStyle(),
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error)),
        suffixIcon: icon,
        suffixIconColor: suffixIconColor,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }
}
