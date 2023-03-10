import 'package:dispatcher/enums/icon_direction.dart';
import 'package:dispatcher/widgets/svg_widgets/down_arrow_svg.dart';
import 'package:dispatcher/widgets/svg_widgets/filter_svg.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/colors.dart';

import '../widgets/app_bar_widgets/primary_app_bar.dart';
import '../widgets/text_with_icon.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        color: AppColors.lightGrey,
        child: Column(
          children: [
            const SortingAppBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(children: const [
                    TextWithIcon(
                      text: 'Last Login: ',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors.mediumBlue,
                    ),
                    TextWithIcon(
                      text: '03:50 PM, 09.03.2022',
                      fontSize: 12,
                      color: AppColors.mediumBlue,
                    ),
                  ]),
                  const Gap(14),
                  Row(children: const [
                    TextWithIcon(
                      text: 'Top Headlines in Israel',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.deepDarkBlue,
                    ),
                  ]),
                  const Gap(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
