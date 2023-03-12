import 'package:dispatcher/api/news_api/news_api_top_articles_response.dart';
import 'package:dispatcher/helpers/helper_functions/mock_data_functions.dart';
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Gap(6),
                    getLastLoginTimeView(),
                    const Gap(12),
                    getHomeViewHeadline(),
                    const Gap(20),
                    getArticlesView(),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getHomeViewHeadline() {
  return Row(children: const [
    TextWithIcon(
      text: 'Top Headlines in Israel',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.deepDarkBlue,
    ),
  ]);
}

Widget getLastLoginTimeView() {
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

Widget getArticlesView() {
  return FutureBuilder(
    future: getMockArticles(),
    builder: (context, snapshot) {
      print('Build from future builder');
      final articles = snapshot.data;
      if (snapshot.connectionState == ConnectionState.done) {
        return getListOfArticlesView(articles);
      }
      return const CircularProgressIndicator();
    },
  );
}

// Transforms a list of articles to a List of ArticleCardView widgets
getListOfArticlesView(List<Article>? articles) {
  return Expanded(
    child: ListView.separated(
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          transformArticleToWidget(articles![index]),
      itemCount: articles!.length,
      separatorBuilder: (context, index) => const Gap(20),
    ),
  );
}

// Transforms a single article to an ArticleCardView widget
ArticleCardView transformArticleToWidget(Article article) {
  final articleObj = Article(
    source: article.source,
    title: article.title,
    description: article.description,
    url: article.url,
    urlToImage: article.urlToImage,
    publishedAt: article.publishedAt,
  );
  return ArticleCardView(article: articleObj);
}
