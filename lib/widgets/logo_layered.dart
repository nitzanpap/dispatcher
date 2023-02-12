import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoLayered extends StatelessWidget {
  const LogoLayered({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo_layered.svg',
      semanticsLabel: 'Dispatcher Logo',
      placeholderBuilder: (context) => const Text('Logo Svg'),
    );
  }
}
