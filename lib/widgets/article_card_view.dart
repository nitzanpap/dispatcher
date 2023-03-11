import 'package:dispatcher/widgets/svg_widgets/star_white_filled_svg.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/colors.dart';

import '../widgets/svg_widgets/star_white_svg.dart';
import '../widgets/text_with_icon.dart';

class ArticleCardView extends StatelessWidget {
  const ArticleCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Replace this with a real article card
    var cardBorderRadius = 20.0;
    return Container(
      // height: 400,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(cardBorderRadius),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            getArticleImageView(imageBorderRadius: cardBorderRadius),
            Padding(
              padding: const EdgeInsets.all(16),
              child: getFavoriteSvgButton(),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getArticleDateView(),
                  // getArticleTags(),
                ],
              ),
              const Gap(10.0),
              getArticleHeadlineView(),
              const Gap(10.0),
              getArticleAuthorView(),
              const Gap(10.0),
              getArticleContentClipped(),
            ],
          ),
        )
      ]),
    );
  }
}

// TODO: Add functionality to this button
getFavoriteSvgButton() {
  return Container(
    alignment: Alignment.center,
    width: 30,
    height: 30,
    decoration: const BoxDecoration(
      color: AppColors.darkFaded,
      // border: Border.all(
      //   color: AppColors.white,
      // ),
      shape: BoxShape.circle,
    ),
    child: const StarWhiteSvg(),
  );
}

// TODO: Replace this with a real author
Widget getArticleAuthorView() {
  return const TextWithIcon(
    text: 'Arjun Kharpal, CNBC',
    fontSize: 14,
    color: AppColors.darkGrey,
    isWidthIntrinsic: true,
    isWrap: true,
  );
}

// TODO: Replace this with a real date
Widget getArticleDateView() {
  return const TextWithIcon(
    text: 'Friday Jun 25, 2021',
    fontSize: 14,
    color: AppColors.darkGrey,
    isWidthIntrinsic: true,
    isWrap: true,
  );
}

// TODO: Replace this with a real headline
Widget getArticleHeadlineView() {
  return const TextWithIcon(
    text:
        'China\'s renewed crypto crackdown wipes nearly \$300 billion off the market as bitcoin slides',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    isWrap: true,
  );
}

// TODO: Replace this with real content
Widget getArticleContentClipped() {
  return const TextWithIcon(
    text:
        "On Friday, Chinese Vice Premier Liu He said it is necessary to “crack down on Bitcoin mining and trading behavior” to prevent risks to the “social field.” For a long time, Chinese authorities have been concerned about the speculative nature of cryptocurrencies ...",
    fontSize: 14,
    color: AppColors.deepDarkBlue,
    isWrap: true,
  );
}

// TODO: Replace this with a real image
Widget getArticleImageView({double imageBorderRadius = 0}) {
  return Container(
    height: 149,
    decoration: BoxDecoration(
      color: AppColors.badgeColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(imageBorderRadius),
        topRight: Radius.circular(imageBorderRadius),
      ),
    ),
  );
}
