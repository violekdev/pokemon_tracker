import 'package:dio/dio.dart';
import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';

class PokemonAPI {
  final _dio = Dio();

  Future<Pokemon> fetchPokemonList(String url) async {
    try {
      final response = await _dio.get<dynamic>(url);
      return Pokemon.fromMap(response.data as Map<String, dynamic>);
    } catch (error) {
      // TODO(krishna): Update Error Message
      throw CustomException(message: error.toString());
    }
  }
}
