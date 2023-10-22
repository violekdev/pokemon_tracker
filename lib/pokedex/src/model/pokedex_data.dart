import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class PokemonSearchResults extends Equatable {
  const PokemonSearchResults({
    required this.name,
    required this.pokemonIndexUrl,
  });

  factory PokemonSearchResults.fromMap(Map<String, dynamic> map) {
    return PokemonSearchResults(
      name: map['name'] as String,
      pokemonIndexUrl: map['url'] as String,
    );
  }

  factory PokemonSearchResults.fromJson(String source) => PokemonSearchResults.fromMap(json.decode(source) as Map<String, dynamic>);

  final String name;
  final String pokemonIndexUrl;
  // List<Pokemon>? pokemons;
  // String? error;

  @override
  List<Object?> get props => [name, pokemonIndexUrl];

  PokemonSearchResults copyWith({
    ValueGetter<String>? name,
    ValueGetter<String>? pokemonIndexUrl,
  }) {
    return PokemonSearchResults(
      name: name != null ? name() : this.name,
      pokemonIndexUrl: pokemonIndexUrl != null ? pokemonIndexUrl() : this.pokemonIndexUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': pokemonIndexUrl,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'PokemonSearchResults(name: $name, pokemonIndexUrl: $pokemonIndexUrl)';
}
