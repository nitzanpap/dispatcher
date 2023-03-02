import '../../widgets/button_widgets/base_button.dart';

class PrimaryButton extends BaseButton {
  const PrimaryButton({
    super.key,
    required super.text,
    required super.onPressedFunction,
    super.icon,
  }) : super(elevation: 0);
}
