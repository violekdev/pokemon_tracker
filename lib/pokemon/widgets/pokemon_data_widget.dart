import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';

class PokemonData extends StatelessWidget {
  const PokemonData({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PokemonAssetView(backImage: pokemon.types!.first.type.url, frontImage: pokemon.sprites!.other.homeSprites!.frontDefault!),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(pokemon.name!, style: Theme.of(context).textTheme.headlineLarge),
                    Text(pokemon.id.toString(), style: Theme.of(context).textTheme.headlineLarge),
                  ],
                ),
                Row(
                  children: pokemon.types!.map((type) {
                    return TypeContainer(type: type);
                  }).toList(),
                ),
              ],
            ),
          ),
          //   ],
          // )
        ],
      ),
    );
  }
}

class TypeContainer extends StatelessWidget {
  const TypeContainer({
    required this.type,
    super.key,
  });

  final Types type;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.12,
      height: screenSize.height * 0.05,
      child: CachedNetworkImage(
        imageUrl: type.type.url,
        cacheKey: type.type.url,
        height: screenSize.height * 0.05,
      ),
    );
  }
}

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
