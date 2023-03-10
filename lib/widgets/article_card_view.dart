import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ArticleCardView extends StatelessWidget {
  const ArticleCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Replace this with a real article card
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: AppColors.badgeColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
