import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonAssetView extends StatelessWidget {
  const PokemonAssetView({
    required this.frontImage,
    this.backImage,
    super.key,
  });

  final String? backImage;
  final String frontImage;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Hero(
      tag: frontImage,
      child: CachedNetworkImage(
        imageUrl: frontImage,
        cacheKey: frontImage,
        height: screenSize.height * 0.3,
      ),
    );
  }
}
