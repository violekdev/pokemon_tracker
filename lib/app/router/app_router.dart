import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/pokedex/view/pokedex.dart';
import 'package:pokemon_tracker/pokemon/view/pokemon.dart';
import 'package:pokemon_tracker/splash_screen/splash_screen.dart';

class AppRouter {
  AppRouter() : goRouter = _router;

  final GoRouter goRouter; // This instance will be store route state

  static const String home = '/';
  static const String splash = '/splash';
  static const String pokedex = '/pokedex';
  static const String pokemonDetails = 'pokemonDetails';

  static GoRouter get _router => GoRouter(
        initialLocation: pokedex,
        routes: [
          GoRoute(
            name: pokedex,
            path: pokedex,
            builder: (BuildContext context, GoRouterState state) {
              return const PokedexScreen(key: Key(Keys.pokedexScreen));
            },
            routes: [
              GoRoute(
                name: pokemonDetails,
                path: pokemonDetails,
                builder: (BuildContext context, GoRouterState state) {
                  return const PokemonDetailsScreen(key: Key(Keys.pokemonDetailsScreen));
                },
              ),
            ],
          ),
          GoRoute(
            name: splash,
            path: splash,
            builder: (BuildContext context, GoRouterState state) {
              return const SplashScreen(key: Key(Keys.splashScreen));
            },
          ),
        ],
        errorBuilder: (context, state) => Container(),
      );
}
