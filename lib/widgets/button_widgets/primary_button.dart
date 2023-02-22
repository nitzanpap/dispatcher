import 'package:dispatcher/widgets/button_widgets/base_button.dart';

class PrimaryButton extends BaseButton {
  // final Color color;

  const PrimaryButton({
    super.key,
    required super.text,
    required super.onPressedFunction,
    super.icon,
    // this.color = AppColors.blue,
  }) : super(elevation: 0);
}
