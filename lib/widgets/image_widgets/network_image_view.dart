import 'package:flutter/material.dart';

class NetworkImageView extends StatelessWidget {
  final double imageBorderRadius;
  final ImageProvider imageProvider;
  final double height;

  const NetworkImageView({
    super.key,
    required this.imageBorderRadius,
    required this.imageProvider,
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
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
