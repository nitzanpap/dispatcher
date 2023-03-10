import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './base_svg_widget.dart';

class DownArrowSvg extends BaseSvgWidget {
  const DownArrowSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        'assets/images/svgs/down_arrow.svg',
        semanticsLabel: 'Down Arrow Svg',
        placeholderBuilder: (context) => const Text('Down Arrow Svg'),
      ),
    );
  }
}
