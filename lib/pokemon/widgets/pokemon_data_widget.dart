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
          PokemonAssetView(pokemon: pokemon),
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
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Hero(
      tag: pokemon.sprites!.other.homeSprites!.frontDefault!,
      child: CachedNetworkImage(
        imageUrl: pokemon.sprites!.other.homeSprites!.frontDefault!,
        cacheKey: pokemon.sprites!.other.homeSprites!.frontDefault,
        imageBuilder: (context, imageProvider) => Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: pokemon.types!.first.type.url,
              cacheKey: pokemon.types!.first.type.url,
              height: screenSize.height * 0.4,
              fit: BoxFit.cover,
            ),
            Container(
              height: screenSize.height * 0.4,
              decoration: BoxDecoration(image: DecorationImage(image: imageProvider)),
            ),
          ],
        ),
      ),
    );
  }
}
