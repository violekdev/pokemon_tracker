import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/home/home.dart';
import 'package:pokemon_tracker/pokedex/view/pokedex.dart';
import 'package:pokemon_tracker/pokemon/view/pokemon.dart';
import 'package:pokemon_tracker/splash_screen/splash_screen.dart';

class AppRouter {
  AppRouter() : goRouter = _router;

  final GoRouter goRouter; // This instance will be store route state

  static const String home = '/';
  static const String splash = 'splash';
  static const String pokedex = 'pokedex';
  static const String pokemonDetails = 'pokemonDetails';

  static GoRouter get _router => GoRouter(
        // initialLocation: splash,
        routes: [
          GoRoute(
            name: home,
            path: home,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen(key: Key(Keys.homeScreen));
            },
            routes: [
              GoRoute(
                name: splash,
                path: splash,
                builder: (BuildContext context, GoRouterState state) {
                  return const SplashScreen(key: Key(Keys.splashScreen));
                },
              ),
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
            ],
          ),
        ],
        errorBuilder: (context, state) => Container(),
      );
}
