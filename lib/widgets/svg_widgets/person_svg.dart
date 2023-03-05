import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonSvg extends StatelessWidget {
  const PersonSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/person.svg',
      semanticsLabel: 'Person Svg',
      placeholderBuilder: (context) => const Text('Person Svg'),
    );
  }
}
