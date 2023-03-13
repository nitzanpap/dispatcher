import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/svg_widgets/base_svg_widget.dart';

class StarWhiteFilledSvg extends BaseSvgWidget {
  const StarWhiteFilledSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/star_white_filled.svg',
      semanticsLabel: 'Star WhiteFilled Svg',
      placeholderBuilder: (context) => const Text('Star WhiteFilled Svg'),
    );
  }
}
