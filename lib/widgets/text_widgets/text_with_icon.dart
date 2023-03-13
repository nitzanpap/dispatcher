import 'package:flutter/material.dart';

import '../../enums/icon_direction.dart';

import '../svg_widgets/base_svg_widget.dart';

class TextWithIcon extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final Icon? icon;
  final IconDirection iconDirection;
  final IconDirection svgDirection;

  final double letterSpacing;
  final bool isWidthIntrinsic;
  final BaseSvgWidget? svg;
  final bool isWrap;

  const TextWithIcon({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0,
    this.icon,
    this.iconDirection = IconDirection.start,
    this.svgDirection = IconDirection.start,
    this.isWidthIntrinsic = false,
    this.isWrap = false,
    this.svg,
  });

  @override
  Widget build(BuildContext context) {
    bool isIconOnStart = iconDirection == IconDirection.start;
    bool isIconOnEnd = iconDirection == IconDirection.end;
    bool isSvgOnStart = svgDirection == IconDirection.start;
    bool isSvgOnEnd = svgDirection == IconDirection.end;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: isWidthIntrinsic ? MainAxisSize.min : MainAxisSize.max,
      children: [
        (svg != null && isSvgOnStart) ? svg! : const SizedBox.shrink(),
        (icon != null && isIconOnStart) ? icon! : const SizedBox.shrink(),
        isWrap ? Flexible(child: getTextWidget()) : getTextWidget(),
        (icon != null && isIconOnEnd) ? icon! : const SizedBox.shrink(),
        (svg != null && isSvgOnEnd) ? svg! : const SizedBox.shrink(),
      ],
    );
  }

  Text getTextWidget() {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
