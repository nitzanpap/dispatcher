import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchSvg extends StatelessWidget {
  const SearchSvg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/search.svg',
      semanticsLabel: 'Search Svg',
      placeholderBuilder: (context) => const Text('Search Svg'),
    );
  }
}
