import 'package:dispatcher/api/news_api/news_api_model_functions.dart';
import 'package:dispatcher/api/news_api/news_api_top_articles_response.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

import '../svg_widgets/logo_layered.dart';
import '../svg_widgets/notification_svg.dart';
import '../svg_widgets/search_svg.dart';

class PrimaryAppBar extends StatelessWidget with PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      backgroundColor: AppColors.deepDarkBlue,
      actions: const <Widget>[
        SearchIconBtn(),
        NotificationIconBtn(),
      ],
      leading: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: LogoLayered(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}

class NotificationIconBtn extends StatelessWidget {
  const NotificationIconBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Badge(
          backgroundColor: AppColors.badgeColor,
          // TODO: refactor this to actually indicate if there are notifications
          // isLabelVisible: false,
          child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => debugPrint('Notifications icon clicked'),
              icon: const NotificationSvg()),
        ),
      ),
    );
  }
}

class SearchIconBtn extends StatelessWidget {
  const SearchIconBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () async {
          debugPrint('Search icon clicked');
          final response = newsApiTopHeadlinesResponseFromJson(
              await getDataFromJsonFile(
                  'assets/mock_files/news_api_top_headlines_response_example.json'));
          final response2 = newsApiTopHeadlinesResponseFromJson(
              await getDataFromJsonFile(
                  'assets/mock_files/news_api_top_headlines_error_response_example.json'));
          print(response);
          print(response2);
        },
        icon: const SearchSvg(),
      ),
    );
  }
}
