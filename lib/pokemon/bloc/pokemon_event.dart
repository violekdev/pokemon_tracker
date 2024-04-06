part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonList extends PokemonEvent {
  const GetPokemonList({required this.url, required this.name, required this.id, required this.pokemonImageUrl});

  final String url;
  final String name;
  final int id;
  final String pokemonImageUrl;

  @override
  List<Object> get props => [url, name, id];
}
