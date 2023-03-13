import 'package:flutter/material.dart';

class PlaceholderImageView extends StatelessWidget {
  final double imageBorderRadius;

  const PlaceholderImageView({
    super.key,
    required this.imageBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 149,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(imageBorderRadius),
          topRight: Radius.circular(imageBorderRadius),
        ),
        color: Colors.black,
        image: const DecorationImage(
          image: AssetImage('assets/images/image_placeholder.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
