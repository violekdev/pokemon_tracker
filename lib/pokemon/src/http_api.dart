import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
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
