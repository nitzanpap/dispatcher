import 'package:flutter/material.dart';

class PlaceholderImageView extends StatelessWidget {
  final double imageBorderRadius;
  final double height;

  const PlaceholderImageView({
    super.key,
    required this.imageBorderRadius,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
