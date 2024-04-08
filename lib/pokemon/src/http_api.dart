import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';

// Global options
final options = CacheOptions(
  // A default store is required for interceptor.
  store: MemCacheStore(),
  // Returns a cached response on error but for statuses 401 & 403.
  // Also allows to return a cached response on network errors (e.g. offline usage).
  // Defaults to [null].
  hitCacheOnErrorExcept: [401, 403],
  // Overrides any HTTP directive to delete entry past this duration.
  // Useful only when origin server has no cache config or custom behaviour is desired.
  // Defaults to [null].
  maxStale: const Duration(days: 7),
);

class PokemonAPI {
  final _dio = Dio()..interceptors.add(DioCacheInterceptor(options: options));

  Future<Pokemon> fetchPokemonList({required String url, required String name}) async {
    try {
      final response = await _dio.get<dynamic>(url);

      final directory = await getApplicationDocumentsDirectory();
      Hive.init(directory.path);
      await Hive.openBox<String>('pokemonDescription');

      final box = Hive.box<String>('pokemonDescription');

      var pokemonDescripiton = '';

      if (!box.containsKey(name)) {
        final apiKey = dotenv.env['GENERATIVE_AI_KEY'];
        final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey!);

        final prompt = 'Write a description in single paragraph without heading for pokemon $name';
        final content = [Content.text(prompt)];
        final generativeResponse = await model.generateContent(content);
        
        pokemonDescripiton = generativeResponse.text!;

        await box.put(name, pokemonDescripiton);
      } else {
        pokemonDescripiton = box.get(name)!;
      }

      return Pokemon.fromMap(response.data as Map<String, dynamic>, pokemonDescripiton);
    } catch (error) {
      // TODO(krishna): Update Error Message
      throw CustomException(message: error.toString());
    }
  }
}
