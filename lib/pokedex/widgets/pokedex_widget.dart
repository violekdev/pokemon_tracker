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
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: pokedex.pokemonSearchResults.length,
      itemBuilder: (context, index) {
        return GridTile(
          key: Key(pokedex.pokemonSearchResults[index].name),
          footer: Center(child: Text(pokedex.pokemonSearchResults[index].name)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 1), //(x,y)
                  blurRadius: 6,
                ),
              ],
            ),
            child: IconButton(
              onPressed: () => {
                BlocProvider.of<PokemonBloc>(context).add(GetPokemonList(url: pokedex.pokemonSearchResults[index].pokemonIndexUrl)),
                context.goNamed(AppRouter.pokemonDetails),
              },
              // icon: ModelViewer(
              //   backgroundColor: Colors.white,
              //   src: "https://github.com/PoGo-Devs/PoGo-3D-Assets/blob/master/Pokemon-Gen1/001_Bulbasaur/Bulbasaur.fbx",
              //   // src: "assets/Bulbasaur.c4d",
              //   alt: "A 3D model of an table soccer",
              //   autoPlay: true,
              //   autoRotate: true,
              //   key: Key(pokedex.pokemonSearchResults![index].name!),
              // ),
              // icon: Image.network(
              //     "https://github.com/PoGo-Devs/PoGo-3D-Assets/blob/master/Pokemon-Gen1/001_Bulbasaur/001_Bulbasaur_Anim.gif"),
              // icon: CachedNetworkImage(
              //   imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png",
              //   // progressIndicatorBuilder: (context, url, downloadProgress) =>
              //   //     CircularProgressIndicator(value: downloadProgress.progress),
              //   // errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
              icon: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png'),

              // const Icon(Icons.workspace_premium_outlined),
            ),
          ),
        );
      },
    );
  }
}
