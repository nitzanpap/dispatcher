import 'package:flutter/material.dart';

import '../../constants/colors.dart';

abstract class InputStateFunctions {
  static getMaterialStateTextStyle() {
    return MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.error)) {
        return const TextStyle(color: AppColors.error);
      }
      if (states.contains(MaterialState.focused)) {
        return const TextStyle(color: AppColors.blue);
      }
      return const TextStyle(color: AppColors.deepDarkBlue);
    });
  }

  static getFormMaterialStateColor() {
    return MaterialStateColor.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.error)) {
        return AppColors.error;
      }
      if (states.contains(MaterialState.focused)) {
        return AppColors.blue;
      }
      return AppColors.deepDarkBlue;
    });
  }
}
