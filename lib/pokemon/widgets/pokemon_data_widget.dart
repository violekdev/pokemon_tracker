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
    return SingleChildScrollView(
      child: Column(
        children: [
          // SpritesViewer(pokemon: pokemon),
          Image.network(pokemon.sprites!.frontDefault!, scale: 0.25),
          Text(pokemon.name!),
          Text(pokemon.height.toString()),
          // Text(pokemon.moves.toString()),
          // Row(
          //   children: [
          //     const Text("Type"),
          //     const SizedBox(
          //       width: 20,
          //     ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pokemon.types!.map((type) {
              return CachedNetworkImage(imageUrl: type.type);
            }).toList(),
          ),
          //   ],
          // )
        ],
      ),
    );
  }
}
