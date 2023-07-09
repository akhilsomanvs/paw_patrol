import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    required this.imageUrl,
    this.heroTag = '',
    super.key,
  });

  final String imageUrl;
  final Object heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: heroTag,
          child: Center(
            child: InteractiveViewer(
              clipBehavior: Clip.none,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
