import 'package:dio/dio.dart';
import 'package:pokemon_tracker/app/core/constants/strings.dart';
import 'package:pokemon_tracker/app/core/exceptions/custom_exception.dart';
import 'package:pokemon_tracker/pokedex/src/model.dart';

class PokedexAPI {
  final _dio = Dio();

  Future<Pokedex> fetchPokedex() async {
    try {
      final response = await _dio.get<dynamic>(Strings.pokedexUrl);
      return Pokedex.fromMap(response.data as Map<String, dynamic>);
    } on Exception catch (error) {
      // TODO(krishna): Update Error Message
      throw CustomException(message: error.toString());
    }
  }
}
