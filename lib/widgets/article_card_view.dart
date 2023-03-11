import 'package:dispatcher/api/news_api/news_api_top_articles_response.dart';
import 'package:dispatcher/helpers/helper_functions/date_formatting_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/colors.dart';

import '../widgets/text_with_icon.dart';
import '../widgets/svg_widgets/star_white_svg.dart';
import '../widgets/svg_widgets/star_white_filled_svg.dart';

class ArticleCardView extends StatelessWidget {
  final Article article;

  const ArticleCardView({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    var cardBorderRadius = 20.0;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(cardBorderRadius),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            getArticleImageView(
                imageUrl: article.urlToImage,
                imageBorderRadius: cardBorderRadius),
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
                  getArticleDateView(getTransformedDate(article.publishedAt)),
                  // getArticleTags(),
                ],
              ),
              const Gap(10.0),
              getArticleTitleView(article.title),
              const Gap(10.0),
              getArticleAuthorView(article.author),
              const Gap(10.0),
              getArticleContentClipped(article.description),
            ],
          ),
        )
      ]),
    );
  }
}

String getTransformedDate(DateTime publishedAt) {
  return formatDate(publishedAt);
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

Widget getArticleAuthorView(String? author) {
  return TextWithIcon(
    text: author ?? '',
    fontSize: 14,
    color: AppColors.darkGrey,
    isWidthIntrinsic: true,
    isWrap: true,
  );
}

Widget getArticleDateView(String date) {
  return TextWithIcon(
    text: date,
    fontSize: 14,
    color: AppColors.darkGrey,
    isWidthIntrinsic: true,
    isWrap: true,
  );
}

Widget getArticleTitleView(String title) {
  return TextWithIcon(
    text: title,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    isWrap: true,
  );
}

Widget getArticleContentClipped(String? content) {
  return TextWithIcon(
    text: content ?? '',
    fontSize: 14,
    color: AppColors.deepDarkBlue,
    isWrap: true,
  );
}

Widget getArticleImageView(
    {required String imageUrl, double imageBorderRadius = 0}) {
  return Container(
    height: 149,
    decoration: BoxDecoration(
        // color: AppColors.badgeColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(imageBorderRadius),
          topRight: Radius.circular(imageBorderRadius),
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        )),
  );
}
