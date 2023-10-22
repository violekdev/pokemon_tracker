part of 'pokedex_bloc.dart';

abstract class PokedexState extends Equatable {
  const PokedexState({required this.pokedex});

  final Pokedex pokedex;
  @override
  List<Object?> get props => [];
}

class PokedexInitial extends PokedexState {
  const PokedexInitial({required super.pokedex});
}

class PokedexLoading extends PokedexState {
  const PokedexLoading({required super.pokedex});
}

class PokedexLoaded extends PokedexState {
  const PokedexLoaded({required super.pokedex});
}

class PokedexError extends PokedexState {
  const PokedexError({required super.pokedex, required this.message});
  final String message;
}
