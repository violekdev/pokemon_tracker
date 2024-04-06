part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState({
    required this.pokemon,
    required this.pokemonImageUrl,
    required this.name,
    required this.id,
  });

  final Pokemon pokemon;
  final String pokemonImageUrl;
  final String name;
  final int id;

  @override
  List<Object> get props => [pokemon, pokemonImageUrl];
}

class PokemonInitial extends PokemonState {
  const PokemonInitial({required super.pokemon, required super.pokemonImageUrl, required super.name, required super.id});
}

class PokemonLoading extends PokemonState {
  const PokemonLoading({required super.pokemon, required super.pokemonImageUrl, required super.name, required super.id});
}

class PokemonLoaded extends PokemonState {
  const PokemonLoaded({required super.pokemon, required super.pokemonImageUrl, required super.name, required super.id});
}

class PokemonError extends PokemonState {
  const PokemonError({required super.pokemon, required this.message, required super.pokemonImageUrl, required super.name, required super.id});
  final String message;
}
