import 'package:dispatcher/widgets/svg_widgets/base_svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarSvg extends BaseSvgWidget {
  const StarSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/star.svg',
      semanticsLabel: 'Star Svg',
      placeholderBuilder: (context) => const Text('Star Svg'),
    );
  }
}
