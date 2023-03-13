import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './base_svg_widget.dart';

class RightArrowSvg extends BaseSvgWidget {
  const RightArrowSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        'assets/images/svgs/right_arrow.svg',
        semanticsLabel: 'Right Arrow Svg',
        placeholderBuilder: (context) => const Text('Right Arrow Svg'),
      ),
    );
  }
}
