part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonList extends PokemonEvent {
  const GetPokemonList({required this.url, required this.pokemonImageUrl});

  final String url;
  final String pokemonImageUrl;
}
