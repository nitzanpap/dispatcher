import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      semanticsLabel: 'Dispatcher Logo',
      placeholderBuilder: (context) => const Text('Logo Svg'),
    );
  }
}
