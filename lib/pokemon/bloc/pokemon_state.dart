part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState({required this.pokemon, required this.pokemonImageUrl});

  final Pokemon pokemon;
  final String pokemonImageUrl;

  @override
  List<Object> get props => [pokemon, pokemonImageUrl];
}

class PokemonInitial extends PokemonState {
  const PokemonInitial({required super.pokemon, required super.pokemonImageUrl});
}

class PokemonLoading extends PokemonState {
  const PokemonLoading({required super.pokemon, required super.pokemonImageUrl});
}

class PokemonLoaded extends PokemonState {
  const PokemonLoaded({required super.pokemon, required super.pokemonImageUrl});
}

class PokemonError extends PokemonState {
  const PokemonError({required super.pokemon, required this.message, required super.pokemonImageUrl});
  final String message;
}
