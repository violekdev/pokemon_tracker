import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_tracker/app/router/app_router.dart';
import 'package:pokemon_tracker/pokedex/src/model.dart';
import 'package:pokemon_tracker/pokemon/bloc/pokemon_bloc.dart';

class PokedexWidget extends StatelessWidget {
  const PokedexWidget({
    required this.pokedex,
    super.key,
  });

  final Pokedex pokedex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: pokedex.pokemonSearchResults.length,
      itemBuilder: (context, index) {
        return GridTile(
          key: Key(pokedex.pokemonSearchResults[index].name),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 30,
                  height: 10,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () => {
                  BlocProvider.of<PokemonBloc>(context).add(
                    GetPokemonList(
                      url: pokedex.pokemonSearchResults[index].pokemonIndexUrl,
                      name: pokedex.pokemonSearchResults[index].name,
                      id: index + 1,
                      pokemonImageUrl: pokedex.pokemonSearchResults[index].pokemonModelUrl,
                    ),
                  ),
                  context.pushNamed(AppRouter.pokemonDetails),
                },
                icon: Hero(
                  tag: pokedex.pokemonSearchResults[index].pokemonModelUrl,
                  child: CachedNetworkImage(
                    imageUrl: pokedex.pokemonSearchResults[index].pokemonModelUrl,
                    cacheKey: pokedex.pokemonSearchResults[index].pokemonModelUrl,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
