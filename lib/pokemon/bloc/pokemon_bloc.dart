import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';
import 'package:pokemon_tracker/pokemon/src/repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonInitial(pokemon: Pokemon(), pokemonImageUrl: '')) {
    on<GetPokemonList>((event, emit) async {
      try {
        emit(PokemonLoading(pokemon: state.pokemon, pokemonImageUrl: event.pokemonImageUrl));
        final pList = await _pokemonRepository.fetchPokemonList(event.url);
        emit(PokemonLoaded(pokemon: pList, pokemonImageUrl: state.pokemonImageUrl));
      } on CustomException catch (e) {
        emit(PokemonError(pokemon: state.pokemon, message: e.message, pokemonImageUrl: event.pokemonImageUrl));
      }
    });
  }
  final _pokemonRepository = PokemonRepository();
}
