import 'package:dispatcher/widgets/svg_widgets/base_svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoutSvg extends BaseSvgWidget {
  const LogoutSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        'assets/images/svgs/logout.svg',
        semanticsLabel: 'Logout Svg',
        placeholderBuilder: (context) => const Text('Logout Svg'),
      ),
    );
  }
}
