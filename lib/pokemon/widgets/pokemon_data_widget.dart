import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';
import 'package:pokemon_tracker/pokemon/widgets/pokemon_asset_view.dart';

class PokemonData extends StatelessWidget {
  const PokemonData({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pokemon.name![0].toUpperCase() + pokemon.name!.substring(1), style: Theme.of(context).textTheme.headlineLarge),
                          Text('#${pokemon.id}', style: Theme.of(context).textTheme.headlineLarge),
                          // Text('#${colorSchemeFromImage.background}', style: Theme.of(context).textTheme.headlineLarge),
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
                PokemonAssetView(
                  backImage: pokemon.types!.first.type.url,
                  frontImage: pokemon.sprites!.other.homeSprites!.frontDefault!,
                ),
              ],
            ),
          ],
        ),
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
