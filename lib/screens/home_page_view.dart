import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/colors.dart';

import '../widgets/app_bar_widgets/primary_app_bar.dart';
import '../widgets/text_with_icon.dart';
import '../widgets/sorting_app_bar.dart';
import '../widgets/article_card_view.dart';

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
              // TODO: Replace this with a better scrolling solution
              child: Column(
                children: [
                  getLastLoginTimeView(),
                  const Gap(14),
                  getHomeViewHeadline(),
                  const Gap(20),
                  const ArticleCardView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row getHomeViewHeadline() {
    return Row(children: const [
      TextWithIcon(
        text: 'Top Headlines in Israel',
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: AppColors.deepDarkBlue,
      ),
    ]);
  }

  Row getLastLoginTimeView() {
    return Row(children: const [
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
    ]);
  }
}
