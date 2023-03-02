import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationSvg extends StatelessWidget {
  const NotificationSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/notification.svg',
      semanticsLabel: 'Notification Svg',
      placeholderBuilder: (context) => const Text('Notification Svg'),
    );
  }
}
