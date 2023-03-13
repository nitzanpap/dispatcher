import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
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

    homeViewProvider.getArticles();

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
                    getArticlesView(
                      provider: homeViewProvider,
                      scr: scrollController,
                    ),
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

Widget getArticlesView(
    {required HomeViewProvider provider, required ScrollController scr}) {
  return FutureBuilder(
    future: provider.getArticles(),
    builder: (context, snapshot) {
      final articles = snapshot.data;
      if (snapshot.connectionState == ConnectionState.done) {
        if (articles == null) {
          return AtriclesListPlaceHolderView();
        }
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

getListOfArticlesView(List<Article>? articles, ScrollController scr) {
  return Expanded(
    child: ListView.separated(
      controller: scr,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              const Gap(6),
              getLastLoginTimeView(),
              const Gap(12),
              getHomeViewHeadline(),
              const Gap(20),
            ],
          );
        }
        return transformArticleToWidget(articles[index - 1]);
      },
      itemCount: articles!.length + 1,
      separatorBuilder: (context, index) => const Gap(20),
    ),
  );
}

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

AtriclesListPlaceHolderView() {
  return const Expanded(
    child: Center(
      child: TextWithIcon(
        text: 'Something went wrong :(',
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: AppColors.deepDarkBlue,
      ),
    ),
  );
}
