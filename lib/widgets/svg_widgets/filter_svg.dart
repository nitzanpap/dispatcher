import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/svg_widgets/base_svg_widget.dart';

class FilterSvg extends BaseSvgWidget {
  const FilterSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        'assets/images/svgs/filter.svg',
        semanticsLabel: 'Filter Svg',
        placeholderBuilder: (context) => const Text('Filter Svg'),
      ),
    );
  }
}
