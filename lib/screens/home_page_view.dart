import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../helpers/helper_functions/mock_data_functions.dart';
import '../api/news_api/news_api_top_articles_response.dart';
import '../providers/home_view_provider.dart';

import '../widgets/app_bar_widgets/primary_app_bar.dart';
import '../widgets/text_with_icon.dart';
import '../widgets/sorting_app_bar.dart';
import '../widgets/article_card_view.dart';
import '../widgets/app_spinner_loader.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeViewProvider = Provider.of<HomeViewProvider>(context);

    ScrollController scrollController = ScrollController(
      initialScrollOffset: homeViewProvider.offset,
    );

    scrollController.addListener(() {
      homeViewProvider.saveOffset(scrollController.offset);
    });

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
                    getArticlesView(scrollController),
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

// Returns a Row with the headline
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

// Returns a Row with the last login time
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

// Returns a FutureBuilder that will build a ListView of articles
Widget getArticlesView(ScrollController scr) {
  return FutureBuilder(
    future: getMockArticles(),
    builder: (context, snapshot) {
      final articles = snapshot.data;
      if (snapshot.connectionState == ConnectionState.done) {
        return getListOfArticlesView(articles, scr);
      }
      return const Expanded(
        child: Center(
          child: AppSpinnerLoader(),
        ),
      );
    },
  );
}

// Returns a ListView of articles
getListOfArticlesView(List<Article>? articles, ScrollController scr) {
  return Expanded(
    child: ListView.separated(
      controller: scr,
      itemBuilder: (context, index) =>
          transformArticleToWidget(articles[index]),
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
