import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullDoublePaper extends StatelessWidget {
  const FullDoublePaper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/papers/full_double_paper.svg',
      semanticsLabel: 'Full Double Paper Svg',
      placeholderBuilder: (context) => const Text('Full Double Paper svg'),
    );
  }
}
