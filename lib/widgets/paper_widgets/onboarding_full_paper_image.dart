import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingFullPaperImage extends StatelessWidget {
  const OnboardingFullPaperImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/papers/paper_images.svg',
      semanticsLabel: 'Full Double Paper Svg',
      placeholderBuilder: (context) => const Text('Full Double Paper svg'),
    );
  }
}
