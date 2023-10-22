import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/pokedex/src/model.dart';
import 'package:pokemon_tracker/pokedex/src/repository.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  PokedexBloc() : super(const PokedexInitial(pokedex: Pokedex(pokemonSearchResults: [], count: 0))) {
    on<GetPokedex>(
      (event, emit) async {
        try {
          emit(PokedexLoading(pokedex: state.pokedex));
          final pList = await _pokedexRepository.fetchPokedex();
          emit(PokedexLoaded(pokedex: pList));
        } on CustomException catch (e) {
          emit(PokedexError(pokedex: state.pokedex, message: e.message));
        }
      },
    );
  }

  final _pokedexRepository = PokedexRepository();
}
