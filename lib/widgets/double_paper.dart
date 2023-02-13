import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoublePaper extends StatelessWidget {
  const DoublePaper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/double_paper.svg',
      semanticsLabel: 'Double Paper svg',
      placeholderBuilder: (context) => const Text('Double Paper svg'),
    );
  }
}
