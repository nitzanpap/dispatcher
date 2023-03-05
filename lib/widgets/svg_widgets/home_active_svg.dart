import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeActiveSvg extends StatelessWidget {
  const HomeActiveSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/home_active.svg',
      semanticsLabel: 'Home Active Svg',
      placeholderBuilder: (context) => const Text('Home Active Svg'),
    );
  }
}
