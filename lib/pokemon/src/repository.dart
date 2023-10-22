import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/pokemon/src/http_api.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';

class PokemonRepository {
  final _provider = PokemonAPI();
  Future<Pokemon> fetchPokemonList(String url) {
    try {
      return _provider.fetchPokemonList(url);
    } on CustomException catch (_) {
      rethrow;
    }
  }
}
