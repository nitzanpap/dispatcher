import 'package:dispatcher/api/news_api/news_api_top_articles_response.dart';
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
                    Expanded(
                      child: ListView.separated(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          // TODO: Replace this with a real article card that is fetched from the API dynamically
                          final newArticle = Article(
                              source:
                                  Source(id: 'the-verge', name: 'The Verge'),
                              author: "Antonio G. Di Benedetto",
                              title:
                                  "Mario Day 2023: the best deals on Nintendo Switch games and accessories - The Verge",
                              description:
                                  "A slew of great Nintendo Switch games are on sale in honor of MAR10 Day, and there are good deals on accessories, too. Here, we’ve rounded up the highlights, from Mario Kart 8 Deluxe to Nintendo’s Mario-themed Switch bundle.",
                              url:
                                  "https://www.theverge.com/23627426/mario-day-deals-mar10-nintendo-switch-games-microsd-cards-cases-accessories-sale",
                              urlToImage:
                                  "https://cdn.vox-cdn.com/thumbor/7Uflx8VRONB3hPUdQKWxlOMYcvU=/0x0:2040x1360/1200x628/filters:focal(1020x680:1021x681)/cdn.vox-cdn.com/uploads/chorus_asset/file/9537475/akrales_171025_2091_0010.jpg",
                              publishedAt:
                                  DateTime.parse("2023-03-10T16:33:09Z"),
                              content:
                                  "The best Mario Day deals on Nintendo Switch games and accessories\r\nThe best Mario Day deals on Nintendo Switch games and accessories\r\n / MAR10 is Mario Day, and many excellent Nintendo games are heav… [+9013 chars]");
                          return ArticleCardView(article: newArticle);
                        },
                        separatorBuilder: (_, __) => const Gap(20),
                      ),
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
}
