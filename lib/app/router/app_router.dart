import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/pokedex/view/pokedex.dart';
import 'package:pokemon_tracker/pokemon/view/pokemon.dart';

class AppRouter {
  AppRouter() : goRouter = _router;

  final GoRouter goRouter; // This instance will be store route state

  static const String home = '/';
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
            pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const PokedexScreen(key: Key(Keys.pokedexScreen)),
            ),
            routes: [
              GoRoute(
                name: pokemonDetails,
                path: pokemonDetails,
                builder: (BuildContext context, GoRouterState state) {
                  return const PokemonDetailsScreen(key: Key(Keys.pokemonDetailsScreen));
                },
                pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: const PokemonDetailsScreen(key: Key(Keys.pokemonDetailsScreen)),
                ),
              ),
            ],
          ),
        ],
        errorBuilder: (context, state) => Container(),
      );
}

CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
  );
}
