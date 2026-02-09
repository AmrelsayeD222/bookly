import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.tag});

  final Object? tag;
  @override
  Widget build(BuildContext context) {
    if (tag != null) {
      return Hero(
        tag: tag!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 2.6 / 4,
            child: Image.asset(AssetsData.test, fit: BoxFit.fill),
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Image.asset(AssetsData.test, fit: BoxFit.fill),
      ),
    );
  }
}
