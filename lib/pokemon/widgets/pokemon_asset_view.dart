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
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (backImage != null)
            CachedNetworkImage(
              imageUrl: backImage!,
              cacheKey: backImage,
              height: screenSize.height * 0.4,
              fit: BoxFit.cover,
            ),
          Hero(
            tag: frontImage,
            child: CachedNetworkImage(
              imageUrl: frontImage,
              cacheKey: frontImage,
              height: screenSize.height * 0.4,
              // imageBuilder: (context, imageProvider) => Image(image: imageProvider),
              // Container(
              //   decoration: BoxDecoration(image: ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
