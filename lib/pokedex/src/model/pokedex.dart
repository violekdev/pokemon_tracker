import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_tracker/pokedex/src/model/pokedex_data.dart';

class Pokedex extends Equatable {
  const Pokedex({
    required this.count,
    required this.pokemonSearchResults,
  });

  factory Pokedex.fromMap(Map<String, dynamic> map) {
    return Pokedex(
      count: map['count'] as int,
      pokemonSearchResults: map['results'] != null ? List<PokemonSearchResults>.from((map['results'] as List).map((x) => PokemonSearchResults.fromMap(x as Map<String, dynamic>))) : [],
    );
  }

  factory Pokedex.fromJson(String source) => Pokedex.fromMap(json.decode(source) as Map<String, dynamic>);

  final int count;
  // String? next;
  // String? previous;
  final List<PokemonSearchResults> pokemonSearchResults;

  Pokedex copyWith({
    ValueGetter<int>? count,
    ValueGetter<List<PokemonSearchResults>>? pokemonSearchResults,
    ValueGetter<String?>? error,
  }) {
    return Pokedex(
      count: count != null ? count() : this.count,
      pokemonSearchResults: pokemonSearchResults != null ? pokemonSearchResults() : this.pokemonSearchResults,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'pokemonSearchResults': pokemonSearchResults.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Pokedex(count: $count, pokemonSearchResults: $pokemonSearchResults)';

  @override
  List<Object?> get props => [count, pokemonSearchResults];
}
