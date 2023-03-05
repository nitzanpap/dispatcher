import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarActiveSvg extends StatelessWidget {
  const StarActiveSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/star_active.svg',
      semanticsLabel: 'Star Active Svg',
      placeholderBuilder: (context) => const Text('Star Active Svg'),
    );
  }
}
