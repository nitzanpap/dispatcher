import 'package:dispatcher/widgets/svg_widgets/base_svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarWhiteSvg extends BaseSvgWidget {
  const StarWhiteSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/star_white.svg',
      semanticsLabel: 'Star White Svg',
      placeholderBuilder: (context) => const Text('Star White Svg'),
    );
  }
}
