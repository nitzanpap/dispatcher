import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSvg extends StatelessWidget {
  const HomeSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/home.svg',
      semanticsLabel: 'Home Svg',
      placeholderBuilder: (context) => const Text('Home Svg'),
    );
  }
}
