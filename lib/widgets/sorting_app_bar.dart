import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../enums/icon_direction.dart';

import '../widgets/svg_widgets/down_arrow_svg.dart';
import '../widgets/svg_widgets/filter_svg.dart';
import '../widgets/text_with_icon.dart';

class SortingAppBar extends StatelessWidget {
  const SortingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          TextWithIcon(
            text: 'Sort By',
            color: AppColors.deepDarkBlue,
            svg: DownArrowSvg(),
            svgDirection: IconDirection.end,
          ),
          FilterSvg()
        ],
      ),
    );
  }
}
