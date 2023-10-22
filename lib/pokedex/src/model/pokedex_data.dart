import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_tracker/app/core/constants/strings.dart';

class PokemonSearchResults extends Equatable {
  const PokemonSearchResults({
    required this.name,
    required this.pokemonIndexUrl,
    required this.pokemonModelUrl,
    // required this.pokemon3dModelUrl,
  });

  factory PokemonSearchResults.fromMap(Map<String, dynamic> map) {
    return PokemonSearchResults(
      name: map['name'] as String,
      pokemonIndexUrl: map['url'] as String,
      pokemonModelUrl: Strings.pokemonNormalUrl + (map['url'] as String).split('/').elementAt(6) + Strings.png,
      // pokemon3dModelUrl: Strings.pokemon3dNormalUrl + (map['name'] as String) + Strings.gif,
    );
  }

  factory PokemonSearchResults.fromJson(String source) => PokemonSearchResults.fromMap(json.decode(source) as Map<String, dynamic>);

  final String name;
  final String pokemonIndexUrl;
  final String pokemonModelUrl;
  // final String pokemon3dModelUrl;
  // List<Pokemon>? pokemons;
  // String? error;

  @override
  List<Object?> get props => [name, pokemonIndexUrl];

  PokemonSearchResults copyWith({
    ValueGetter<String>? name,
    ValueGetter<String>? pokemonIndexUrl,
    ValueGetter<String>? pokemonModelUrl,
    // ValueGetter<String>? pokemon3dModelUrl,
  }) {
    return PokemonSearchResults(
      name: name != null ? name() : this.name,
      pokemonIndexUrl: pokemonIndexUrl != null ? pokemonIndexUrl() : this.pokemonIndexUrl,
      pokemonModelUrl: pokemonModelUrl != null ? pokemonModelUrl() : this.pokemonModelUrl,
      // pokemon3dModelUrl: pokemon3dModelUrl != null ? pokemon3dModelUrl() : this.pokemon3dModelUrl,
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
  String toString() => 'PokemonSearchResults(name: $name, pokemonIndexUrl: $pokemonIndexUrl, pokemonModelUrl: $pokemonModelUrl';
}
