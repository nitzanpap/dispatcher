import 'package:flutter/material.dart';

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild!.context == null);
  }
}
