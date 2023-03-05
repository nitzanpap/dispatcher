import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonActiveSvg extends StatelessWidget {
  const PersonActiveSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/person_active.svg',
      semanticsLabel: 'Person Active Svg',
      placeholderBuilder: (context) => const Text('Person Active Svg'),
    );
  }
}
