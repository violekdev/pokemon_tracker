import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';

class Pokemon extends Equatable {
  const Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      abilities: List<dynamic>.from(map['abilities'] as List),
      baseExperience: map['base_experience'] as int,
      forms: List<dynamic>.from(map['forms'] as List),
      gameIndices: List<dynamic>.from(map['game_indices'] as List),
      height: map['height'] as int,
      heldItems: List<dynamic>.from(map['held_items'] as List),
      id: map['id'] as int,
      isDefault: map['is_default'] as bool,
      locationAreaEncounters: map['location_area_encounters'] as String,
      moves: List<dynamic>.from(map['moves'] as List),
      name: map['name'] as String,
      order: map['order'] as int,
      pastTypes: List<dynamic>.from(map['past_types'] as List),
      species: Map<String, dynamic>.from(map['species'] as Map<String, dynamic>),
      sprites: map['sprites'] != null ? Sprites.fromMap(map['sprites'] as Map<String, dynamic>) : null,
      stats: map['stats'] != null ? List<Stats>.from((map['stats'] as List).map((x) => Stats.fromMap(x as Map<String, dynamic>))) : null,
      types: map['types'] != null ? List<Types>.from((map['types'] as List).map((x) => Types.fromMap(x as Map<String, dynamic>))) : null,
      weight: map['weight'] as int,
    );
  }

  factory Pokemon.fromJson(String source) => Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);

  final List<dynamic>? abilities;
  final int? baseExperience;
  final List<dynamic>? forms;
  final List<dynamic>? gameIndices;
  final int? height;
  final List<dynamic>? heldItems;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final List<dynamic>? moves;
  final String? name;
  final int? order;
  final List<dynamic>? pastTypes;
  final Map<String, dynamic>? species;
  // final Map<String, dynamic>? sprites;
  final Sprites? sprites;
  final List<Stats>? stats;
  final List<Types>? types;
  final int? weight;

  Pokemon copyWith({
    ValueGetter<List<dynamic>?>? abilities,
    ValueGetter<int?>? baseExperience,
    ValueGetter<List<dynamic>?>? forms,
    ValueGetter<List<dynamic>?>? gameIndices,
    ValueGetter<int?>? height,
    ValueGetter<List<dynamic>?>? heldItems,
    ValueGetter<int?>? id,
    ValueGetter<bool?>? isDefault,
    ValueGetter<String?>? locationAreaEncounters,
    ValueGetter<List<dynamic>?>? moves,
    ValueGetter<String?>? name,
    ValueGetter<int?>? order,
    ValueGetter<List<dynamic>?>? pastTypes,
    ValueGetter<Map<String, dynamic>?>? species,
    ValueGetter<Sprites?>? sprites,
    ValueGetter<List<Stats>?>? stats,
    ValueGetter<List<Types>?>? types,
    ValueGetter<int?>? weight,
  }) {
    return Pokemon(
      abilities: abilities != null ? abilities() : this.abilities,
      baseExperience: baseExperience != null ? baseExperience() : this.baseExperience,
      forms: forms != null ? forms() : this.forms,
      gameIndices: gameIndices != null ? gameIndices() : this.gameIndices,
      height: height != null ? height() : this.height,
      heldItems: heldItems != null ? heldItems() : this.heldItems,
      id: id != null ? id() : this.id,
      isDefault: isDefault != null ? isDefault() : this.isDefault,
      locationAreaEncounters: locationAreaEncounters != null ? locationAreaEncounters() : this.locationAreaEncounters,
      moves: moves != null ? moves() : this.moves,
      name: name != null ? name() : this.name,
      order: order != null ? order() : this.order,
      pastTypes: pastTypes != null ? pastTypes() : this.pastTypes,
      species: species != null ? species() : this.species,
      sprites: sprites != null ? sprites() : this.sprites,
      stats: stats != null ? stats() : this.stats,
      types: types != null ? types() : this.types,
      weight: weight != null ? weight() : this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'abilities': abilities,
      'baseExperience': baseExperience,
      'forms': forms,
      'gameIndices': gameIndices,
      'height': height,
      'heldItems': heldItems,
      'id': id,
      'isDefault': isDefault,
      'locationAreaEncounters': locationAreaEncounters,
      'moves': moves,
      'name': name,
      'order': order,
      'pastTypes': pastTypes,
      'species': species,
      'sprites': sprites?.toMap(),
      'stats': stats,
      'types': types?.map((x) => x.toMap()).toList(),
      'weight': weight,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Pokemon(abilities: $abilities, baseExperience: $baseExperience, forms: $forms, gameIndices: $gameIndices, height: $height, heldItems: $heldItems, id: $id, isDefault: $isDefault, locationAreaEncounters: $locationAreaEncounters, moves: $moves, name: $name, order: $order, pastTypes: $pastTypes, species: $species, sprites: $sprites, stats: $stats, types: $types, weight: $weight)';
  }

  @override
  List<Object?> get props {
    return [abilities, baseExperience, forms, gameIndices, height, heldItems, id, isDefault, locationAreaEncounters, moves, name, order, pastTypes, species, sprites, stats, types, weight];
  }
}
