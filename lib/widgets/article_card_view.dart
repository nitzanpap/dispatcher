import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants/colors.dart';

import '../core/models/news_api_models/article.dart';
import '../core/utils/date_formatting_functions.dart';
import '../widgets/text_with_icon.dart';
import '../widgets/svg_widgets/star_white_svg.dart';
import '../widgets/svg_widgets/star_white_filled_svg.dart';
import '../widgets/button_widgets/primary_button.dart';
import '../widgets/svg_widgets/right_arrow_svg.dart';
import '../widgets/image_widgets/placeholder_image_view.dart';
import '../widgets/image_widgets/network_image_view.dart';
import '../widgets/app_spinner_loader.dart';

class ArticleCardView extends StatelessWidget {
  final Article article;

  const ArticleCardView({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    var cardBorderRadius = 20.0;
    const smallGap = Gap(10.0);
    const bigGap = Gap(10.0);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(cardBorderRadius),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        children: [
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
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
                smallGap,
                getArticleTitleView(article.title),
                smallGap,
                getArticleAuthorView(article.author),
                smallGap,
                getArticleContentClipped(article.description),
                bigGap,
                PrimaryButton(
                  text: 'NAVIGATE TO DISPATCH',
                  onPressedFunction: () => print('Navigate to dispatch'),
                  buttonShapeRadius: 20,
                  svg: const RightArrowSvg(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String getTransformedDate(DateTime? publishedAt) {
  return publishedAt != null ? formatDate(publishedAt) : 'Unknown date';
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
    // child: const StarWhiteFilledSvg(),
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

Widget getArticleTitleView(String? title) {
  return TextWithIcon(
    text: title ?? '- No Title -',
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
    {required String? imageUrl, double imageBorderRadius = 0}) {
  const double imageHeight = 149.0;
  if (imageUrl == null) {
    return PlaceholderImageView(
      imageBorderRadius: imageBorderRadius,
      height: imageHeight,
    );
  }
  return CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => NetworkImageView(
      imageBorderRadius: imageBorderRadius,
      imageProvider: imageProvider,
      height: imageHeight,
    ),
    placeholder: (context, url) => const Center(child: AppSpinnerLoader()),
    errorWidget: (context, url, error) => PlaceholderImageView(
      imageBorderRadius: imageBorderRadius,
      height: imageHeight,
    ),
  );
}
