import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePlaceholderSvg extends StatelessWidget {
  const ProfilePlaceholderSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/profile_placeholder.svg',
      semanticsLabel: 'Profile Placeholder',
      placeholderBuilder: (context) => const Text('Profile Placeholder'),
    );
  }
}
