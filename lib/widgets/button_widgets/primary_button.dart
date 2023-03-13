import '../../enums/icon_direction.dart';

import '../../widgets/button_widgets/base_button.dart';

class PrimaryButton extends BaseButton {
  const PrimaryButton({
    super.key,
    required super.text,
    required super.onPressedFunction,
    super.buttonShapeRadius,
    super.icon,
    super.iconDirection = IconDirection.end,
    super.svgDirection = IconDirection.end,
    super.svg,
  }) : super(elevation: 0);
}
