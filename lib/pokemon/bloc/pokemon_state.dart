part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState({required this.pokemon});

  final Pokemon pokemon;
  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {
  const PokemonInitial({required super.pokemon});
}

class PokemonLoading extends PokemonState {
  const PokemonLoading({required super.pokemon});
}

class PokemonLoaded extends PokemonState {
  const PokemonLoaded({required super.pokemon});
}

class PokemonError extends PokemonState {
  const PokemonError({required super.pokemon, required this.message});
  final String message;
}
