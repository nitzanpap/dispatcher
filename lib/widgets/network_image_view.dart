import 'package:flutter/material.dart';

class NetworkImageView extends StatelessWidget {
  final double imageBorderRadius;
  final ImageProvider imageProvider;

  const NetworkImageView({
    super.key,
    required this.imageBorderRadius,
    required this.imageProvider,
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
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
