import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/pokedex/src/http_api.dart';
import 'package:pokemon_tracker/pokedex/src/model.dart';

class PokedexRepository {
  final _provider = PokedexAPI();

  Future<Pokedex> fetchPokedex() {
    try {
      return _provider.fetchPokedex();
    } on CustomException catch (_) {
      rethrow;
    }
  }
}
